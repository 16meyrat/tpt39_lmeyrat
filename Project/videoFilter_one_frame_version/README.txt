This is another version of the video filter program for gpu : 
instead of computing frames one by ones, all the frame of the video are concatenate into one 3D image, then this image is processed by the 5 filters.

FPS increases up to 42.7, which is 2 times faster than the CPU : it once again shows that memory transfer and conversion are faster on single large data than on several small data