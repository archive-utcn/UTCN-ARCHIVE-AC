/*Folosind numai pointeri şi expresii cu pointeri se va scrie o
funcţie de interclasare a doi vectori, care conţin elemente de tip real ordonate crescător*/
#include <stdio.h>
#include <stdlib.h>

int interclasare(int **v, int *n,int **w,int *m)
{
    int i,y[100];
    printf("Introduceti lungimea primului vector:\n");
    scanf("%d",n);
    *v=(int*)malloc(*n*sizeof(int));
    printf("Introduceti elementele primului vector:\n");
    for(i=0;i<*n;i++)
    {
        printf("v[%d]=",i);
        scanf("%d",*v+i);
    }
    printf("Introduceti lungimea celui de-al doilea vector:\n");
    scanf("%d",m);
    *w=(int*)malloc(*m*sizeof(int));
    printf("Introduceti elementele celui de-al doilea vector:\n");
    for(i=0;i<*m;i++)
    {
        printf("w[%d]=",i);
        scanf("%d",*w+i);
    }
    for(i=0;i<*n;i++)
        y[i]=*(v+i);
    for(i=0;i<*m;i++)
        y[*n+i]=*(w+i);
    for(i=0;i<*n+*m;i++)
        printf("%d",y[i]);
}
int main()
{
    int *a,*b,n1,n2;
    interclasare(&a,&n1,&b,&n2);
    return 0;
}
