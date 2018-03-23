__kernel void vector_add(__global const float *x,
                        __global const float *y,
                        __global float *restrict z)
{
    size_t i = get_global_id(0);
    z[i] = x[i] + y[i];

}
__kernel void vector_sum(__global const float *vect,
                        __global float *restrict res)
{
  for(int i=0; i<get_local_size(0); i++){
    res[get_group_id(0)] += vect[ get_local_size(0)*get_group_id(0)+i];
  }
    
}


