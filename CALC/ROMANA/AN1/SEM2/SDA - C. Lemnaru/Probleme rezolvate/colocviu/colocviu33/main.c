#include <stdio.h>
#include <stdlib.h>

typedef struct nod
{
 int m[20][20];
 int cost,n;
 struct nod *urm;
}Tnod;

typedef struct lista
{
  Tnod *nod;
  struct lista *urm;
}Tlista;

Tnod *rad;

void adauga(Tlista **prim, Tlista **ultim,Tnod *p)//adauga nodul p in lista
{
    Tlista *q;

    q=(Tlista *)malloc(sizeof(Tlista));
    q->nod=p;
    q->urm=0;

    if (*prim==0)
    {
        *prim=q;
        *ultim=q;
    }
    else
    {
     (*ultim)->urm=q;
      *ultim=q;
    }
}

int cost(Tnod *p)
{
    int i,j,k,n;
    n=p->n;
    k=0;
    for (i=1;i<=p->n;i++)
       for (j=1;j<=p->n;j++)
          if (p->m[i][j]!=(i-1)*n+j) k=k+1;
    return k;
}

void branch_and_bound()
{
    int i,j,k,x,y,n,aux,minim;
    Tnod *p,*pp,*q;
    Tlista *prim, *ultim, *curent;
    prim=0;
    ultim=0;
    rad=(Tnod *)malloc(sizeof(Tnod));
    rad->cost=cost(rad);

  while(rad->cost!=1)
  {
    p=rad;
    n=p->n;
    x=0;
    y=0;
    for (i=1;i<=n;i++)
       for (j=1;j<=n;j++)
          if (p->m[i][j]==(-1))
          {
              x=i;
              y=j;
          }

    pp=(Tnod *)malloc(sizeof(Tnod));
    for (i=1;i<=n;i++)
       for (j=1;j<=n;j++)
          pp->m[i][j]=p->m[i][j];

    pp->n=n;
    if (x!=1)
    {
     pp->m[x][y]=pp->m[x-1][y];
     pp->m[x-1][y]=-1;
     adauga(&prim,&ultim,pp);
    }

    pp=(Tnod *)malloc(sizeof(Tnod));
    for (i=1;i<=n;i++)
       for (j=1;j<=n;j++)
          pp->m[i][j]=p->m[i][j];

    pp->n=n;
    if (y!=1)
    {
      pp->m[x][y]=pp->m[x][y-1];
      pp->m[x][y-1]=-1;
      adauga(&prim,&ultim,pp);
    }

    pp=(Tnod *)malloc(sizeof(Tnod));
    for (i=1;i<=n;i++)
       for (j=1;j<=n;j++)
          pp->m[i][j]=p->m[i][j];

    pp->n=n;
    if (x!=n)
    {
      pp->m[x][y]=pp->m[x+1][y];
      pp->m[x+1][y]=-1;
      adauga(&prim,&ultim,pp);
    }

    pp=(Tnod *)malloc(sizeof(Tnod));
    for (i=1;i<=n;i++)
       for (j=1;j<=n;j++)
          pp->m[i][j]=p->m[i][j];
    pp->n=n;
    if (y!=1)
    {
      pp->m[x][y]=pp->m[x][y+1];
      pp->m[x][y+1]=-1;
      adauga(&prim,&ultim,pp);
    }

    curent=prim;
    minim=n*n+1;
    while(curent!=0)
    {
       k=cost(curent->nod);
       if (k<minim)
       {
            q=curent->nod;
            minim=k;
            q->cost=k;
       }
       curent=curent->urm;

    }
     for (i=1;i<=n;i++)
     {
       for (j=1;j<=n;j++)
          printf("%3d ",q->m[i][j]);
       printf("\n");
     }
   rad=q;
   printf("\n");
  }
}

void citire()
{
    FILE *f;
    char cale[30];
    int i, j;

    printf("Introduceti calea spre fisierul dorit: ");
    scanf("%s", cale);

    f=fopen(cale,"r");

    fscanf(f,"%d",&rad->n);
    for (i=1;i<=rad->n;i++)
       for (j=1;j<=rad->n;j++)
           fscanf(f,"%d",&rad->m[i][j]);

    fclose(f);
}
int main()
{
    citire();
    branch_and_bound();
    return 0;
}
