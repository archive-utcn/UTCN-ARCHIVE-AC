#include <stdio.h>
#include <stdlib.h>


int main()
{
int i,n,j,gap,temp,a[10];
printf("Cate numere doriti sa introduceti? ");
scanf("%d",&n);
printf("Introduceti numerele: ");
for(i=0;i<n;i++)
{
scanf("\n%d",&a[i]);
}
for(gap=n/2;gap>0;gap=gap/2)
    {
    for(i=0;i<n;i=i+gap)
        {
        temp=a[i];
        for(j=i;j>0&&a[j-gap]>temp;j=j-gap)
            {
                a[j]=a[j-gap];
            }
        a[j]=temp;
        }
    }
printf("Sirul sortat este: ");
for(i=0;i<n;i++)
printf("%d ",a[i]);
return 0;
}
