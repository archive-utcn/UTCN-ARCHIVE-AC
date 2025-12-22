#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

typedef struct nod
{
    int info;
    struct nod *st,*dr;
}Nod;
Nod *rad;
Nod *construire()
{
    Nod *p;
    int nr;
     printf("info: ");
      scanf("%d",&nr);
     if(nr==0) return 0;
     else
       {
           p=(Nod *)malloc(sizeof(Nod));
           p->info=nr;
           p->st=construire();
           p->dr=construire();
       }
    return p;
}

void inordine(Nod *p,int nivel)
{
    int i;
    if(p!=0)
       {
           inordine(p->st,nivel+1);
           for(i=0;i<=nivel;i++) printf(" ");
           printf("%2d\n",p->info);
           inordine(p->dr,nivel+1);
       }
}

void preordine(Nod *p,int nivel)
{
    int i;
    if(p!=0)
       {
           for(i=0;i<=nivel;i++) printf(" ");
           printf("%2d\n",p->info);
           preordine(p->st,nivel+1);
           preordine(p->dr,nivel+1);
       }

}

void postordine(Nod *p,int nivel,int *suma)
{
    int i;
    if(p!=0)
      {
          postordine(p->st,nivel+1,suma);
          postordine(p->dr,nivel+1,suma);
          for(i=0;i<=nivel;i++) printf(" ");
          printf("%2d\n",p->info);
          *suma+=p->info;
      }
}

int main()
{
    int suma=0;
    rad=construire();
    printf("Inordine\n");
    inordine(rad,0);
    printf("\n");
    //preordine(rad,0);
    printf("\n");
    //postordine(rad,0,&suma);
    printf("\nSuma= %d",suma);
  return 0;
}
