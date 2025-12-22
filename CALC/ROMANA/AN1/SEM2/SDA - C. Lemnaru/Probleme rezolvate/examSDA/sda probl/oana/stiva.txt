#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

typedef struct nod
{
    int info;
    struct nod *urm;
}Nod;

void afisare(Nod *prim)
{
    Nod *p;
    p=prim;
     if(p==0) printf("Stiva goala");
     else
      {
          while(p!=0)
            {
                printf("%d  ",p->info);
                p=p->urm;
            }
      }
}

void push(Nod **prim,Nod **ultim,int nr)
{
    Nod *p;
    p=(Nod *)malloc(sizeof(Nod));
    if((*prim)==0)
      {
          (*prim)=(*ultim)=p;
          (*prim)->info=nr;
      }
    else
      {
          p->urm=(*prim);
          (*prim)=p;
          (*prim)->info=nr;
      }
    (*ultim)->urm=0;
}

void pop(Nod **prim,Nod **ultim)
{
    Nod *p;
     p=(*prim);

    if((*prim)==(*ultim)) (*prim)=(*ultim)=0;
    else (*prim)=(*prim)->urm;

    free(p);
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
           push(&prim,&ultim,nr);
       }
     afisare(prim);
     printf("\n");

     for(i=0;i<a;i++)
      {
          pop(&prim,&ultim);
          afisare(prim);
          printf("\n");
      }

     return 0;
}
