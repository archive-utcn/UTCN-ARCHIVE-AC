#include<stdio.h>
int nr_div(int n)
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
    int m=0,n,x=0;
printf("n=");
scanf("%d",&n);
do
{
    if(nr_div(m)==n)
    x=1;
    else
    m++;
}
while(x!=1);

printf("%d",m);
return(0);
}
