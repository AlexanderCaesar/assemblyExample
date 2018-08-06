//add by xiaoc 20180806
#include "../../primitives.h"

#include <immintrin.h>

int sumInstrinsic(int add1, int add2)
{
  __m128i a = _mm_set1_epi32(add1);
  __m128i b = _mm_set1_epi32(add2);

  __m128i s = _mm_add_epi32(a, b);
  int *p = (int *)&s;
  return p[0]+7;
}

void setupInstrinsicPrimitives(sum_example *s)
{
  *s = sumInstrinsic;
}