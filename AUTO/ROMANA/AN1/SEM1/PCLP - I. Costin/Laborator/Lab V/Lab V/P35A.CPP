#include <stdio.h>
#define MAXN 20

typedef int MULTIME[50];

void citeste(MULTIME m[MAXN],int& n)
{
    printf("Numarul de multimi =");
    scanf("%i",&n);
    for(int i=1;i<=n;i++)
    {
        printf("\nMultimea %i",i);
        printf("Dimensiunea=");
        scanf("%i",&m[i][0]);
        for(int j=1;j<=m[i][0];j++)
        {
            printf("m%i[ %i ]=",i,j);
            scanf("%i",&m[i][j]);
        }   
    }
}

void afisare(MULTIME rez, int dr)
{
    for(int i=1;i<=dr;i++) printf("%i ",rez[i]);
    printf("\n");
}
