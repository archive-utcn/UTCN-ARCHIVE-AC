#include <stdio.h>
#include <stdlib.h>

typedef struct nod
{
    int inf;
    struct nod *urm;
}Nod;

void creare(Nod **prim, int x)
{
    Nod *q;
    if((*prim)==NULL)
    {
        *prim=(Nod*)malloc(sizeof(Nod));
        (*prim)->inf=x;
        (*prim)->urm=(*prim);
    }
    else
    {
        q=(Nod*)malloc(sizeof(Nod));
        q->inf=x;
        q->urm=(*prim)->urm;
        (*prim)->urm=q;
    }
}

void af(Nod *prim)
{
    Nod *p;
    p=prim;
    while(p->urm!=prim)
    {
        printf("%d ",p->inf);
        p=p->urm;
    }
    printf("%d\n",p->inf);
}

void stergere(Nod **prim, int x)
{
    Nod *p;
    if((*prim)->inf==x)
    {
        p=*prim;
        while(p->urm!=(*prim))
            p=p->urm;
        p->urm=(*prim)->urm;
        (*prim)=(*prim)->urm;
    }
    else
    {
        p=*prim;
        while(p->urm->inf!=x) p=p->urm;
        p->urm=p->urm->urm;
    }
}

int main()
{
    Nod *prim;
    int x,n,i;
    scanf("%d",&n);
    prim=NULL;
    for(i=1;i<=n;i++)
    {
        scanf("%d",&x);
        creare(&prim,x);
//        af(prim);
    }
    af(prim);
    printf("DA`TI VAL:");
    scanf("%d",&x);
    stergere(&prim,x);
    af(prim);
    return 0;
}
