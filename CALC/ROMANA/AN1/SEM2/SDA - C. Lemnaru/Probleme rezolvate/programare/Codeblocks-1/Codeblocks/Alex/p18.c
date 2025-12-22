#include <stdio.h>
#include <math.h>

int main ()
{
    int a,n,i,s=0;
    printf("Numarul de cifre este :");
    scanf("%d",&a);
    for(i=0;i<a;i++)
    {
        scanf("%x",&a);
        s=a*pow(10,i)+s;
    }
    printf("%d",s);}
