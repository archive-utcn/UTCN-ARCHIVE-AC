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
          (*ultim)->urm=(*prim);
          p->info=nr;
      }
    else
      {
          p->urm=(*prim);
          (*prim)=p;
          (*ultim)->urm=(*prim);
          p->info=nr;
      }
}

void afisare(Nod *prim,Nod *ultim)
{
    Nod *q=prim;
    int ok=0;
      do
        {
           if(q==0)
              {
                  printf("Gol");
                  ok=1;
              }
           else
              {
                  printf("%d  ",q->info);
                  q=q->urm;
              }
        }while(q!=prim);
}

void del(Nod **prim,Nod **ultim)
{
    Nod *q,*p;
    q=(*prim);
    int ok=0;
     while(ok!=1)
       {
           if((*prim)==(*ultim))
             {
                 (*prim)=0;
                 (*ultim)=0;
                 ok=1;
             }
            else{
              if(q==(*ultim))
                 {
                     (*ultim)=p;
                     (*ultim)->urm=(*prim);
                     ok=1;
                 }
            }
            p=q;
            q=q->urm;
       }
     free(p);
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
     afisare(prim,ultim);
      del(&prim,&ultim);
      printf("\n");
     afisare(prim,ultim);

return 0;
}
