//Folosind numai pointeri şi expresii cu pointeri se vor scrie funcţii de citire, afişare şi înmulţire a două matrice.
#include <conio.h>
#include <stdlib.h>
#include <stdio.h>

void citire(int n,int ***v)
{
    int i,j;

    *v=(int**) malloc(n*sizeof(int*));
    for(i=0;i<n;i++)
        *(*v+i)=(int*) calloc(n,sizeof(int));

    for(i=0;i<n;i++)
    for(j=0;j<n;j++)
    {
        printf("[%d][%d]=",i+1,j+1);
        scanf("%d",(*(*v+i)+j));
    }
    printf("\n");
}
int afisare(int n,int **v)
{
    int i,j;

    for(i=0;i<n;i++)
    {
        for(j=0;j<n;j++)
        printf("%d ",*(*(v+i)+j));
        printf("\n");
    }
    printf("\n");
}
int inmultire(int n,int **w,int **y)
{
    int k,i,j,p[20][20];

    for(i=0;i<n;i++)
    for(j=0;j<n;j++)
    p[i][j]=0;

    for(k=0;k<n;k++)
    for(i=0;i<n;i++)
    for(j=0;j<n;j++)
        p[i][j]+=*(*(w+i)+k)*(*(*(y+k)+j));
    for(i=0;i<n;i++)
    {
        for(j=0;j<n;j++)
        printf("%d ",p[i][j]);
        printf("\n");
    }
}
int main()
{
    int **w,**y,n;

    printf("n=");
    scanf("%d",&n);
    printf("introduceti elementele primei matrice \n");
    citire(n,&w);
    printf("introduceti elementele celei de a doua matrice \n");
    citire(n,&y);
    printf("prima matrice este \n");
    afisare(n,w);
    printf("a doua matrice este \n");
    afisare(n,y);
    printf("produsul lor este \n");
    inmultire(n,w,y);
}
