#include <stdio.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define PI 3.14

void function1(double radius, int x)
{
    printf("You choosed number %d (circumference of a circle). ", x);
    float circ=2*PI*radius;
    printf("The circumference with the radius %.lf is: %.2lf.\n", radius, circ);
}
void function2(double radius, int y)
{
    printf("You choosed number %d (are of a circle)\n", y);
    float area=PI*(radius*radius);
    printf("The area with the radius %.lf is: %.2lf.\n", radius, area);
}
void function3(double radius, int z)
{
    printf("You choosed number %d (volume of a sphere)\n", z);
    float volume=((3/4.0)*PI*pow(radius,3));
    printf("The volume with the radius %.lf is: %.2lf.\n", radius, volume);
}

int main()
{
    void(*f_ptr[3])(double, int) = {function1,function2,function3};

    int choice = 0;
    double radius = 0;

    printf("Enter a number between 1 (area), 2 (circumference) and 3 (volume of a sphere) or 4 to end: ");
    scanf("%d", &choice);
    printf("Enter a radius: ");
    scanf("%lf", &radius);

    while (choice >=1 && choice <4)
    {
        (*f_ptr[choice-1])(radius,choice);
        printf("Enter a number between 1 (area), 2 (circumference) and 3 (volume of a sphere) or 4 to end: ");
        scanf("%d",&choice);
    }
    return 0;
}
