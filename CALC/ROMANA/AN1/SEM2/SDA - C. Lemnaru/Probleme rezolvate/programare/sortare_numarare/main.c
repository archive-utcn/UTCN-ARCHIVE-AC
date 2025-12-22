#include <stdio.h>
#include <stdlib.h>

int main()
{
    int a[100],c[100],n,i,j;
    scanf("%d",&n);
    for(i=1;i<=n;i++)
    {
        scanf("%d",&a[i]);
        c[i]=0;
    }
    for(i=1;i<=n;i++)
        for(j=1;j<=n;j++)
            if(a[i]>a[j]&&i!=j) c[i]++;
    for(i=0;i<n;i++)
        for(j=1;j<=n;j++)
            if(c[j]==i) printf("%d ",a[j]);
    return 0;
}
