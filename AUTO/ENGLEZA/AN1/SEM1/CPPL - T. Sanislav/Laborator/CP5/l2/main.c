#include <stdio.h>
#include <math.h>

void cube_reference(double *number_ptr)
{
    *number_ptr = pow(*number_ptr, 3);
}

int main()
{
    double number = 5.0;
    printf("The original value of number is %.2f.\n",number);
    cube_reference(&number);
    printf("The new value of number is %.2f.\n",number);
    return 0;
}


