#include <stdio.h>
#include <math.h>

int main ()
{
    int a,i,d,p,nr;
    printf("Numarul este:");
    scanf("%d",&a);
    d=sqrt(a);
    printf("Cel mai mare patrat perfect mai mic decat a este: %d",d*d);
    for(p=a;p<=2*a;p++)
        {nr=0;
        for(i=2;i<=p;i++)
                    if(p%i==0)
                    nr++;
                    if(nr==1)
                    {printf("\nCel mai mic numar prim mai mare decat numarul este: %d",p);
                    break;}
                    }

}
