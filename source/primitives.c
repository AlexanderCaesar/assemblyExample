//add by xiaoc 20180714

#include "primitives.h"

sum_example sum_ex;

void setupPixelPrimitives_c(sum_example *s); //Equivalent header file
void setupAssemblyPrimitives(sum_example *s);

void setup_primitives()
{
  setupPixelPrimitives_c(&sum_ex); //setup c function

#if ARCH_X86
  setupAssemblyPrimitives(&sum_ex);
#endif


#if ANDROID
  setupAssemblyPrimitives(&sum_ex);
#endif


}
