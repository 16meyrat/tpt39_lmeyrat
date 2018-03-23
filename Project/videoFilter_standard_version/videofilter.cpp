#include <stdio.h>
#include <stdlib.h>
#include <iostream> // for standard I/O
#include <fstream>
#include <time.h>
#include "opencv2/opencv.hpp"
#include "openclfilter.h"

using namespace cv;
using namespace std;
#define SHOW
#define GPU
int main(int, char**)
{
    VideoCapture camera("./bourne.mp4");
    if(!camera.isOpened())  // check if we succeeded
        return -1;
          
    const string NAME = "./output.avi";   // Form the new name with container
    int ex = static_cast<int>(CV_FOURCC('M','J','P','G'));
    Size S = Size((int) camera.get(CV_CAP_PROP_FRAME_WIDTH),    // Acquire input size
                  (int) camera.get(CV_CAP_PROP_FRAME_HEIGHT));
	//Size S =Size(1280,720);
	
    VideoWriter outputVideo;                                        // Open the output
        outputVideo.open(NAME, ex, 25, S, true);

    if (!outputVideo.isOpened())
    {
        cout  << "Could not open the output video for write: " << NAME << endl;
        return -1;
    }
	time_t start,end;
	double diff,tot = 0;
	int count=0;
	const char *windowName = "filter";   // Name shown in the GUI window.
    #ifdef SHOW
    namedWindow(windowName); // Resizable window, might not work on Windows.
    #endif
    
    #ifdef GPU
    OCL_initialize(camera.get(CV_CAP_PROP_FRAME_WIDTH), camera.get(CV_CAP_PROP_FRAME_HEIGHT));
    const float GaussianKernel[] = {1./16, 2./16, 1./16,
                                    2./16, 4./16, 2./16,
                                    1./16, 2./16, 1./16};
    const float ScharrKernelV[] = {+3., 0., -3.,
                                +10., 0., -10.,
                                +3., 0., -3.};
                                
    const float ScharrKernelH[] = {+3., +10., +3.,
                                0., 0., 0,
                                -3., -10., -3.};
    #endif
    
    while (true) {
        Mat cameraFrame,displayframe;
		count=count+1;
		if(count > 299) break;
        camera >> cameraFrame;
		time (&start);
        Mat filterframe = Mat(cameraFrame.size(), CV_8UC3);
        Mat grayframe,edge_x,edge_y,edge;
    	cvtColor(cameraFrame, grayframe, CV_BGR2GRAY);
      
      #ifdef CPU
    	GaussianBlur(grayframe, grayframe, Size(3,3),0,0);
    	GaussianBlur(grayframe, grayframe, Size(3,3),0,0);
    	GaussianBlur(grayframe, grayframe, Size(3,3),0,0);
  
		Scharr(grayframe, edge_x, CV_8U, 0, 1, 1, 0, BORDER_DEFAULT );
		Scharr(grayframe, edge_y, CV_8U, 1, 0, 1, 0, BORDER_DEFAULT );
		addWeighted( edge_x, 0.5, edge_y, 0.5, 0, edge );
		
        cvtColor(edge, displayframe, CV_GRAY2BGR);
		outputVideo << displayframe;
    #endif

#ifdef GPU
  Mat floatFrame;
  edge = Mat(cameraFrame.size(), CV_32FC1);
  edge_x = Mat(cameraFrame.size(), CV_32FC1);
  edge_y = Mat(cameraFrame.size(), CV_32FC1);
  grayframe.convertTo(floatFrame, CV_32FC1);
  OCL_Convolve((float*)floatFrame.data, GaussianKernel, (float*)floatFrame.data);
  OCL_Convolve((float*)floatFrame.data, GaussianKernel, (float*)floatFrame.data);
  OCL_Convolve((float*)floatFrame.data, GaussianKernel, (float*)floatFrame.data);
  OCL_Convolve((float*)floatFrame.data, ScharrKernelH, (float*)edge_x.data);
  OCL_Convolve((float*)floatFrame.data, ScharrKernelV, (float*)edge_y.data);
  addWeighted( edge_x, 0.5, edge_y, 0.5, 0, edge );
  edge.convertTo(grayframe, CV_8UC1);
  cvtColor(grayframe, displayframe, CV_GRAY2BGR);
  outputVideo << displayframe;
#endif
time (&end);
	#ifdef SHOW
        imshow(windowName, displayframe);
	#endif
		diff = difftime (end,start);
		tot+=diff;
	}
  
  #ifdef GPU
    OCL_finalize();
  #endif
	outputVideo.release();
	camera.release();
  	printf ("FPS %.2lf .\n", 299.0/tot );

    return EXIT_SUCCESS;

}
