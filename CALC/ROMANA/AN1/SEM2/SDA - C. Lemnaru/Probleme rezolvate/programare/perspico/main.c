/*3.1	Jocul PERSPICO. 15 plăcuţe pătrate sunt încadrate într-un cadru de dimensiune 4x4,
o poziţie fiind liberă. Orice plăcuţă vecină cu această poziţie liberă poate fi mutată
în locul ei. Cele 15 plăcuţe sunt numerotate de la 1 la 15. Se începe dintr-o stare iniţială,
care corespunde unei distribuţii oarecare a celor 15 plăcuţe şi a locului liber în cele 16
poziţii posibile. Problema constă în a trece, folosind mutări posibile, din starea iniţială
în starea finală */

#include <stdio.h>
#include <stdlib.h>

typedef struct nod
{
    int a[20][20],cost;
    struct nod *tata;

}Nod;

Nod *rad; // starea intitala
int n;

int calc_cost(int a[20][20])
{
   int i,j,s=0;
   for(i=0;i<n;i++)
      for(j=0;j<n;j++)
      if(a[i][j]!=i*n+j+1&&a[i][j]!=0)
        s++;
   return s;
}


void citire()
{
    FILE *f;
    int i,j;
     f=fopen("fis.txt","r");
    fscanf(f,"%d",&n);
    rad=(Nod*)malloc(sizeof(Nod));
    for(i=0;i<n;i++)
      for(j=0;j<n;j++)
        fscanf(f,"%d",&rad->a[i][j]);
    rad->cost=calc_cost(rad->a);
    fclose(f);
}

void generare_vecini(Nod *l[4],Nod *i)
{
    int pozi,pozj,x,y,xi[4]={-1,0,1,0},xj[4]={0,1,0,-1},j;
    for(x=0;x<n;x++)
      for(y=0;y<n;y++)
        if(i->a[x][y]==0)
          {
              pozi=x;
              pozj=y;
          }
          for(x=0;x<=3;x++)
           {
            if(pozi+xi[x]>=0 && pozi+xi[x]<n && pozj+xj[x]>=0 && pozj+xj[x]<n)
              {
                l[x]=(Nod*)malloc(sizeof(Nod));
                for(j=0;j<n;j++)
                  for(y=0;y<n;y++)
                     l[x]->a[j][y]=i->a[j][y];
                l[x]->a[pozi][pozj]=l[x]->a[pozi+xi[x]][pozj+xj[x]];
                l[x]->a[pozi+xi[x]][pozj+xj[x]]=0;
                l[x]->cost=calc_cost(l[x]->a);
              }
            }
}

void af(Nod *p)
{
    int i,j;
    if(p!=0)
    {
        af(p->tata);
        for(i=0;i<n;i++)
          {for(j=0;j<n;j++)
            printf("%d ",p->a[i][j]);
            printf("\n");
          }
        printf("\n");
    }

}

void branch_and_bound()
{
    Nod *i,*j;
    Nod *l[4];//stari urmatoare
    i=rad;
    int k;
    for(k=0;k<=3;k++)
       l[k]=NULL;
     for(;;)
     {
         generare_vecini(l,i);
         for(k=0;k<=3;k++)
         {

            if(l[k]!=NULL && l[k]->cost<i->cost)
             {
                 j=l[k];
                 j->tata=i;
                 i=j;
                 //af1(i->a);
                 if(i->cost==0)
                   {
                     af(i);
                    return;
                   }
                   else break;
             }
         }

        if(k==4)
          {
              printf("\n Nu am gasit solutie!!!");
              return;
          }
      }
}

int main()
{
    citire();
    branch_and_bound();
    return 0;
}
