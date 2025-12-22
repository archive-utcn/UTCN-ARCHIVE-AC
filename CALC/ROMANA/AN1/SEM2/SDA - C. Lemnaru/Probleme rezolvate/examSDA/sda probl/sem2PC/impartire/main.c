#include <stdio.h>
#include <stdlib.h>

int main()
{
    int a,b,d;
    printf("a= "); scanf("%d",&a);
    printf("b= "); scanf("%d",&b);
    d=a;
     while(b!=0)
     {
         d=d+a;
         b=b-1;
     }
     d=d-a;
     printf("%d",d);
     return 0;
}
