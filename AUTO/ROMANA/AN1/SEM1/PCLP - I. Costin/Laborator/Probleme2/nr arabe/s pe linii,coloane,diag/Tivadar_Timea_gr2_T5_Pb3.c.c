/*
Scrieþi un program care citeste elementele unei matrice 5x5 si apoi afiseaza

    sumele elmentelor pe linii
    sumele elmentelor pe coloane
    suma elementelor de pe diagonala principala*/
#include <stdio.h>
#include <stdlib.h>

int main()
{
    int a[6][6], i, j, s=0;
    for(i=1;i<=5;i++)
        for(j=1;j<=5;j++)
            {
                printf("a[%d][%d]=",i,j);
                scanf("%d", &a[i][j]);
            }
    for(i=1;i<=5;i++)
        {
            s=0;
            for(j=1;j<=5;j++)
                s=s+a[i][j];
            printf("Suma pe linia %d este %d\n",i,s);
        }
    for(j=1;j<=5;j++)
        {
            s=0;
            for(i=1;i<=5;i++)
                s=s+a[i][j];
            printf("Suma pe coloana %d este %d\n",j,s);
        }
        s=0;
    for(i=1;i<=5;i++)
            for(j=1;j<=5;j++)
                if(i==j)
                s=s+a[i][j];
    printf("Suma pe diag principala este %d",s);
    return 0;
}
