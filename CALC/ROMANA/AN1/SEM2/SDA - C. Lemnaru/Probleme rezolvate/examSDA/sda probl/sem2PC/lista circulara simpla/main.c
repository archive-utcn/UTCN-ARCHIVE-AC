#include <stdio.h>
#include <stdlib.h>

typedef struct nod
{
    int info;
    struct nod *urm;
}Nod;

void adauga(Nod **prim,Nod **ultim,int n)
{
    Nod *p;
    int i,nr;
   for(i=0;i<n;i++)
   {
         printf("Info: ");
         scanf("%d",&nr);
    p=(struct nod *)malloc(sizeof(struct nod));
    if(*prim==0)
      {
        (*prim)=(*ultim)=p;
        (*prim)->info=nr;
      }
     else
      {
        (*ultim)->urm=p;
        (*ultim)=p;
        (*ultim)->info=nr;
      }
     (*ultim)->urm=0;
   }
     (*ultim)->urm=(*prim);
}

void afis(Nod **prim,Nod **ultim)
{
    Nod *p,*q;
    p=(*prim);
    q=(*ultim);
     while(p!=q)
       {
           printf(" %d ",q->info);
           q=q->urm;
       }
}

int main()
{
    struct Nod **prim,**ultim=0;
    int n,i;
    printf("Nr: ");
     scanf("%d",&n);
    adauga(&prim,&ultim,n);

     printf("\n\n");
     afis(&prim,&ultim);

}



