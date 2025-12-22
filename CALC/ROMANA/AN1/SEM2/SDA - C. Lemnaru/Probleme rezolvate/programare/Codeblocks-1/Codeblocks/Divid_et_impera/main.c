#include <stdio.h>
#include <stdlib.h>
#include <stdio.h>
#define max 100
int A[ max ] ;

void afisare ( int n)
{
    int i ;
    printf("\n");
    for (i=0;i<n;i++ )
    {
        printf("%5d",A[i]);
    }
printf("\n");
}

void funct( int inf, int mid, int sup)
{
    int i,j,k,l;
    int B[max] ;
    i = inf;
    j = mid + 1;
    k = inf;
    while( i <= mid && j <= sup )
    {
        if ( A[i] <= A[j] )
        {
            B[k] = A[i] ;
            i++;
        }
        else
        {
            B[k] = A[j] ;
            j++;
        }
        k++;
    }
    for (l=i;l<=mid;l++)
    {
        B[k] = A[l] ;
        k++;
    }
    for (l=j;l<=sup;l++)
    {
        B[k]=A[l] ;
        k++;
    }
    for (l=inf;l<=sup;l++)
    A[l]=B[l];
}

void divide_et_impera( int inf, int sup)
{
    int mid;
    if ( inf < sup)
    {
        mid= ( inf + sup ) / 2;
        divide_et_impera( inf, mid ) ;
        divide_et_impera( mid + 1, sup) ;
        funct( inf, mid, sup) ;
    }
}


void cautare(int st, int dr, int x)
{
    if ( st <= dr) {
    int mid;
    mid=(st+dr)/2;
    if (x == A[mid]) {printf("S-a gasit elementul!");}
        else {if (x >  A[mid] ) cautare(mid+1,dr,x);
              if (x <  A[mid] ) cautare(st,mid-1,x);}
    }
    else
        printf("Nu s-a gasit elementul!");
}

int main( )
{
int i,n,z;

printf("\nIntroduceti n:" );
scanf("%d",&n);
printf( "\nElementele sunt: \n" ) ;
for ( i = 0; i < n; i++ )
{
printf("a[%d]=",i);
scanf("%d",&A[i]);
}
printf("\n Inainte de sortare:\n" ) ;
afisare ( n ) ;
divide_et_impera( 0, n-1 ) ;
printf ( " \nDupa sortare:\n" ) ;
afisare ( n ) ;
printf("\n Cauta elementul:\n" ) ;
scanf("%d",&z);
cautare(0,n-1,z);
return 0;
}
