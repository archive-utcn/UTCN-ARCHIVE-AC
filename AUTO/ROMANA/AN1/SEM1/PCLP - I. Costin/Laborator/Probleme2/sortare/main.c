#include <stdio.h>
#include <stdlib.h>
void sortare(int**q,int *m)
{   int i,j;
    scanf("%d",m);
    *q=(int *)malloc(*m*sizeof(int));
    for(i=1;i<=*m;i++)
        scanf("%d",*q+i);
    for(i=1;i<=*m;i++)
        for(j=i;j<=*m;j++)
            if(*(*q+i))
}
int main()
{
    int *p,n;
    return 0;
}
