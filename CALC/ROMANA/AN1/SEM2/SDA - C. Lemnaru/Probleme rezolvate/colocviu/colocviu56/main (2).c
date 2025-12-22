/*Între n orase exista o retea de drumuri care permite ca dintr-un oras sa se ajunga în oricare din celelalte.
Între 2 orase exista cel mult un drum direct, de lungime cunoscuta, iar timpul necesar pentru parcurgerea
unui drum este proportional cu lungimea sa. Se cere sa se realizeze programul pentru determinarea
traseului pe care se poate merge între doua orase date, într-un timp minim.*/


#include <stdio.h>
#include <stdlib.h>
#define nmax 999999
int k,a[100][100],c[100][100],p[100][100],i,j,n,m,x,y,cost;

void cale(int i, int j)//functia care reconstituie drumul de lungime minima dintre orasele i si j
{
    int k;
    k=p[i][j];
    if (k!=0)
        {
            cale(i,k);
            printf("%d->",k);
            cale(k,j);
        }
}

int main()
{
    FILE *f;

    f=fopen("harta.txt","r");
    fscanf(f,"%d %d",&n,&m);//citeste de pe prima linie a fisierului nr de oarse(n) si nr de drumuri existente(m)
    //initializarea matricelor cu 0 pe diagonala si cu nmax in rest
    for (i=1;i<=n;i++)
        for(j=1;j<=n;j++)
            if (i==j)
                {
                    c[i][j]=0;
                    p[i][j]=0;
                    a[i][j]=0;
                }
            else
                {
                    c[i][j]=nmax;
                    p[i][j]=0;
                    a[i][j]=nmax;
                }
    //citirea muchiilor din fisier si adaugarea costulrilor in  matricea cost(c) si cea de cost minim(a)
    for (i=1;i<=m;i++)
        {
            fscanf(f,"%d %d %d",&x,&y,&cost);//citeste orasele intre care exista drum (x si y) si lungimea acestuia(cost)
            c[x][y]=cost;
            c[y][x]=cost;
            a[x][y]=c[x][y];
            a[y][x]=c[y][x];
        }
    fclose(f);
    //algoritmul lui floyd care construieste matricea de costuri minime(a)
    for (k=1;k<=n;k++)
        for (i=1;i<=n;i++)
            for (j=1;j<=n;j++)
                if (a[i][k]+a[k][j]<a[i][j])
                        {
                            p[i][j]=k;//in tabloul p se tine acel varf (k) care a condus la costul minim a[i][j]
                            a[i][j]=a[i][k]+a[k][j];
                        }

    printf("Numarul de orase este %d.\n",n);
    printf("Dati orasul de pornire:\n");
    scanf("%d",&i);
    printf("Dati orasul destinatie:\n");
    scanf("%d",&j);
    printf("Drumul cel mai scurt dintre orasele %d si %d este: ",i,j);
    printf("%d->",i);
    cale(i,j);//apelarea functiei cale care reconstituie drumul de lungime minima dinte cele doua orase
    printf("%d ",j);
    return 0;
}
