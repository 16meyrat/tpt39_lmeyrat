You can switch between CPU and GPU by turning "#define CPU" into "#define GPU"

both program have a similar output, resulting from 3 Gauss filter and 1 Scharr filter

CPU program runs at ~ 27.0fps
GPU program runs at ~ 18.7fps

It means that the GPU programm is 30% slower than the opencv one.
It is probably caused by the numerous buffer copy which are done between every filter, the image conversion into floats, and the opencl launch overhead