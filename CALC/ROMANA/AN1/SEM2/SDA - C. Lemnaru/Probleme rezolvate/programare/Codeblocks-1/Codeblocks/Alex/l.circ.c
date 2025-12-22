#include<stdio.h>
#include<stdlib.h>

typedef struct nod{
                int cheie;
                struct nod *urm;
                }NOD;

int citire_nod(NOD *p)
    {
        printf("\nCheie: ");
        scanf("%d",&p->cheie);
        return 1;
    }

void *creare_nod(void)
{
        NOD *p;
        p=(NOD*)malloc(sizeof(NOD));
        if (p==0) {printf("Nu s=a alocat memorie");
                    return 0;
                    }
        if(citire_nod(p))return p;
        else return 0;
}

void inserare(NOD **p_nod,NOD *p)
{
    NOD *q;
        if (*p_nod==0)
        {
            *p_nod=p;
            (*p_nod)->urm=*p_nod;
        }
        else {
            q=(*p_nod)->urm;
            while(q->urm!=*p_nod)
            q=q->urm;
            p->urm=*p_nod;
            q->urm=p;
        }
}

NOD *cautare_nod_cheie_data(NOD *p_nod,int *key)
{
    NOD *p;
    if(p_nod==0)
    {
    printf("\nLista vida");
    return 0;
    }
    p=p_nod;
    do{
    if(strcmp(p->cheie,key==0)) return p;
    p=p->urm;}while(p!=p_nod);
    }


void inserare_dupa_cheie (NOD *p_nod,NOD *p,int *key1)
{
      NOD *q;
      q=cautare_nod_cheie_data(p_nod,key1);
      if(q==0)
      {printf("\nLista nu contine modul cheie");
      return 0;
      }
      p->urm=q->urm;
      q->urm=p;
      return 1;
      }


void creare_lista(NOD **prim)
{
        NOD *p;
        p=creare_nod();
        inserare(prim,p);
}

int main()
{
    NOD *prim=0,*p;
    int n,i,cheie1;
    printf("Numar de inregistrari: ");
    scanf("%d",&n);
    for (i=0;i<n;i++)
    {
        creare_lista(&prim);
    }
    p=prim;
    if(p!=0)
    do{
        printf(" %d ",p->cheie);
        p=p->urm;
        }while(p!=prim);

    printf("\n :Introduceti valoare\n");
    p=creare_nod();
    printf("Dupa ce cheie doriti inserarea : ");
    scanf("%d",&cheie1);
    inserare_dupa_cheie(prim,p,cheie1);

    p=prim;
    if(p!=0)
    do{
        printf(" %d ",p->cheie);
        p=p->urm;
        }while(p!=prim);

    return 0;
}
