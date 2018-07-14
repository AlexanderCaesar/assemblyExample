//add by xiaoc 20180714
#include <stdio.h>

#include "primitives.h"

int main()
{
  Param param;
  int add1 = 2018;
  int add2 = 1989;

  setup_primitives(&param);

  int added = sum_ex(add1, add2);

  printf("%d + %d = %d\n", add1, add2, added);

  return 0;
}