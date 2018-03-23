#ifndef OPENCL_FILTER_H
#define OPENCL_FILTER_H

int OCL_Convolve(float* input, const float* kernel33, float* output);

int OCL_initialize(size_t M, size_t N, size_t frames);

void OCL_finalize();

#endif