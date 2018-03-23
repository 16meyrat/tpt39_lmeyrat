#include <stdio.h>
#include <stdlib.h>
#include <iostream> // for standard I/O
#include <math.h>
#include <time.h>
#include <sys/time.h>
#include <CL/cl.h>
//#include <CL/cl_ext.h>
#include "common/AOCL_Utils.h"

#include "openclfilter.h"
#define STRING_BUFFER_LEN 1024
using namespace std;

using namespace aocl_utils;

static char char_buffer[STRING_BUFFER_LEN];
static cl_platform_id platform;
static cl_device_id device;
static cl_context context;
static cl_command_queue queue;
static cl_program program;
static cl_kernel kernel;


//--------------------------------------------------------------------
static size_t M=0, N=0;// max 50000000
cl_mem input_buf; // num_devices elements
cl_mem kernel33_buf;
cl_mem output_buf; // num_devices elements
int status;


void print_clbuild_errors(cl_program program,cl_device_id device)
	{
		cout<<"Program Build failed\n";
		size_t length;
		char buffer[2048];
		clGetProgramBuildInfo(program, device, CL_PROGRAM_BUILD_LOG, sizeof(buffer), buffer, &length);
		cout<<"--- Build log ---\n "<<buffer<<endl;
		exit(1);
	}
unsigned char ** read_file(const char *name) {
  size_t size;
  unsigned char **output=(unsigned char **)malloc(sizeof(unsigned char *));
  FILE* fp = fopen(name, "rb");
  if (!fp) {
    printf("no such file:%s",name);
    exit(-1);
  }

  fseek(fp, 0, SEEK_END);
  size = ftell(fp);
  fseek(fp, 0, SEEK_SET);

  *output = (unsigned char *)malloc(size);
  if (!*output) {
    fclose(fp);
    printf("mem allocate failure:%s",name);
    exit(-1);
  }

  if(!fread(*output, size, 1, fp)) printf("failed to read file\n");
  fclose(fp);
  return output;
}
long time_diff(struct timeval x , struct timeval y)
{
	//https://www.binarytides.com/get-time-difference-in-microtime-in-c/
    long x_ms , y_ms , diff;

    x_ms = (long)x.tv_sec*1000000 + (long)x.tv_usec;
    y_ms = (long)y.tv_sec*1000000 + (long)y.tv_usec;

    diff = (double)y_ms - (double)x_ms;

    return diff;
}

void callback(const char *buffer, size_t length, size_t final, void *user_data)
{
     fwrite(buffer, 1, length, stdout);
}

/*static cl_context_properties context_properties[] =
{
     CL_CONTEXT_PLATFORM, 0,
     CL_PRINTF_CALLBACK_ARM, (cl_context_properties)callback,
     CL_PRINTF_BUFFERSIZE_ARM, 0x1000,
     0
};*/

// Randomly generate a floating-point number between -10 and 10.
float rand_float() {
  return float(rand()) / float(RAND_MAX) * 20.0f - 10.0f;
}

int OCL_initialize(size_t _M, size_t _N){
  M = _M;
  N = _N;
  
  printf("OpenCL configured to process %u * %u images\n", M, N);
  
  clGetPlatformIDs(1, &platform, NULL);
  clGetPlatformInfo(platform, CL_PLATFORM_NAME, STRING_BUFFER_LEN, char_buffer, NULL);
  printf("%-40s = %s\n", "CL_PLATFORM_NAME", char_buffer);
  clGetPlatformInfo(platform, CL_PLATFORM_VENDOR, STRING_BUFFER_LEN, char_buffer, NULL);
  printf("%-40s = %s\n", "CL_PLATFORM_VENDOR ", char_buffer);
  clGetPlatformInfo(platform, CL_PLATFORM_VERSION, STRING_BUFFER_LEN, char_buffer, NULL);
  printf("%-40s = %s\n\n", "CL_PLATFORM_VERSION ", char_buffer);
  
  //context_properties[1] = (cl_context_properties)platform;
  clGetDeviceIDs(platform, CL_DEVICE_TYPE_ALL, 1, &device, NULL);
  context = clCreateContext(/*context_properties*/NULL, 1, &device, NULL, NULL, NULL);
  queue = clCreateCommandQueue(context, device, 0, NULL);

  /*unsigned char **opencl_program=read_file("kernel.cl");
  program = clCreateProgramWithSource(context, 1, (const char **)opencl_program, NULL, NULL);*/
	
	std::string binary_file = getBoardBinaryFile("kernel_sim", device);
  printf("Using AOCX: %s\n", binary_file.c_str());
  program = createProgramFromBinary(context, binary_file.c_str(), &device, 1);
	
  if (program == NULL)
{
      printf("Program creation failed\n");
      return 1;
}
  int success=clBuildProgram(program, 0, NULL, NULL, NULL, NULL);
if(success!=CL_SUCCESS) print_clbuild_errors(program,device);
  kernel = clCreateKernel(program, "convolve", NULL);
	
// Input buffers.


 kernel33_buf = clCreateBuffer(context, CL_MEM_READ_ONLY,
    3*3* sizeof(float), NULL, &status);
 checkError(status, "Failed to create buffer for convolution kernel");

 // Output buffer.
 output_buf = clCreateBuffer(context, CL_MEM_WRITE_ONLY,
     M*N* sizeof(float), NULL, &status);
 checkError(status, "Failed to create buffer for output");
 
 //set kernel argument
 
 unsigned argi = 1;
 
 status = clSetKernelArg(kernel, argi++, sizeof(cl_mem), &kernel33_buf);
 checkError(status, "Failed to set argument 2");

 status = clSetKernelArg(kernel, argi++, sizeof(cl_mem), &output_buf);
 checkError(status, "Failed to set argument 3");


return 0;
}

int OCL_Convolve(float* input, const float* kernel33, float* output)
{

	//struct timeval stop, start;
  
    //gettimeofday(&start, NULL);	
				
    cl_event write_event[2];
    cl_event kernel_event, finish_event ;
    
    input_buf = clCreateBuffer(context, CL_MEM_READ_ONLY,
       M*N* sizeof(float), NULL, &status);
    checkError(status, "Failed to create buffer for input");

    status = clEnqueueWriteBuffer(queue, input_buf, CL_FALSE,
        0, M*N* sizeof(float), input,0, NULL, &write_event[0]);
    checkError(status, "Failed to transfer input");
    
    status = clSetKernelArg(kernel,0, sizeof(cl_mem), &input_buf);
    checkError(status, "Failed to set argument 1");
    
    status = clEnqueueWriteBuffer(queue, kernel33_buf, CL_FALSE,
        0, 3*3* sizeof(float), kernel33,0, NULL, &write_event[1	]);
    checkError(status, "Failed to transfer input B");
      

    const size_t global_work_size[] = {M, N};
		//const size_t work_group_size[] = {1, 1};
    


    status = clEnqueueNDRangeKernel(queue, kernel, 2, NULL,
        global_work_size, NULL, 1, write_event, &kernel_event);
		//gettimeofday(&stop, NULL);
    checkError(status, "Failed to launch kernel");
		
		//printf ("GPU  took %lu µs to run.\n", time_diff(start, stop ));
        
    // Read the result. This the final operation.
		//gettimeofday(&start, NULL);
    status = clEnqueueReadBuffer(queue, output_buf, CL_TRUE,
        0, M*N* sizeof(float), output, 1, &kernel_event, &finish_event);
			
			//gettimeofday(&stop, NULL);
			//printf ("final GPU buffer operation took %lu µs to run.\n", time_diff(start, stop ));
			
  clReleaseEvent(write_event[0]);
  clReleaseEvent(write_event[1]);
  clReleaseEvent(kernel_event);
  clReleaseEvent(finish_event);
  clReleaseMemObject(input_buf);
	

     return 0;
}

void cleanup(){
  clReleaseKernel(kernel);
  clReleaseCommandQueue(queue);  
  clReleaseMemObject(kernel33_buf);
  clReleaseMemObject(output_buf);
  clReleaseProgram(program);
  clReleaseContext(context);
}
