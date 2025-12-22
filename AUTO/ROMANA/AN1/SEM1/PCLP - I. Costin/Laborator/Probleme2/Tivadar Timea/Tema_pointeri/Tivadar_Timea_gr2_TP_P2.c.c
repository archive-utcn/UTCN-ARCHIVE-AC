/*Scrieţi un program care inverseaza ordinea de aparitie a elementelor dintr-un sir de intregi
folosind pointeri si aritmetica cu pointeri. Spatiul pentru sir se alocă dinamic.*/
#include <stdio.h>
#include <stdlib.h>

int main()
{
    int *p,n,i,aux;
    scanf("%d",&n);
    p=(int *)malloc(n*sizeof(int));
    for(i=1;i<=n;i++)
        scanf("%d",p+i);
    for(i=1;i<=n/2;i++)
        {
        aux=*(p+i);
        *(p+i)=*(p+n-i+1);
        *(p+n-i+1)=aux;
        }
    for(i=1;i<=n;i++)
        printf("%d ",*(p+i));
    return 0;
}
