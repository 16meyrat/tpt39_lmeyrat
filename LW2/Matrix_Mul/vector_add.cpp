#include <stdio.h>
#include <stdlib.h>
#include <iostream> // for standard I/O
#include <math.h>
#include <time.h>
#include <sys/time.h>
#include <CL/cl.h>
#include <CL/cl_ext.h>
#define STRING_BUFFER_LEN 1024
using namespace std;




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


void checkError(int status, const char *msg) {
	if(status!=CL_SUCCESS)
		printf("%s\n",msg);
}

// Randomly generate a floating-point number between -10 and 10.
float rand_float() {
  return float(rand()) / float(RAND_MAX) * 20.0f - 10.0f;
}

int main()
{
     char char_buffer[STRING_BUFFER_LEN];
     cl_platform_id platform;
     cl_device_id device;
     cl_context context;
     cl_context_properties context_properties[] =
     {
          CL_CONTEXT_PLATFORM, 0,
          CL_PRINTF_CALLBACK_ARM, (cl_context_properties)callback,
          CL_PRINTF_BUFFERSIZE_ARM, 0x1000,
          0
     };
     cl_command_queue queue;
     cl_program program;
     cl_kernel kernel;



//--------------------------------------------------------------------
const unsigned long N = 512;// max 50000000
const char* openCLOption = "-cl-no-signed-zeros -cl-fast-relaxed-math -cl-mad-enable";
float *input_a=(float *) malloc(sizeof(float)*N*N);
float *input_b=(float *) malloc(sizeof(float)*N*N);
float *output=(float *) malloc(sizeof(float)*N*N);
float *ref_output=(float *) malloc(sizeof(float)*N*N);
cl_mem input_a_buf; // num_devices elements
cl_mem input_b_buf; // num_devices elements
cl_mem output_buf; // num_devices elements
int status;

	struct timeval stop, start;

gettimeofday(&start, NULL);
	for(unsigned long j = 0; j < N*N; ++j) {
	      input_a[j] = rand_float();
	      input_b[j] = rand_float();
	 }
	 
	 gettimeofday(&stop, NULL);

 		printf ("Input generation took %lu us to run.\n", time_diff(start, stop ));


	gettimeofday(&start, NULL);
	//CPU PROCESSING
	float* current;
	for(unsigned i = 0; i < N; ++i) {
		for(unsigned j = 0; j < N; ++j) {
	      current = &ref_output[N*i+j];
				for(unsigned z = 0; z < N; ++z){
					*current += input_a[N*i+z]*input_b[N*z+j];
				}
	      	
	    }
		}
		//END OF CPU PROCESSING

	gettimeofday(&stop, NULL);

		printf ("CPU took %lu us to run.\n", time_diff(start, stop ));

     clGetPlatformIDs(1, &platform, NULL);
     clGetPlatformInfo(platform, CL_PLATFORM_NAME, STRING_BUFFER_LEN, char_buffer, NULL);
     printf("%-40s = %s\n", "CL_PLATFORM_NAME", char_buffer);
     clGetPlatformInfo(platform, CL_PLATFORM_VENDOR, STRING_BUFFER_LEN, char_buffer, NULL);
     printf("%-40s = %s\n", "CL_PLATFORM_VENDOR ", char_buffer);
     clGetPlatformInfo(platform, CL_PLATFORM_VERSION, STRING_BUFFER_LEN, char_buffer, NULL);
     printf("%-40s = %s\n\n", "CL_PLATFORM_VERSION ", char_buffer);

     context_properties[1] = (cl_context_properties)platform;
     clGetDeviceIDs(platform, CL_DEVICE_TYPE_GPU, 1, &device, NULL);
     context = clCreateContext(context_properties, 1, &device, NULL, NULL, NULL);
     queue = clCreateCommandQueue(context, device, 0, NULL);

     unsigned char **opencl_program=read_file("vector_add.cl");
     program = clCreateProgramWithSource(context, 1, (const char **)opencl_program, NULL, NULL);
     if (program == NULL)
	{
         printf("Program creation failed\n");
         return 1;
	}
     int success=clBuildProgram(program, 0, NULL, openCLOption, NULL, NULL);
	 if(success!=CL_SUCCESS) print_clbuild_errors(program,device);
     kernel = clCreateKernel(program, "matrix_mul", NULL);
 // Input buffers.
 		gettimeofday(&start, NULL);

    input_a_buf = clCreateBuffer(context, CL_MEM_READ_ONLY|CL_MEM_USE_HOST_PTR,
       N*N* sizeof(float), input_a, &status);
    checkError(status, "Failed to create buffer for input A");

    input_b_buf = clCreateBuffer(context, CL_MEM_READ_ONLY|CL_MEM_USE_HOST_PTR,
        N*N* sizeof(float), input_b, &status);
    checkError(status, "Failed to create buffer for input B");


		
    // Output buffer.
    output_buf = clCreateBuffer(context, CL_MEM_WRITE_ONLY,
        N*N* sizeof(float), NULL, &status);
    checkError(status, "Failed to create buffer for output");



    // Transfer inputs to each device. Each of the host buffers supplied to
    // clEnqueueWriteBuffer here is already aligned to ensure that DMA is used
    // for the host-to-device transfer.
	cl_event kernel_event,finish_event;

    // Set kernel arguments.
    unsigned argi = 0;

    status = clSetKernelArg(kernel, argi++, sizeof(cl_mem), &input_a_buf);
    checkError(status, "Failed to set argument 1");

    status = clSetKernelArg(kernel, argi++, sizeof(cl_mem), &input_b_buf);
    checkError(status, "Failed to set argument 2");

    status = clSetKernelArg(kernel, argi++, sizeof(cl_mem), &output_buf);
    checkError(status, "Failed to set argument 2");
		clFinish(queue);
		
		gettimeofday(&stop, NULL);
		printf ("GPU buffer operations took %.8lu useconds to run.\n", time_diff(start, stop ));
    const size_t global_work_size[] = {N, N};
		const size_t work_group_size[] = {16, 16};

		gettimeofday(&start, NULL);

    status = clEnqueueNDRangeKernel(queue, kernel, 2, NULL,
        global_work_size, work_group_size, 0, NULL, &kernel_event);
		clFinish(queue);
		gettimeofday(&stop, NULL);
    checkError(status, "Failed to launch kernel");
		
		printf ("GPU  took %lu µs to run.\n", time_diff(start, stop ));
    // Read the result. This the final operation.
		gettimeofday(&start, NULL);
    status = clEnqueueReadBuffer(queue, output_buf, CL_TRUE,
        0, N*N* sizeof(float), output, 1, &kernel_event, &finish_event);
			
			gettimeofday(&stop, NULL);
			printf ("final GPU buffer operation took %lu µs to run.\n", time_diff(start, stop ));
			
// Verify results.
bool pass = true;

for(unsigned j = 0; j < N*N && pass; ++j) {
      if(fabsf(output[j] - ref_output[j]) > 1.0e-5f) {
        printf("Failed verification @ index %d\nOutput: %f\nReference: %f\n",
            j, output[j], ref_output[j]);
        pass = false;
      }
}
if(pass){
	printf("CPU and GPU returned the same result\n");
}

clReleaseKernel(kernel);
clReleaseCommandQueue(queue);
clReleaseMemObject(input_a_buf);
clReleaseMemObject(input_b_buf);
clReleaseMemObject(output_buf);
clReleaseProgram(program);
clReleaseContext(context);

     return 0;
}
