#include <stdio.h>
#include <math.h>

double cube_value(double number)
{
    return pow(number,3);
}

int main()
{
    double number = 5.0;
    printf("The original value of number is %.2f.\n",number);
    number = cube_value(number);
    printf("The new value of number is %.2f.\n",number);
    return 0;
}


