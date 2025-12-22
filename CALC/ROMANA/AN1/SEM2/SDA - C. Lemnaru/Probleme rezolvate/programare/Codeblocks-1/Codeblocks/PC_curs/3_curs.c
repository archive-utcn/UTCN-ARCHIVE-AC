#include<stdio.h>
int nr_div(long n)
{
    int i,x=2;
    for(i=2;i<=n/2;i++)
    {
        if(n%i==0)
        x++;
    }
    return(x);
}
int main()
{
    long n;
    int m;
printf("n=");
scanf("%ld",&n);
m=nr_div(n);
printf("m este %d",m);
return(0);
}
