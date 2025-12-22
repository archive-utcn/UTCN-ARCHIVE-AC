#include <stdio.h>
#include <stdlib.h>

int main()
{
    int *p,n,i,min, max;
    scanf("%d",&n);
    p=(int *)malloc(n*sizeof(int));
    for(i=0;i<n;i++)
        scanf("%d",p+i);
    min=*p;
    max=*p;
    for(i=1;i<n;i++)
       {
        if(max<*(p+i))
            max=*(p+i);
        if(min>*(p+i))
            min=*(p+i);
       }
    printf("min=%d\nmax=%d",min,max);
    return 0;
}
