#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <limits.h>
float absolute_number;
int absolutul(float); //absolute value function prototype
int power_of_e;
float raise_e(int); //returns e raised to the given power function prototype

int main()
{
    absolute_number = absolutul(absolute_number);
    printf("-----------------------------------\n");
    power_of_e = raise_e(power_of_e);
    printf("-----------------------------------\n");
    return 0;
}

//calculate and return the absolute value of a number
int absolutul(float absolute_number) {
    printf("Enter an absolute number.\n");
    scanf("%f", &absolute_number);
    printf("The absolute value of the number is: %d\n", abs(absolute_number));
    return abs(absolute_number);
}

//calculate and return the value of e raised to the given power
float raise_e(int power_of_e) {
    printf("Raise e at the power: \n");
    scanf("%d", &power_of_e);
    printf("e raised at power %d is: %f \n", power_of_e, exp(power_of_e));
    return abs(absolute_number);
}

