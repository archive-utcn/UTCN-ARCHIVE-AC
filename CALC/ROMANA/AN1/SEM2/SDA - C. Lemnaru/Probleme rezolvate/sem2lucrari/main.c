#include <stdio.h>
#include <stdlib.h>

typedef struct copil
    {char nume[10];
     struct copil *urm;}jucator;

jucator *p,*q,*r;

int main()
{  int n,k,i;

   printf("Dati numarul de jucatori:");
   scanf("%d",&n);

   printf("\nDin cat in cat se numara:");
   scanf("%d",&k);

   p=malloc(sizeof(jucator));
   printf("Dati numele jucatorului 1:");
   scanf("%s",&p->nume);
   p->urm=p;
   q=p;

   for(i=2;i<=n;i++)
   {
       r=malloc(sizeof(jucator));
       p->urm=r;
       printf("Dati numele jucatorului %d:",i);
       scanf("%s",&r->nume);
       p=p->urm;
       p->urm=q;
   }

   printf("Lista d jucatori este:");
   p=q;
   for(i=1;i<=n;i++)
   {
       printf(" %s ",p->nume);
       p=p->urm;
   }


char caut[10];
int gasit;
do
{   gasit=0;
    p=q;
    printf("\nDati persoana de la care se incepe numaratoarea:");
    scanf("%s",&caut);
    do
    {
        if(strcmp(caut,p->nume)==0){q=p;
                                    gasit=1;
                                    break;}
        else p=p->urm;

    }while(p!=q);
}while(gasit==0);

p=q;
   while(p->urm!=p)
   {
      for(i=1;i<k;i++)
       r=p;
       p=p->urm;

    q=p;
    r->urm=p->urm;
    free(q);
    p=r->urm;
   }

   printf("\nCastigatorul este:%s",p->nume);

}
