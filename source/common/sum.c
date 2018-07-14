//add by xiaoc 20180714
#include "../primitives.h"

int sum2(int add1, int add2);

void setupPixelPrimitives_c(sum_example *s)
{
  *s = sum2;
}

int sum2(int add1, int add2)
{
  int added = add1 + add2;
  return added + 1;
}
