#include <stdio.h>
#include <stdlib.h>

typedef struct tip_nod {
                        int cheie;
                        char nume[20];
                        struct tip_nod *urm;
                        } TIP_NOD;
int citire_nod (TIP_NOD *p)
{
        printf("Cheie= ");
        scanf("%d",&p->cheie);
        printf("Nume= ");
        scanf("%s",p->nume);
        return 1;
}

void *creare_nod(void)
{
        TIP_NOD *p;
        p=(TIP_NOD*)malloc(sizeof(TIP_NOD));
        if (p==0) {printf("Nu s=a alocat memorie");
                    return 0;
                    };
        if (citire_nod(p))return p;
        else return 0;
}
void inserare(TIP_NOD **prim,TIP_NOD **ultim,TIP_NOD *p)
{
        if (*prim==0)
        {
            *prim=p;
            *ultim=p;
            (*ultim)->urm=0;
        }
        else {
            p->urm=*prim;
            *prim=p;
        }

}void inserare_dupa_cheie (TIP_NOD *prim,TIP_NOD **ultim,TIP_NOD *p,int cheie1)
{
        TIP_NOD *q=prim;
        if (prim==0) printf("Lista este vida");
        else while (q->urm!=0 & q->cheie!=cheie1){
                q=q->urm;
             }
        if (q==0) printf("Lista vida");
        else if (q==ultim) {
                                (*ultim)->cheie=p;
                                (*ultim)=p;
                                (*ultim)->urm=0;
                            }
             else { p->urm=q->urm;
                    q->urm=p;
                  }
}
void elib_nod (TIP_NOD **p)
{
    free(*p);

}

void stergere_prim_nod (TIP_NOD **prim,TIP_NOD **ultim)
{
    TIP_NOD *p;
    if(*prim==0)
    {
        printf("\nLista vida!");
        return;}
    p=*prim;
    *prim=(*prim)->urm;
    elib_nod(&p);
    if(*prim==0)
    {
        *ultim=0;
        printf("\nS-a sters primul nod.");
    }
}
void creare_lista(TIP_NOD **prim,TIP_NOD **ultim)
{
        TIP_NOD *p;
        p=creare_nod();
        inserare(prim,ultim,p);
}

int main()
{
    TIP_NOD *prim=0,*ultim=0,*p;
    int n,i,cheie1;
    printf("Numar de inregistrari dorite: ");
    scanf("%d",&n);
    for (i=0;i<n;i++)
    {
        creare_lista(&prim,&ultim);
    }
    p=prim;
    i=0;
    while (p!=0){
        printf("\n%d: Cheie %d  :   %s",i,p->cheie,p->nume);
        p=p->urm;
        i++;
        }
    //crearea unui nod si adaugarea in dupa o cheie
    printf("\n Cheie + nume dorite pentru reintroducere:\n");
    p=creare_nod();
    printf("Dupa ce cheie doriti inserarea : ");
    scanf("%d",&cheie1);
    inserare_dupa_cheie(prim,&ultim,p,cheie1);
    p=prim; i=0;
    while (p!=0){
        printf("\n%d: Cheie %d  :   %s",i,p->cheie,p->nume);
        p=p->urm;
        i++;
        }
        stergere_prim_nod(&prim,&ultim);
    return 0;
}
