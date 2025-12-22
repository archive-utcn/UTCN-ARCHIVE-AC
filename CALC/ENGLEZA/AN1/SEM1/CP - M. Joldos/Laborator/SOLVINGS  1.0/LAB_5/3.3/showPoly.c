#include <stdio.h>

void showPoly(double a[],int n,char c)
{
    printf("%c=",c);
    for(int i = 0; i <= n; i++)
    {
        printf("%.2f*(X^%d)+",a[i],i);
    }

}
