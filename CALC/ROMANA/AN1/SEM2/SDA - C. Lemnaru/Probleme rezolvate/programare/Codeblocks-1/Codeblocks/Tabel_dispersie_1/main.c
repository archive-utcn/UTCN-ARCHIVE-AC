#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define M 97

typedef struct nod
{
    char nr[80];
    struct nod *urm;
}NOD;
NOD *prim;

NOD *H[M];

void adauga(NOD **p_nod,char x[80])
{
    NOD *q,*p;
    q=(NOD *)malloc(sizeof(NOD));
    strcpy(q->nr,x);
    if((*p_nod)==NULL)
    {
          q->urm=NULL;
          (*p_nod)=q;
    }
    else
    {
        p=(*p_nod);
        while(p->urm!=NULL) p=p->urm;
        p->urm=q;
        q->urm=NULL;
    }


}


void afisare(NOD *p_nod)
{
        NOD *p;
        p=p_nod;
        while(p!=NULL)
        {
            printf("%s ",p->nr);
            p=p->urm;
        }

}


void cautare()
{
    char h[80];
    fflush(stdin);
    printf("\n Elementul cautat este \n");
    gets(h);

    int n=strlen(h);
    int x=0;
    int y;
    int buff;
    for (y=0;y<n;y++)
    {
        buff=(int) h[y];
        x=x+buff;

    }

    x=x%100;
    NOD *p;
        p=H[x];
        while(p!=NULL)
        {
            if (strcmp(p->nr,h) == 0 ) {printf("\nAm gasit elementul %s ",p->nr); return;}
            p=p->urm;
        }
    printf("\n\nNu s-a gasit elementul %s ",h);
}

void citire()
{
    char h[80];
    fflush(stdin);
    gets(h);

    int n=strlen(h);
    int x=0;
    int y;
    int buff;
    for (y=0;y<n;y++)
    {
        buff=(int) h[y];
        x=x+buff;

    }

    x=x%100;


    adauga(&H[x],h);

}

void afiseaza()
{

int x;


for (x=0;x<M;x++)

{
   if (H[x] != NULL){   printf("\n\n Pe pozitia %d este : ",x);
      afisare(H[x]);}
}


}

int main()
{
    int n,i,x;
    printf("Numar inregistrari?\n");
    scanf("%d",&n);
    for(i=1;i<=n;i++)
    {
     citire();
    }
            afiseaza();
            cautare();
   return 0;
}

