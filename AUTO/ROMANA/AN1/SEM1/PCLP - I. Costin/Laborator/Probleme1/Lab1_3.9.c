#include<stdio.h>
int main(void)
{
    float x,y;
    printf("x=");
    scanf("%f",&x);
    printf("y=");
    scanf("%f",&y);
    printf("x       y      x+y      x-y      x*y      x/y\n");
    printf("%3.2f",x);
    printf("   %3.2f",y);
    printf("   %3.2f",x+y);
    printf("   %3.2f",x-y);
    printf("   %3.2f",x*y);
    printf("   %3.2f",x/y);
    return(0);
}
