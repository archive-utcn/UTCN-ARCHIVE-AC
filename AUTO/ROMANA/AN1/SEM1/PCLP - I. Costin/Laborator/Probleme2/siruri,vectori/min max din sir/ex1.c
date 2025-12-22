/*Scrieţi un program care determină valoarea minimă și maximă dintr-un sir de intregi folosind pointeri si aritmetica cu pointeri.
Spatiul pentru sir se alocă dinamic.*/
#include <conio.h>
#include <stdio.h>
#include <stdlib.h>
/*functia max_min returneaza maximul si minimul din cadrul sirului*/
void max_min(int **p,int n,int *min,int *max)
{
    int i;

    *p=(int*)calloc(n,sizeof(int));
    printf("introduceti elementele : \n");
    for(i=0;i<n;i++)
    {
        printf("v[%d]=",i);
        scanf("%d",*p+i);
    }
    *min=**p;
    *max=**p;
    for(i=1;i<n;i++)
    if(*min>*(*p+i))
    *min=*(*p+i);
    else
    if(*max<*(*p+i))
    *max=*(*p+i);
}
int main()
{
    int *v;
    int n;
    int min;
    int max;

    printf("dati dimensiunea sirului ");
    scanf("%d",&n);
    max_min(&v,n,&min,&max);
    printf("max=%d\n",max);
    printf("min=%d",min);
}
