#include <stdio.h>
#include <stdlib.h>
#include<math.h>
int patrat(int a)
{
    int i;
    for(i=1;i<=a;i++)
    if(sqrt(a)==i)
    return(1);
}

int main()
{
    int x[30],i,n;
    printf("n=");
    scanf("%d",&n);
    for(i=1;i<=n;i++)
    {
        printf("\nx[%d]=",i);
        scanf("\n%d",&x[i]);
    }
    printf("\npatrate perfecte:\n");
    for(i=1;i<=n;i++)
    {
     if(patrat(x[i])==1)
     printf("%d \n",x[i]);
    }
    return(0);
}
