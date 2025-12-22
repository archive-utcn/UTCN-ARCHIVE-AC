/* Program L04Ex2.c */
/* Computes of the roots of the equation a*x^2 +b*x +c =0 */
#include <stdio.h>
#include <math.h>
int main()
{
    float a, b, c, delta, x1, x2;
    printf("\nComputes of the roots of the equation\n\ta*x^2 +b*x +c =0\n");
    printf("Please input values for a, b, and c\n");
    scanf("%f %f %f", &a, &b, &c);
    if (a!=0)
    {
        delta=b*b-4*a*c;
        if (delta >= 0)
        {
            x1=(-b-sqrt(delta))/(2*a);
            x2=(-b+sqrt(delta))/(2*a);
            printf("\nThe equation has the roots x1=%g and x2=%g\n", x1, x2);
        }
        else
        {
            x1=-b/(2*a);
            x2=sqrt(-delta)/(2*a);
            printf("\n\nThe equation has complex roots x1=%g-j*%g and x2=%g+j*%g\n", x1, x2, x1, x2);
        }
    }
    else printf("\nEquation is not of second order (i.e. a=0)\n");
    return 0;
}
