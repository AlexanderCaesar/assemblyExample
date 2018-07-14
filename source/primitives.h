//add by xiaoc 20180714

typedef struct Param
{
  int use_c_function;
}Param;
typedef int(*sum_example)(int add1 ,int add2);

/* This copy of the table is what gets used by the encoder */
extern sum_example sum_ex;

void setup_primitives(Param* param);
void setupCPrimitives(sum_example *s);