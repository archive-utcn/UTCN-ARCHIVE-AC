/*Folosind numai pointeri şi expresii cu pointeri se va scrie o funcţie de interclasare a doi vectori,
care conţin elemente de tip real ordonate crescător*/
#include <conio.h>
#include <stdio.h>
#include <stdlib.h>

int interclasare(int n,int **w,int m,int **v)
{
    int x[100],k,i,j;

    *w=(int*)calloc(n,sizeof(int));
    printf("introduceti elementele primului vector in ordine crescatoare \n");
    for(i=0;i<n;i++)
    {
        printf("p[%d]=",i+1);
        scanf("%d",*w+i);
    }
    *v=(int*)calloc(n,sizeof(int));
    printf("introduceti elementele celui de-al doilea vector in ordine crescatoare \n");
    for(j=0;j<m;j++)
    {
        printf("v[%d]=",j+1);
        scanf("%d",*v+j);
    }
    i=0;j=0;k=0;
    while((i<n) && (j<m))
    if(*(*w+i)<*(*v+j))
    {
        x[k]=*(*w+i);
        i++;
        k++;
    }
    else
    {
        x[k]=*(*v+j);
        j++;
        k++;
    }
    if(i<n)
    while(i<n)
    {
        x[k]=*(*w+i);
        i++;
        k++;
    }
    else
    while(j<m)
    {
        x[k]=*(*v+j);
        k++;
        j++;
    }
    for(i=0;i<k;i++)
    printf("%d ",x[i]);
}
int main()
{
    int *w,*v,n,m;

    printf("dati dimensiunea primului sir ");
    scanf("%d",&n);
    printf("dati dimensiunea celui de-al doilea sir ");
    scanf("%d",&m);
    interclasare(n,&w,m,&v);
}
