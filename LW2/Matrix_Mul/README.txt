At first, the GPU seemed to outperform the GPU, but it was because I was benchmarking a non blocking call
Matrix Multiplication: N = 512
  CPU took 426874 us to run.
  GPU buffer operations took 00000784 useconds to run.
  GPU  took 2275 µs to run.
  CPU and GPU returned the same result
 
With a blocking call to GPU, the results are reversed : 
  CPU took 292623 us to run.
  GPU buffer operations took 00000724 useconds to run.
  GPU  took 2201354 µs to run.
  final GPU buffer operation took 3887 µs to run.
  CPU and GPU returned the same result

With a buffer copy into GPU ram space, buffer operation are slower, but there is no improvement in computing time
  CPU took 278709 us to run.
  GPU buffer operations took 00005837 useconds to run.
  GPU  took 2159493 µs to run.
  final GPU buffer operation took 3356 µs to run.
  CPU and GPU returned the same result

By not passing matrix size as an argument by reference, but as a constant, performance increases drastically : 
CPU is still 3 time  faster than GPU
    CPU took 278786 us to run.

    GPU buffer operations took 00005534 useconds to run.
    GPU  took 781994 µs to run.
    final GPU buffer operation took 3373 µs to run.
    CPU and GPU returned the same result

By setting manually the work_grou_size to 16*16, performance slightly increases:
    CPU took 278907 us to run.
    GPU buffer operations took 00005442 useconds to run.
    GPU  took 620047 µs to run.
    final GPU buffer operation took 3439 µs to run.
    CPU and GPU returned the same result

With a 512*512 matrix, GPU is 3x faster than CPU :    
    Input generation took 99569 us to run.
    CPU took 1909732 us to run.
    GPU buffer operations took 00000749 useconds to run.
    GPU  took 600282 µs to run.
    final GPU read buffer operation took 3173 µs to run.
    CPU and GPU returned the same result

  
With a Matrix of 1024*1024, GPU takes about the same time while CPU is highly affected  
    CPU took 16994970 us to run.
    GPU buffer operations took 00020703 useconds to run.
    GPU  took 804390 µs to run.
    final GPU buffer operation took 12600 µs to run.
    CPU and GPU returned the same result

With a Matrix of 2048*2048, the GPU is 12 times faster than CPU
    Input generation took 1647663 us to run.
    CPU took 830787789 us to run.
    GPU buffer operations took 00018193 useconds to run.
    GPU  took 68464913 µs to run.
    final GPU buffer operation took 49092 µs to run.
    CPU and GPU returned the same result
    




