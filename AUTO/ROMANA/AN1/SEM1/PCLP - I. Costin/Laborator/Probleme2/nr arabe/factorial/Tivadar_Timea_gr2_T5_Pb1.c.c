//Scrieţi un program care calculează și afișează factorialul unui număr întreg introdus de la tastatură.
#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n,i,fact=1;
    printf("n=");
    scanf("%d",&n);
    for(i=1;i<=n;i++)
        fact=fact*i;
    printf("%d",fact);
    return 0;
}
