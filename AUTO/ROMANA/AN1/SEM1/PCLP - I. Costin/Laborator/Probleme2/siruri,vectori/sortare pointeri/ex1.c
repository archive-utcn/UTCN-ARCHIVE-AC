/*Folosind numai pointeri şi expresii cu pointeri se vor scrie funcţii de sortare a unui vector cu elemente reale. */
#include <conio.h>
#include <stdio.h>
#include <stdlib.h>

/*functia sortare_b sorteaza elementele vectorului cu metoda bulelor*/
int sortare_b(int n,int **p)
{
    int i,s,aux;

    *p=(int*)calloc(n,sizeof(int));
    printf("introduceti elementele sirului :\n");
    for(i=0;i<n;i++)
    {
        printf("x[%d]=",i+1);
        scanf("%d",*p+i);
    }
    do {
    s=0;
    for(i=0;i<n-1;i++)
    if(*(*p+i)>*(*p+i+1))
    {
        aux=*(*p+i);
        *(*p+i)=*(*p+i+1);
        *(*p+i+1)=aux;
        s=1;
    }
    }
    while(s!=0);
}
/*functia sortare_s sorteaza vectorul folosind metoda selectiei*/
void sortare_s(int n,int **p)
{
    int i,j,aux;

    *p=(int*)calloc(n,sizeof(int));
    printf("introduceti elementele sirului :\n");
    for(i=0;i<n;i++)
    {
        printf("x[%d]=",i+1);
        scanf("%d",*p+i);
    }
    for(i=0;i<n-1;i++)
    for(j=i+1;j<n;j++)
    if(*(*p+i)>*(*p+j))
    {
        aux=*(*p+i);
        *(*p+i)=*(*p+j);
        *(*p+j)=aux;
    }
}
void main()
{
    int n,i,selectie,*p;

    printf("1.sortare cu metoda bulelor \n");
    printf("2.sortare cu metoda selectiei \n");
    printf("alegeti metoda ");
    scanf("%d",&selectie);
    printf("ordonarea se va face crescator\n");
    printf("dati dimensiunea sirului ");
    scanf("%d",&n);
    if(selectie==1)
    sortare_b(n,&p);
    else
    sortare_s(n,&p);
    for(i=0;i<n;i++)
    printf("%d ",*(p+i));
}
