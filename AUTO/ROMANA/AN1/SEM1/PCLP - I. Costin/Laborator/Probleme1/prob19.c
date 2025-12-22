/* 19. Se citeste gradul si coeficientii polinomului p(x)=a0+a1x1+......+ anxn Sa se calculeze valoarea
polinomului în x= x0 (x0 se citeste).*/
#include <stdio.h>
int main()
{
    int n,i,x,a[50],s=0,y;
    printf("gradul polinomului este ");
    scanf("%d",&n);
    printf("coeficientii polinomului sunt \n");
    for(i=0;i<=n;i++)
    {
        printf("\n coeficientul lui x la puterea %d este ",i);
        scanf("%d",&a[i]);
    }
    printf("x=");
    scanf("%d",&x);
    y=1;
    for(i=0;i<=n;i++)
    {
        s=s+(a[i]*y);
        y=y*x;
    }
    printf("valoarea functiei este %d",s);
    return(0);
}

