#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n,ogl=0,c;
    printf("The number is:");
    scanf("%d",&n);
    int aux=n;
    while(aux>0)
    {
        c=aux%10;
        ogl=ogl*10+c;
        aux=aux/10;
    }
    if(n==ogl)
        printf("The number is a palindrom");
    else
        printf("The number is not a palindrom");
    return 0;
}
