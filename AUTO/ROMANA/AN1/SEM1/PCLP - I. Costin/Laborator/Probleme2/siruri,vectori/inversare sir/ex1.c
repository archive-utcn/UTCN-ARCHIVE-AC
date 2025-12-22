/*Scrieţi un program care inverseaza ordinea de aparitie a elementelor dintr-un sir de intregi folosind pointeri si aritmetica cu pointeri.
Spatiul pentru sir se alocă dinamic.*/
#include <conio.h>
#include <stdlib.h>
#include <stdio.h>

/*functia inversare inverseaza ordinea de aparitie a sirului*/
void inversare(int n,int **p)
{
    int i,aux;

    *p=(int*)calloc(n,sizeof(int));
    printf("introduceti elementele sirului :\n");
    for(i=0;i<n;i++)
    {
        printf("x[%d]=",i+1);
        scanf("%d",*p+i);
    }
    for(i=0;i<n/2;i++)
    {
        aux=*(*p+i);
        *(*p+i)=*(*p+n-i-1);
        *(*p+n-i-1)=aux;
    }
    for(i=0;i<n;i++)
    printf("%d ",*(*p+i));
}
int main()
{
    int *v;
    int n;

    printf("dati dimensiunea sirului ");
    scanf("%d",&n);
    inversare(n,&v);
}
