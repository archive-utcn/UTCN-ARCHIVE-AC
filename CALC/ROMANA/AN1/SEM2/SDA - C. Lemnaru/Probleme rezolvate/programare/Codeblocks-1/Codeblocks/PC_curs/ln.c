#include<stdio.h>
#include<math.h>

int main()
{
    double n,i,s=0;
    int a;
    printf("n=");
    scanf("%lf",&n);
    for(i=2;i<=n;i++)
    s=s+log(i);
    s=s/log(10);
    printf("ln=%lf",s);
    a=s+1;
    printf("\nNumarul de cifre ale lui %5.0lf este: %d",n,a);
}
