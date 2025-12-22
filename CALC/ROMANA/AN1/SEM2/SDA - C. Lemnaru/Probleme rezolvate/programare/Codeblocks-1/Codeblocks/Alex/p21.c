#include <stdio.h>
#include <math.h>

int main ()
{
    int a[20][20],n,i,j,s1=0,s2=0,s3=0,s4=0;
    printf("Numarul de linii si coloane :");
    scanf("%d",&n);
    for(i=1;i<=n;i++)
    {for(j=1;j<=n;j++)
    {
        printf("a[%d][%d]=",i,j);
        scanf("%d",&a[i][j]);
    }}
    for(i=1;i<=n;i++)
    {for(j=i+1;j<=n;j++)
    {if((i+j)<=n)
    s1=s1+a[i][j];
    }}

    for(i=2;i<n;i++)
    {for(j=i+1;j<n;j++)
    {if((i+j)>n)
    s2=s2+a[i][j];
    }}

    for(j=1;j<=n;j++)
    {for(i=j+1;i<=n;i++)
    {if((i+j)<=n)
    s3=s3+a[i][j];
    }}

    for(j=2;j<n;j++)
    {for(i=j+1;i<n;i++)
    {if((i+j)>n)
    s4=s4+a[i][j];
    }}

    printf("%d\n",s1);
    printf("%d\n",s2);
    printf("%d\n",s3);
    printf("%d\n",s4);
}
