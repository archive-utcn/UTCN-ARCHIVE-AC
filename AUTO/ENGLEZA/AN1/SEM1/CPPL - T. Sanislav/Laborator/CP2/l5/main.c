#include <stdio.h>
#include <stdlib.h>

int main()
{
    int integer_no = 5;
    float float_no = integer_no / 6;


    printf("float_no = %.2f\n", float_no);
    float_no = (float)integer_no / 6;
    printf("float_no = %.2f\n", float_no);

    return 0;
}
