#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct nod
{
    int cheie;
    struct nod *urm;
    struct nod *prec;

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


void inserare1(NOD **prim,NOD **ultim,NOD *p)
{
        p->prec=0;
        if(*prim==0)
        {
            *prim=p; *ultim=p; p->urm=0;
        }
        else
        {
            p->urm=*prim; (*prim)->prec=p; *prim=p;
        }
}


NOD *cautare_nod_cheie_data(NOD *p_nod,int key)
{
    NOD *p;
    if(p_nod==0)
    {
    printf("\nLista vida");
    return 0;
    }
    p=p_nod;
    do{
    if(p->cheie==key) return p;
    p=p->urm;}while(p!=p_nod);
    }



void inserare_dupa_cheie (NOD **prim,NOD **ultim,NOD *p,int *key)
{
        NOD *q;
        q=cautare_nod_cheie_data(prim,key);
        if(q==0)
        {
            printf("\nLista nu contine nod de cheie data");
        }
        if(q==*prim)
        {
            p->urm=*prim; p->prec=0;   (*prim)->prec=p;   *prim=p;
        }

         //   p->prec=*ultim;   (*ultim)->urm=p;   *ultim=p;
        else
        {
            p->urm=q; p->prec=q->prec;  q->prec->urm=p;  q->prec=p;
        }
}



void creare_lista1(NOD **prim,NOD **ultim)
{
        NOD *p;
        p=creare_nod();
        inserare1(prim,ultim,p);
}

void inserare_dupa_ultim_nod(NOD **prim,NOD **ultim,NOD *p)
{
    p->urm==0;
    if(*prim==0)
    {
        *prim=p;   *ultim=p; p->urm=0;
    }
    else
    {
        p->urm=*prim; p->prec=0;
        (*prim)->prec=p; *prim=p;
    }
}

void stergere_nod_cheie_data(NOD **prim,NOD **ultim,int *key)
{
    NOD *q;
    if(*prim==0)
    {
        printf("Lista vida!\n");
    }
    q=cautare_nod_cheie_data(*prim,key);
    if(q==0)
    {
        printf("\nLista nu contine nod de cheie data!");
    }
    if(q==*prim)
    stergere_prim_nod(prim,ultim);
    else if(q==*ultim) stergere_ultim_nod(prim,ultim);
    else
    {
        q->urm->prec=q->prec; q->prec->urm=q->urm;
        free(&q);
    }

}
void stergere_prim_nod(NOD **prim,NOD **ultim)
{
    NOD *p;
    if(*prim==0)
    {
        printf("\nLista vida!");
    }
    p=*prim;
    *prim=(*prim)->urm;
    free(&p);
    if(*prim==0)
    {
        *ultim=0;
    }
    else (*prim)->prec=0;
}


void stergere_ultim_nod(NOD **prim,NOD **ultim)
{
    NOD *p;
    if(*prim==0)
    {
        printf("\nLista vida!");
    }
    p=*ultim;
    *ultim=(*ultim)->prec;
    if(*ultim==0)
    {
        *prim=0;
    }
    else (*ultim)->urm=0;
    free(&p);
}



int main()
{
    NOD *prim=0,*ultim=0,*p;
    int n,i,cheie1,m;
    printf("Numar de inregistrari: ");
    scanf("%d",&n);
    for (i=0;i<n;i++)
    {
        creare_lista1(&prim,&ultim);
    }
    p=prim;
    i=0;
    while (p!=0){
        printf(" %d ",p->cheie);
        p=p->urm;
        i++;
        }
    printf("\nIntroduceti valoare pentru a o insera:");
    p=creare_nod();
    printf("Inainte de ce cheie doriti inserarea : ");
    scanf("%d",&cheie1);
    inserare_dupa_cheie(prim,ultim,p,cheie1);
        printf("\n");
    p=prim;
    i=0;
    while (p!=0){
        printf(" %d ",p->cheie);
        p=p->urm;
        i++;
    }
        printf("\n");
    printf("Nodul de ce cheie doriti sa il stergeti : ");
    scanf("%d",&cheie1);
    stergere_nod_cheie_data(&prim,&ultim,cheie1);
    p=prim;
    i=0;
    while (p!=0){
        printf(" %d ",p->cheie);
        p=p->urm;
        i++;
        }
    printf("\n");
}




