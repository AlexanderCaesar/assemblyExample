//add by xiaoc 20180714
#include <stdio.h>

#include "primitives.h"

int main()
{
  int add1 = 1;
  int add2 = 2;

  setup_primitives();

  int added = sum_ex(add1, add2);

  printf("%d + %d = %d\n", add1, add2, added);

  return 0;
}