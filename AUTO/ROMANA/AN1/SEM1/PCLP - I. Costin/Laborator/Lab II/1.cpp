#include <stdio.h>
#include <conio.h>
#include <math.h>

int main()
{
    double x,y,z;
    z=0;//*we initiliaze z with 0; z is the variable in which we calculate x**y
    printf("\n Please input the value of x\n");//*we read the numbers x and y
    scanf("%5lf",&x);
    printf("\n Please input the value of y\n");
    scanf("%5lf",&y);
    z=pow(x,y);//*we use the function pow to calculate x**y, which is a predefined function
    printf("\n The value of output x**y is: %6.3lf\n",z);//*we display the result
    getch();
}
