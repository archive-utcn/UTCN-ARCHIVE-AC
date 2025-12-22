#include<stdio.h>
int main()
{
    int x,n,y=0,a[100],i=2,j;
printf("n=");
scanf("%d",&n);
a[1]=1;
do
{
    if(n%a[i-1]!=0)
    { x=a[i-1]+1;
      y=0;

    do
    {
        if(n%x!=0)
        x++;
        else
        y=1;
    }
    while(y!=1);
    a[i]=x;
    i++;
    }
    else
    {
        a[i]=a[i-1]+1;
        i++;
    }
}
while(a[i-1]<=n);
    for(j=1;j<=i-2;j++)
    printf("%d \n",a[j]);
    return(0);
}
