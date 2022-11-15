kernel void vecAdd(device float2 *a,
                   device float2 *b,
                   device float2 *c,
                   constant uint *n)
{
  // Get our global thread ID
  uint id = 5;

  // Make sure we do not go out of bounds
  if (id < n[0]) {
    c[id] = a[id] + b[id];
  }
}
