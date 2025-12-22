#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <string.h>

typedef struct nod
{
    char nume[10];
    struct nod *prec,*urm;
}Nod;

void add(Nod **prim,Nod **ultim,char cop[10])
{
    Nod *p;
      p=(Nod *)malloc(sizeof(Nod));
       if((*prim)==0)
         {
             (*prim)=(*ultim)=p;
             strcpy((*prim)->nume,cop);
         }
       else
         {
              p->prec=(*ultim);
              (*ultim)->urm=p;
              (*ultim)=p;
              strcpy((*ultim)->nume,cop);
         }
       (*prim)->prec=(*ultim);
       (*ultim)->urm=(*prim);
}

void afisare(Nod *prim)
{
    Nod *p;
    p=prim;
     do{
        if(p==0) printf("Gol");
        else
          {
              printf("%s ",p->nume);
              p=p->urm;
          }
     }while(p!=prim);
}

void del(Nod **prim,Nod **ultim,Nod *p)
{
    Nod *q,*w;
     q=(*prim);
     w=(*prim)->urm;
    do{
       if(p==q)
        {
         if(p==(*prim))
           {
             if((*prim)==(*ultim))
              {
               //w=(*prim);
               (*prim)=(*ultim)=0;
              }
             else
              {

               q->prec=q->urm;
               q->urm=q->prec;
              (*prim)=w;

              }
           }
         else
           {
               //w=q;
               q->prec->urm=q->urm;
               q->urm->prec=q->prec;
           }
        }
        q=q->urm;
    }while(q!=(*prim));
   free(q);
}

int main()
{
    Nod *prim=0,*ultim=0,*p;
    int n,i,k=0,ok=0;
    char num[10];
      printf("Nr de copii: ");
        scanf("%d",&n);
      for(i=0;i<n;i++)
        {
           printf("Copil: ");
            scanf("%s",num);
           add(&prim,&ultim,num);
        }
      afisare(prim);
      p=prim;
 //p=p->urm;
                 del(&prim,&ultim,p);


      printf("\n");
      afisare(prim);
   return 0;
}
