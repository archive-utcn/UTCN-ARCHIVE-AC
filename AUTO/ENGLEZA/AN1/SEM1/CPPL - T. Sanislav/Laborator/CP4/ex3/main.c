#include <stdio.h>
#include <stdlib.h>

int main()
{
   double value1 = 50.0;
   double value2;
   double *double_ptr = &value1;
   printf("The value of Value1 is %f\n", *double_ptr);
   value2 = *double_ptr;
   printf("Value2 is %f\n", value2);
   printf("The addres of value1 is %p\n", &value1);  //0060FF00 - if i dont put & at the next printf i get 0060FEF8
   printf("The addres stored in double_ptr is %p\n", double_ptr); //with & -0060FEFC,  without is 0060FEF8

    return 0;
}
