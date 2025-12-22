/* Se citeste un nr de la tastatura. sa de verifice daca este palindrom. */
#include <stdio.h>
#include <stdlib.h>

int main()
{
    int i=0,nr,n=0, cifre[100];
    printf("Dati un numar ");
    scanf("%d",&nr);
    while(nr>0)
    {
        cifre[++n]=nr%10;
        nr=nr/10;
    }
    nr=1;
    for(i=1;i<=n;i++)
        if(cifre[i]!=cifre[n-i+1])
        {
            printf("nr nu e palindrom");
             nr=0;
             break;
        }
    if(nr==1)
        printf("nr e palindrom");
    return 1;
}
