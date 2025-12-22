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
void quick_sort(int prim,int ultim,int a[20])
{
    int i,j,x,piv;
    i=prim;
    j=ultim;
    piv=a[(prim+ultim)/2];
    do{
    while(a[i]<piv) i++;
    while(a[j]>piv) j--;
    if(i<=j)
    {
        x=a[i];
        a[i]=a[j];
        a[j]=x;
        i++;
        j--;
    }
    }while(i<=j);
    if(prim<j) quick_sort(prim,j,a);
    if(i<ultim) quick_sort(i,ultim,a);
}


void main()
{
    int n,a[20];
    printf("\n Numarul de elemente este:");
    scanf("%d",&n);
    citire_vector(n,a);
    printf("\n Vector nesortat:");
    afisare(n,a);
    printf("\n Dupa quick sort:");
    quick_sort(0,n-1,a);
    afisare(n,a);
    return 0;
}
