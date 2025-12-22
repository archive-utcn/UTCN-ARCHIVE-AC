/*Să se scrie funcțiile pentru adunarea, scăderea şi înmulţirea a
 două matrice şi apoi să se realizeze calculul A=B*C –2*(B+C), unde B şi C sunt două matrice pătratice de ordinul n.*/

#include<stdio.h>
#include<stdlib.h>
int i,j,n,a[50][50],k,b[50][50],c[50][50],p,suma[50][50],inmultire[50][50],scadere[50][50];
void inmultire_matrice (int b[50][50], int c[50][50], int n)
{
    for(i=0;i<n;i++)
    {
        for(k=0;k<n;k++)
        {
        p=0;
        for(j=0;j<n;j++)
            p=(b[i][j])*(c[j][k])+p;
        inmultire[i][k]=p;
        }
    }
}
void adunare_matrice ( int b[50][50],int c[50][50],int n)
{
    for(i=0;i<n;i++)
        for(j=0;j<n;j++)
            suma[i][j]=b[i][j]+c[i][j];
}
void scadere_matrice( int b[50][50],int c[50][50], int n)
{
    for(i=0;i<n;i++)
        for(j=0;j<n;j++)
            a[i][j]=b[i][j]-c[i][j];
}
void inmultire_2( int b[50][50],int n)
{
    for(i=0;i<n;i++)
        for(j=0;j<n;j++)
            b[i][j]=2*b[i][j];
}
int main()
{
    printf("n=" );
    scanf("%d",&n);
    printf("introduceti elementele primei matrice:\n");
    for(i=0;i<n;i++)
        for(j=0;j<n;j++)
        {
            printf("b[%d][%d]=",i,j);
            scanf("%d",&b[i][j]);
        }
    printf("introduceti elementele celei de a doua matrice:\n");
    for(i=0;i<n;i++)
        for(j=0;j<n;j++)
        {
            printf("c[%d][%d]=",i,j);
            scanf("%d",&c[i][j]);
        }
    printf("\n");
    inmultire_matrice(b,c,n);
    adunare_matrice(b,c,n);
    inmultire_2(suma,n);
    scadere_matrice(inmultire,suma,n);
    printf("matricea A=B*C - 2*(B+C)    este: \n");
    for(i=0;i<n;i++)
    {
        for(j=0;j<n;j++)
            printf("%d ",a[i][j]);
        printf("\n");
    }
    return 0;
}
