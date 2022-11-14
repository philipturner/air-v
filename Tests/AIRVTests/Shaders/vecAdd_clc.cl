__kernel void vecAdd(__global float * restrict a,
                     __global float * restrict b,
                     __global float * restrict c,
                     __constant unsigned int * restrict n)
{
  // Get our global thread ID
  unsigned int id = 5;

  // Make sure we do not go out of bounds
  if (id < n[0]) {
    c[id] = a[id] + b[id];
  }
}
