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

void swap_sort(int n,int a[20])
{
    int i,j,gata,x;
    j=0;
    do{
    gata=1;
    j=j+1;
    for(i=0;i<n-j;i++)
    if(a[i]>a[i+1])
    {
        gata=0;
        x=a[i];
        a[i]=a[i+1];
        a[i+1]=x;
    }
    }while(gata==0);
}

void main()
{
    int n,a[20];
    printf("\n Elementele sunt:");
    scanf("%d",&n);
    citire_vector(n,a);
    printf(" Inainte de sortare:");
    afisare(n,a);
    printf("\n Dupa swap sort:");
    swap_sort(n,a);
    afisare(n,a);
    return 0;
}
