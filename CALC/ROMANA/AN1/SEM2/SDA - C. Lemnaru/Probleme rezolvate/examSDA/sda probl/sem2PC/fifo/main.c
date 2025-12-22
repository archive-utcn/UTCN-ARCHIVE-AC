#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

typedef struct nod
{
    int info;
    struct nod *urm;
}Nod;

void add_prim(Nod **prim,Nod **ultim,int nr)
{
    Nod *p;
    p=(struct nod *)malloc(sizeof(struct nod));
    if((*prim)==0)
      {
          (*prim)=(*ultim)=p;
          (*ultim)->urm=0;
          p->info=nr;
      }
    else
      {
          p->urm=(*prim);
          (*prim)=p;
          p->info=nr;
      }
}

void afisare(Nod *prim)
{
    Nod *p=prim;
    if(p==0) printf("FIFO goala");
    else
       {
           while(p!=0)
             {
                 printf("%d  ",p->info);
                 p=p->urm;
             }
       }
}

void del(Nod **prim,Nod **ultim)
{
    Nod *q;
    q=(*prim);

     while(q!=0)
       {
           if((*prim)==(*ultim)) (*prim)=(*ultim)=0;

              if((q->urm)==(*ultim))
                 {
                     (*ultim)=q;
                     (*ultim)->urm=0;
                 }

            q=q->urm;
       }
     free(q);
}

int main()
{
    Nod *prim=0,*ultim=0;
    int a,nr,i;

     printf("Dimensiunea: ");
      scanf("%d",&a);

     for(i=0;i<a;i++)
       {
           printf("Info: ");
            scanf("%d",&nr);
           add_prim(&prim,&ultim,nr);
       }
     afisare(prim);
     del(&prim,&ultim);
     printf("\n");
     afisare(prim);

return 0;
}
