// program care verifica daca un numar este palindrom

#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n,x,inv=0;
    printf("n=");
    scanf("%d",&n);
    x=n;
    while(x!=0)
    {
        inv=inv*10+x%10;
        x=x/10;
    }
    if(inv==n)
        printf("Numarul este palindrom");
        else printf("Numarul nu este palindrom");
    return 0;
}
