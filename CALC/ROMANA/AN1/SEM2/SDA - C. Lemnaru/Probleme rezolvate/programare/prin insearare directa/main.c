#include <stdio.h>
#include <stdlib.h>

int main()
{
     int a[100],n,i,j,x;
    scanf("%d",&n);
    for(i=1;i<=n;i++)
        scanf("%d",&a[i]);
    for(i=1;i<=n;i++)
    {
        x=a[i];
        j=i-1;
        while(j>0&&x<a[j])
        {
            a[j+1]=a[j];
            j--;
        }
        a[j+1]=x;
    }
    for(i=1;i<=n;i++)
        printf("%d ",a[i]);
    return 0;
}
