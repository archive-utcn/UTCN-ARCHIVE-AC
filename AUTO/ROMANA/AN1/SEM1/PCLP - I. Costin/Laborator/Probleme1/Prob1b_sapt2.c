#include<stdio.h>
int main(void)
{
    int n=1,i,x;
    do
    {
        n++;
        x=0;
        for(i=1;i<=n;i++)
        if(n%i==0)
        x++;
    }
    while(x!=n);
    printf("%d",x);
    return(0);
    }
