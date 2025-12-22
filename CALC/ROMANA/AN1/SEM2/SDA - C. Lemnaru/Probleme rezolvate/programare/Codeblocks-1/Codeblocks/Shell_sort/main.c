#include<stdio.h>

void citire_vector(int n,int a[20])
{
    int i;
    for(i=0;i<n;i++)
    {
        printf("a[%d]=",i);
        scanf("%d",&a[i]);
    }
}
void afisare(int n,int a[20])
{
    int i;
    for(i=0;i<n;i++)
    {
        printf(" %d ",a[i]);
    }
}
void shell_sort(int n,int a[20])
{
    int i,j,incr;
    int x;
    incr=1;
    while(incr<n)
    {incr=incr*3+1;}
    while(incr>=1)
    {
        incr=incr/3;
        for(i=incr;i<n;i++)
        {
            x=a[i];
            j=i;
            while(a[j-incr]>x)
            {
                a[j]=a[j-incr];
                j=j-incr;
                if(j<incr)
                break;
            }
            a[j]=x;
        }
    }
}


void main()
{
    int n,a[20];
    printf("\n Numarul de elemente este:");
    scanf("%d",&n);
    citire_vector(n,a);
    printf("\n Vector nesortat:");
    afisare(n,a);
    printf("\n Dupa shell sort:");
    shell_sort(n,a);
    afisare(n,a);
    return 0;
}
