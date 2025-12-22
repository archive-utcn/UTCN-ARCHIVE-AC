#include <stdio.h>
#include <stdlib.h>

int main()
{
    int var1 = 5;
    int *int_ptr = &var1;

    printf("Address of var1 : %d\n", &var1);
    printf("Value of int_ptr : %d\n", int_ptr);
    printf("Address of int_ptr : %d\n", &int_ptr);
    printf("Value of var1 : %d\n", *int_ptr);
    printf("Value of *int_ptr : %d\n", *int_ptr);
    printf("Value of &*int_ptr: %d and of *&int_ptr : %d\n", &*int_ptr, *&int_ptr);

    int num1 = 20;   //pointer to a constant
    int num2 = 5;
    int const *ptr = &num1;
    printf("%d %d\n", ptr, *ptr);
//    *ptr = 20; error
    ptr++;
    printf("%d %d\n", ptr, *ptr);
    ptr = &num2;

    printf("%d %d\n", ptr, *ptr);

    int valu = 4;        //constant pointer
    int *const point = &valu;
    printf("%d\n", valu);
    *point = 20;
   // point++; error
    printf("%d\n", valu);

    return 0;
}
