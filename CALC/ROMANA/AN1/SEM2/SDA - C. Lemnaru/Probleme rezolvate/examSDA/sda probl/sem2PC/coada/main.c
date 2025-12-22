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
     (*ultim)->urm=0;
}

void extrag(Nod **prim,Nod **ultim)
{
    Nod *p;
    p=(*prim);
     if((*prim)==(*ultim)) (*prim)=(*ultim)=0;
     else
      {
         (*prim)=(*prim)->urm;
      }

   free(p);
}

void afisare(Nod *prim)
{
    Nod *p;
    p=prim;
    if(p==0) printf("\nCoada goala");
    else
    {
     while(p!=0)
      {
          printf("%d  ",p->info);
          p=p->urm;
      }
    }
}

int main()
{
    Nod *prim=0,*ultim=0;
    int nr,a,i;
     printf("Nr de noduri: ");
       scanf("%d",&a);
     for(i=0;i<a;i++)
       {
           printf("Info: ");
            scanf("%d",&nr);
           add(&prim,&ultim,nr);
       }
     afisare(prim);
     printf("\n");

     for(i=0;i<a;i++)
      {
          extrag(&prim,&ultim);
          afisare(prim);
          printf("\n");
      }

     return 0;
}
