#include <stdio.h>
#include <stdlib.h>

typedef struct tip_nod
{
    int cheie;
    struct tip_nod *urm;
    struct tip_nod *prec;
} nod;

int main()
{
   nod *prim, *ultim, *p, *q;
   int n, i, m, k, l, j;

   //prim->prec=0;
   //ultim->urm=0;
   prim=0; ultim=0;
   printf("Dati n: ");
   scanf("%d", &n);
   i=0;
   while(i!=n)
   {
       p=malloc(sizeof(nod));
       scanf("%d", &p->cheie);
       if(prim==0)
       {
        prim = p; ultim = p;
        p->urm=0; p->prec=0;
        ultim->urm = prim;
        }
        else
        {
        ultim->urm = p; p->prec=ultim;
        ultim=p;ultim->urm = prim;
        }
        //printf("%d", p->cheie);
    i++;
   }

   printf("\nLista este: \n");
   if(ultim!=0)
   {p=ultim;
   while(p!=0)
   {
       printf("%d ", p->cheie);
       p=p->urm;
   }}

   printf("Dati valoarea noului nod: ");
   q=malloc(sizeof(nod));
   scanf("%d", &q->cheie);
   printf("Dati valoarea nodului inaintea caruia sa fie inserat: ");
   scanf("%d", &m);
   p=prim; k=0;
   while(p!=0)
   {
       if(p->cheie==m) k++;
       p=p->urm;
   }
   if(k==0) printf("Nu exista nodul. ");
    else
    {
        p=prim;
        while (p!=0)
        {
            if (p->cheie==m) break;
            p=p->urm;
        }
       if (p==prim)
       {
           q->urm=prim;
           q->prec=0;
           prim->prec=q;
           prim=q;
       }
       else
       {
           q->urm=p;
           q->prec=p->prec;
           p->prec->urm=q;
           p->prec=q;
       }
    }
   printf("\nLista noua este: \n");
   p=prim;
   while(p!=0)
   {
       printf("%d ", p->cheie);
       p=p->urm;
   }

   printf("\n Dati nodul care trebuie sters: ");
   scanf("%d", &l);
   p=prim; j=0;
   while(p!=0)
   {
       if(p->cheie==l) j++;
       p=p->urm;
   }
   if(j==0) printf("Nu exista nodul. ");
    else
    {
        p=prim;
        while (p!=0)
        {
            if (p->cheie==l) break;
            p=p->urm;
        }
        if(p==prim)
        {
            prim=prim->urm;
            free(p);
        }
        else if (p==ultim)
        {
            ultim=ultim->prec; ultim->urm=0;
            free(p);
        }
        else
        {
            p->urm->prec=p->prec;
            p->prec->urm=p->urm;
            free(p);
        }
    }
     printf("\nLista noua este: \n");
   p=prim;
   while(p!=0)
   {
       printf("%d ", p->cheie);
       p=p->urm;
   }

}
