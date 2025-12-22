#include<stdio.h>
int main()
{
    int n,i,a[50][2],x,j,y;
printf("n=");
scanf("%d",&n);
for(i=1;i<=50;i++)
a[i][2]=0;
x=1;
for(i=2;i<=n/2;i++)
{
    j=2;
    do
    {  y=i;
        if(i%j==0)
        {
            a[x][1]=i;
            a[x][2]++;
            y=y/j;
        }
        else
        {
        j++;
        x++;
        }
    }
    while(y>0);

}
for(i=1;i<=x;i++)
{
printf("a");
printf("%d^%d * ",a[i][1],a[i][2]);
}
return(0);
}

