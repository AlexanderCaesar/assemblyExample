//add by xiaoc 20180714

#include "primitives.h"

sum_example sum_ex;

void setupPixelPrimitives_c(sum_example *s); //Equivalent header file

void setup_primitives(Param* param)
{
  setupPixelPrimitives_c(&sum_ex); //setup c function
}