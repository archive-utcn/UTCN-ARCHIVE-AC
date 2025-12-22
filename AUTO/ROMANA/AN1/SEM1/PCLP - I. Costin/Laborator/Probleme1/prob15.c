/*Sa se scrie un program pentru generarea tuturor numerelor prime mai mici sau egale cu un numar
natural n.*/
#include <stdio.h>
#include <conio.h>
#include <math.h>

int prim(int a)
{
    int i,ok;
    ok=1;
    for (i=2;i<=a/2;i++)
        if (a%i==0)
           {
           ok=0;
           break;
                   };
    return ok;
}

int main()
{
    int i,n,ok;
    printf("n=");
    scanf("%d",&n);
    printf("nr prime sunt:");
    for (i=2;i<=n;i++)
        {
         ok=prim(i);
         if (ok==1)
            printf(" %d",i);
                      };
    return 0;
}
