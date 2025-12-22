/* Se considera o matrice de dimensiune n*m ale carei elemente sunt numere naturale cuprinse între
1 si 9, reprezentând diferite culori. Se defineste multimea conexa a unui element ca fiind
multimea elementelor matricei în care se poate ajunge din elementul respectiv prin deplasari
succesive pe linie sau coloana, cu pastrarea culorii.
Sa se determine culoarea si numarul de elemente ale multimii conexe cu numar maxim de elemente.
Daca exista mai multe solutii, se va preciza una dintre ele.*/
#include <stdio.h>
#include <stdlib.h>

void pozitie (int a[][20],int n,int m,int c,int *poz_l,int *poz_c,int *gasit)
{
    int z,y;
    (*gasit)=0;
    for(z=0; z<n; z++)
        for (y=0; y<m; y++)
            if (a[z][y]==c)
            {
                (*poz_l)=z;
                (*poz_c)=y;
                z=n;
                y=m;
            (*gasit)=1;
            }


}
int main()
{
    int a[20][20],n,m,poz_l,poz_c,gasit;
    int v[10];

    printf("Dati nr de linii:");
    scanf("%d",&n);
    printf("\nDati nr de coloane:");
    scanf("%d",&m);

    int i,j;
    for (i=1;i<=9;i++)
        v[i]=0;
    printf("\nIntroduceti in matrice doar valori 1-9:\n");
    for(i=0; i<n; i++)
        for (j=0; j<m; j++)
        {
            printf("a[%d][%d]=",i,j);
            scanf("%d",&a[i][j]);
        }

    int k,ok;
    for (i=1;i<=9;i++)
    {pozitie(a,n,m,i,&poz_l,&poz_c,&gasit);
    j=poz_c;  k=poz_l;
     if(gasit==1) {a[k][j]=0;  v[i]++;}
     ok=1;
    while (ok==1)
            {
               pozitie(a,n,m,i,&poz_l,&poz_c,&gasit);
                 if ((j==poz_c && k==poz_l+1 ) || (j==poz_c && k==poz_l-1)) {v[i]++;
                                                                            a[poz_l][poz_c]=0;
                                                                            j=poz_c;
                                                                            k=poz_l;
                                                                            }
                 else if ((k==poz_l && j==poz_c+1 ) || (k==poz_l && j==poz_c-1)) {v[i]++;
                                                                            a[poz_l][poz_c]=0;
                                                                            j=poz_c;
                                                                            k=poz_l;
                                                                            }
                else ok=0;
            }

    }

 int max=v[1],culoarea=1;
 for (i=1;i<=9;i++)
    {
        if (v[i]>max) {max=v[i]; culoarea=i;}
    }


    printf("Culoarea %d are cele mai multe elemente %d: ",culoarea,max);


    return 0;
}
