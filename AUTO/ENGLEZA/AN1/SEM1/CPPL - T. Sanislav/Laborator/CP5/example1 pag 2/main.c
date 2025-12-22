#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int square (int y)
{
    return y * y;
}

void cube_reference(double *number_ptr)
{
    *number_ptr= pow(*number_ptr, 3);
}

void print_mult_array (int size, int *ptr, int value)
{
    int i = 0;
    for (i = 0; i < size; i ++)
    {
        printf("\t %d", *ptr * value);
        ptr++;
    }
}

int main()
{
    printf("Hello world!\n");
    return 0;
}
