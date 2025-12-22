#include<stdio.h>
void main()
{
    double x;
    double n;
    printf("x=");
    scanf("%lf",&x);
    printf("n=");
    scanf("%lf",&n);
    printf("%lf",x=(x<<(7-n))>>7);
}
