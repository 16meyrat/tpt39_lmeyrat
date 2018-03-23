__kernel void vector_add(__global const float *x,
                        __global const float *y,
                        __global float *restrict z)
{
    size_t i = get_global_id(0);
    z[i] = x[i] + y[i];

}

__kernel void matrix_mul(__global const float *A,
                        __global const float *B,
                        __global float *restrict M)
{
    int N = get_global_size(0);
    int i = get_global_id(0);
    int j = get_global_id(1);
    __global float* current = &M[i* N+j];
    for(unsigned z=0; z<N; z++){
        *current+=A[i* N+z]*B[z* N+j];
    }
    //printf("%d - %d\n", i, j);
}


