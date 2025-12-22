#include<stdio.h>
int main(void)
{
    long n,i;
    int x=2;

    printf("n=");
    scanf("%ld",&n);
    for(i=2;i<=n/2;i++)
    if(n%i==0)
    x++;
    printf("%d",x);
    return(0);
}
