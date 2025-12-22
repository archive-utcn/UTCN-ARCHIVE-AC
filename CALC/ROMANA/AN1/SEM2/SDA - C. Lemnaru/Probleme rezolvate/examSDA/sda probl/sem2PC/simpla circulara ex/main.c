#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

typedef struct nod
{
    int info;
    struct nod *urm;
}Nod;

void add(Nod **prim,Nod **ultim,int nr)
{
    Nod *p;
    p=(Nod *)malloc(sizeof(Nod));
     if((*prim)==0)
       {
           (*prim)=(*ultim)=p;
           p->info=nr;
       }
     else
       {
           (*ultim)->urm=p;
           (*ultim)=p;
           (*ultim)->info=nr;
       }
     (*ultim)->urm=(*prim);
}

void afis(Nod *prim)
{
    Nod *p;
    p=prim;
    if(p==0) printf("Lista goala!");
    else
    {
     do{
         printf("%d  ",p->info);
         p=p->urm;
      }while(p!=prim);
    }
}

int main()
{
     Nod *prim=0,*ultim=0;
    int a,i,nr;
     printf("Dim: ");
      scanf("%d",&a);
     for(i=0;i<a;i++)
       {
           printf("Info: ");
            scanf("%d",&nr);
           add(&prim,&ultim,nr);
       }
      printf("\n");
      afis(prim);
     return 0;
}
