
#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n,i,v1=0,v2=0,a=0,p[10];

    printf("Citeste valoarea lui n: ");
    scanf("%d",&n);

    printf("Citeste coeficientii polinomolui: ");
    for(i=n;i>=0;i--)
    {
    printf("p[ %d ]=", i);
    scanf(" %d",&p[i]);
    }

    printf("Citeste valoarea lui a: ");
    scanf(" %d",&a);

    for(i=n;i>=0;i--)
       v1=v1*a+p[i];

    printf("Valoarea polinomului pt x=a: ");
    printf(" %d\n",v1);


    for(i=n;i>=0;i--)
       v2=v2*a+p[i];

    printf("\nValoarea derivatei polinomului pt x=a: ");
    printf(" %d",v2);
    return 0;
}
