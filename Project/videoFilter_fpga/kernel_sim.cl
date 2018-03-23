#pragma OPENCL SELECT_ROUNDING_MODE rte

__kernel void convolve(__global const float * restrict input, 
                        __global const float* restrict kernel33,
                        __global float * restrict output)
{
  const int i = get_global_id(0);
  const int j = get_global_id(1);
  
  const int w = get_global_size(0);
  const int h = get_global_size(1);
  
  float res = 0;
  
    //unwrap loop for perforamance
    
    if(j>0){
      if(i>0)
      res += input[w * (j-1) + (i-1)] * kernel33[0];
      
      res += input[w * (j-1) + i] * kernel33[1];
      
      if(i<w)
      res += input[w * (j-1) + (i+1)] * kernel33[2];
    }
    
    
    if(i>0)
    res += input[w * j + (i-1)] * kernel33[3];
    
    //no if
    res += input[w * j + i] * kernel33[4];
    
    if(i<w)
    res += input[w * j + (i+1)] * kernel33[5];
    
    if(j<h){
      if(i>0)
      res += input[w * (j+1) + (i-1)] * kernel33[6];
      
      res += input[w * (j+1) + i] * kernel33[7];
      
      if(i<w)
      res += input[w * (j+1) + (i+1)] * kernel33[8];
  }
  
  output[w*j+i] = res;

//loop version, slower
/*  for(int x=i-1; x<=i+1;x++){
    if(x>=0 && x<w){      
      for(int y=j-1; y<=j+1; y++){
        if(y>=0 && y<get_global_size(1)){
          output[w * j  + i ] += input[w * y + x] * kernel33[(x-i+1)*3 + y-j+1];
          
        }
      }
    }    
  }*/
    
}
