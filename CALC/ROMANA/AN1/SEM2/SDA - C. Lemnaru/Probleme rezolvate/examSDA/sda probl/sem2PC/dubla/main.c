#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

typedef struct nod
{
    int info;
    struct nod *prec,*urm;
}Nod;

void add(Nod **prim,Nod **ultim,int nr)
{
    Nod *p;
    p=(struct nod *)malloc(sizeof(struct nod));
    if((*prim)==0)
       {
           (*prim)=(*ultim)=p;
           p->prec=0;
           p->urm=0;
           p->info=nr;
       }
    else
       {
           p->prec=(*ultim);
           (*ultim)->urm=p;
           (*ultim)=p;
           (*ultim)->urm=0;
           (*ultim)->info=nr;
       }

}

void afisare_dir(Nod *prim)
{
    Nod *p;
    p=prim;

     do
       {
           if(p==0) printf("Gol");
           else
             {
                printf("%d  ",p->info);
                p=p->urm;
             }
       }while(p!=0);
}

void afisare_inv(Nod *ultim)
{
    Nod *q;
    q=ultim;

     while(q!=0)
       {
           if(q==0) printf("Gol");
           else
             {
               printf("%d  ",q->info);
               q=q->prec;
             }
       }
}

void del_prim(Nod **prim)
{
    Nod *p;
    p=(*prim);
    (*prim)=(*prim)->urm;
    (*prim)->prec=0;
    free(p);
}

void del_ultim(Nod **ultim)
{
    Nod *p;
    p=(*ultim);
    (*ultim)=(*ultim)->prec;
    (*ultim)->urm=0;
    free(p);
}

void del_key(Nod **prim,Nod **ultim)
{
    Nod *p;
    p=(*prim);

    int key;
      printf("Key: ");
       scanf("%d",&key);
     while(p!=0)
       {
           if(p->info==key)
             {
                 if((*prim)==(*ultim))
                   {
                      (*prim)=0;
                      (*ultim)=0;
                   }
                 else if(p==(*prim))
                   {
                     del_prim(&(*prim));
                   }
                 else if(p==(*ultim))
                   {
                      del_ultim(&(*ultim));
                   }
                 else
                   {
                      p->prec->urm=p->urm;
                      p->prec=p->urm->prec;
                   }
             }
           p=p->urm;
       }
      free(p);
}

void add_dupa_key(Nod **prim,Nod **ultim)
{
    Nod *p,*q;
    p=(*prim);
    int key,nr;
     printf("Key: ");
      scanf("%d",&key);
     while(p!=0)
       {
           if(p->info==key)
             {
                 printf("Nr: ");
                  scanf("%d",&nr);
                 q=(struct nod *)malloc(sizeof(struct nod));
                 if(p==(*ultim))
                   {
                       q->prec=(*ultim);
                       (*ultim)->urm=q;
                       (*ultim)=q;
                       (*ultim)->urm=0;
                       (*ultim)->info=nr;
                   }
                 else
                   {
                       q->urm=p->urm;
                       p->urm=q;
                       q->prec=q->urm->prec;
                       q->info=nr;
                   }
             }
            p=p->urm;
       }

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
           add(&prim,&ultim,nr);
       }
     afisare_dir(prim);
     printf("\n");
     afisare_inv(ultim);
     del_prim(&prim);
     printf("\n");
     afisare_dir(prim);
     del_ultim(&ultim);
     printf("\n");
     afisare_dir(prim);
     printf("\n");
     del_key(&prim,&ultim);
     printf("\n");
     afisare_dir(prim);
     printf("\n");
     add_dupa_key(&prim,&ultim);
     afisare_dir(prim);


return 0;
}
