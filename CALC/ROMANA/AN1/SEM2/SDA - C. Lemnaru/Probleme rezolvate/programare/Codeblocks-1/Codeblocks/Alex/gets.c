#include<stdio.h>
#include<conio.h>

double f(double x)
{
    return(3*x*x+2*x-1);
}
double fc(double s,double(*p)(double a))
{
    s=(*p)(a);
}
void main()
{
    double b;
    printf("\n a=");
    scanf("%lf",&a);
    printf("\n Functia: %lf",fc(b,f));
}
