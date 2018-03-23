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


float* concatenateVideoIntoOneFloatFrame(VideoCapture& camera){
    int nbFrame  = camera.get( CV_CAP_PROP_FRAME_COUNT);
    int width = (int) camera.get(CV_CAP_PROP_FRAME_WIDTH);    // Acquire input size
    int height = (int) camera.get(CV_CAP_PROP_FRAME_HEIGHT);
    float* result = (float*)malloc(sizeof(float)*nbFrame*width*height);
    int count = 0;
    while (true) {
        Mat cameraFrame, grayframe,floatFrame;
		     if(count > 299) break;
         camera >> cameraFrame;
         cvtColor(cameraFrame, grayframe, CV_BGR2GRAY);
         grayframe.convertTo(floatFrame, CV_32FC1);
         memcpy(result + count*width*height , floatFrame.data, sizeof(float)*height*width);//append this image to the mozaic
         count++;
      }
      cout<<"test"<<result[100*width*height+3000]<<endl;
      return result;
         
}
void writeVideoFromImageMozaic(VideoWriter& output, Mat& videoMozaic, int width, int height, int frames){
  for(int i=0; i<frames; i++){
    
    Mat frameFloat = videoMozaic.rowRange(i*height, (i+1)*height);
    printf("%f\n", frameFloat.at<float>(300, 200));
    Mat ucharFrame, displayframe;
    frameFloat.convertTo(ucharFrame, CV_8UC1);
    cvtColor(ucharFrame, displayframe, CV_GRAY2BGR);
    output<<displayframe;
    
  }
}

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
    #ifdef CPU
    while (true) {
        Mat cameraFrame,displayframe;
		count=count+1;
		if(count > 299) break;
        camera >> cameraFrame;
		time (&start);
        Mat filterframe = Mat(cameraFrame.size(), CV_8UC3);
        Mat grayframe,edge_x,edge_y,edge;
    	cvtColor(cameraFrame, grayframe, CV_BGR2GRAY);
      
      
    	GaussianBlur(grayframe, grayframe, Size(3,3),0,0);
    	GaussianBlur(grayframe, grayframe, Size(3,3),0,0);
    	GaussianBlur(grayframe, grayframe, Size(3,3),0,0);
  
		Scharr(grayframe, edge_x, CV_8U, 0, 1, 1, 0, BORDER_DEFAULT );
		Scharr(grayframe, edge_y, CV_8U, 1, 0, 1, 0, BORDER_DEFAULT );
		addWeighted( edge_x, 0.5, edge_y, 0.5, 0, edge );
		
        cvtColor(edge, displayframe, CV_GRAY2BGR);
		outputVideo << displayframe;

    time (&end);
	#ifdef SHOW
        imshow(windowName, displayframe);
	#endif
		diff = difftime (end,start);
		tot+=diff;
	}
  #endif
  
  #ifdef GPU
    float* videoMozaic = concatenateVideoIntoOneFloatFrame(camera);
    int frameCount = camera.get( CV_CAP_PROP_FRAME_COUNT);
    Mat videoMatrix((camera.get(CV_CAP_PROP_FRAME_HEIGHT)*frameCount), camera.get(CV_CAP_PROP_FRAME_WIDTH), CV_32FC1, videoMozaic);
    time (&start);
    
    OCL_initialize(camera.get(CV_CAP_PROP_FRAME_WIDTH), camera.get(CV_CAP_PROP_FRAME_HEIGHT), frameCount);
    const float GaussianKernel[] = {1./16, 2./16, 1./16,
                                    2./16, 4./16, 2./16,
                                    1./16, 2./16, 1./16};
    const float ScharrKernelV[] = {+3., 0., -3.,
                                +10., 0., -10.,
                                +3., 0., -3.};
                                
    const float ScharrKernelH[] = {+3., +10., +3.,
                                0., 0., 0,
                                -3., -10., -3.};
  
  
    Mat edge_x = Mat(videoMatrix.size(), CV_32FC1);
    Mat edge_y = Mat(videoMatrix.size(), CV_32FC1);

    OCL_Convolve((float*)videoMatrix.data, GaussianKernel, (float*)videoMatrix.data);
    OCL_Convolve((float*)videoMatrix.data, GaussianKernel, (float*)videoMatrix.data);
    OCL_Convolve((float*)videoMatrix.data, GaussianKernel, (float*)videoMatrix.data);
    OCL_Convolve((float*)videoMatrix.data, ScharrKernelH, (float*)edge_x.data);
    OCL_Convolve((float*)videoMatrix.data, ScharrKernelV, (float*)edge_y.data);
    addWeighted( edge_x, 0.5, edge_y, 0.5, 0, videoMatrix );
    
    time (&end);
    tot = difftime(end, start);
    
    writeVideoFromImageMozaic(outputVideo, videoMatrix, camera.get(CV_CAP_PROP_FRAME_WIDTH), camera.get(CV_CAP_PROP_FRAME_HEIGHT), frameCount);
  
    OCL_finalize();
    free(videoMozaic);
  #endif
	outputVideo.release();
	camera.release();
  	printf ("FPS %.2lf .\n", 299.0/tot );

    return EXIT_SUCCESS;

}
