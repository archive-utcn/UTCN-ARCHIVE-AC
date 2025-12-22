/*10. Sa se scrie un program care transforma un arbore binar într-o lista dublu înlantuita si care foloseste functii
de pretty-print (tiparire frumoasa) pentru afisare.*/
#include <stdio.h>
#include <stdlib.h>

typedef struct a{
    char key;
    int niv;
    struct a *stg,*dr;
}arb;

arb *rad;

typedef struct b{
    struct b *urm;
    arb *ptr;
}nod;

nod *prim,*ultim;
int niv;

arb *construireArbore(int niv)
{
    arb *p;
    char key;
    fflush(stdin);
    scanf("%c",&key);
    if(key=='o')
    return 0;
    else
    {
        p=(arb*)malloc(sizeof(arb));
        p->key=key;
        p->niv=niv;
        p->stg=construireArbore(niv+1);
        p->dr=construireArbore(niv+1);
        return p;
    }
}


int push(arb *p)
{
    nod  *q;
    q=(nod*)malloc(sizeof(nod));
    q->ptr=p;
    q->urm=prim;
    prim=q;
    return 1;
}

arb *pop()
{
    arb *p;
    nod *q;
    if (!prim)
    return 0;
    else
    {
        q=prim;
        prim=prim->urm;
        p=q->ptr;
        free(q);
        return p;
    }
}

int adaugareCoada(arb *p)
{
    nod *q;
    q=(nod*)malloc(sizeof(nod));
    q->ptr=p;
    q->urm=0;
    if(!prim)
    {
        prim=q;
        ultim=q;
    }
    else
    {
        ultim->urm=q;
        ultim=q;
    }
    return 1;
}

arb *extragereCoada()
{
    nod *p;
    arb *q;
    if(!prim)
    return 0;
    p=prim;
    prim=prim->urm;
    if(!prim)
    ultim=0;
    q=p->ptr;
    free(p);
    return q;
}


int traversare(arb *rad)
{
    arb  *p;
    int i;
    prim=0;
    ultim=0;
    if(!adaugareCoada(rad))
    return 0;
    do
    {
        p=extragereCoada();
        if(p)
        {
            if(niv!=p->niv)
            {
                printf("\n");
                niv=p->niv;
            }
            for(i=0;i<6/niv;i++)
            printf("  ");
            printf(" %c",p->key);
            if(!adaugareCoada(p->stg))
            return 0;
            if(!adaugareCoada(p->dr))
            return 0;
        }
    }while(p||prim);
    return 1;
}

int main()
{
    rad=construireArbore(1);
    niv=rad->niv;
    printf("\n");
    traversare(rad);
    return 0;
}
