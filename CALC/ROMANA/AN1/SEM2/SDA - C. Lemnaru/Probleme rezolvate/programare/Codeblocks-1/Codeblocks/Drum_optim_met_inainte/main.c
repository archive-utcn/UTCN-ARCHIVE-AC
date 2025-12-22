#include<stdio.h>
#include<conio.h>


void afisare(int n, int a[])
{
    int i;
    printf("\nSir initial:");
    for(i=0;i<n;i++)
    {
        printf("%d",a[i]);

    }
}


void secventa(int a[], int tata[],int i)
{
    if(tata[i]>=0)
    secventa(a,tata,tata[i]);
    printf("%d",a[i]);
}

void main ()
{
    int n,a[20];
    int tata[20];
    int l[20];
    int imax,i,j;
    printf("Numar de elemente:");
    scanf("%d",&n);
    for(i=0;i<n;i++)
    {
        printf("a[%d]=",i);
        scanf("%d",&a[i]);
    }
    afisare(n,a);
    for(i=0;i<n;i++)
    {
        l[i]=1;
        tata[i]=-1;
    }
    imax=0;
    for(i=1;i<n;i++)
    {
        for(j=0;j<i;j++)
            if((a[j]<=a[i])&&(l[j]+1>l[i]))
            {
                l[i]++;
                tata[i]=j;
            }
            if(l[i]>l[imax])
            imax=i;
    }
    printf("\nLungimea secventei maxime: %d",l[imax]);
    printf("\nElementele sunt:");
    secventa(a,tata,imax);

}
