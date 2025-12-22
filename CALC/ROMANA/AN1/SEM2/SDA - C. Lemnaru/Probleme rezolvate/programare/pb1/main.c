#include <stdio.h>
#include <stdlib.h>

typedef struct nod
{
    int inf;
    struct nod * urm;
}Nod;

void af(Nod *prim)
{
    Nod *p;
    p=prim;
    while(p!=NULL)
    {
        printf("%d ",p->inf);
        p=p->urm;
    }
    printf("\n");
}

int main()
{
    int n,i,x,y;
    Nod *prim,*ultim,*p,*q;
    prim=ultim=NULL;
    scanf("%d",&n);
    for(i=1;i<=n;i++)
    {
        scanf("%d",&x);
        if(prim==NULL&&ultim==NULL)
        {
            prim=(Nod *)malloc(sizeof(Nod));
            prim->inf=x;
            prim->urm=NULL;
            ultim=prim;

        }
        else
        {
            p=(Nod *)malloc(sizeof(Nod));
            p->inf=x;
            p->urm=NULL;
            ultim->urm=p;
            ultim=p;
        }
    }
    af(prim);
    printf("dat val nod:");
    scanf("%d",&x);
    if(prim->inf==x)
    {
        p=prim;
        prim=prim->urm;
        free(p);
    }
    else
    {
        p=prim;
        while(p->urm->inf!=x)
            p=p->urm;
       // printf("p->inf=%d",p->inf);
        if(p->urm==ultim) ultim=p;
        p->urm=p->urm->urm;

    }
    af(prim);

    printf("inseram dupa nodu de val:");
    scanf("%d",&x);
    printf("inf:");
    scanf("%d",&y);
    p=prim;
    while(p->inf!=x)
        p=p->urm;
    q=(Nod*)malloc(sizeof(Nod));
    q->inf=y;
    q->urm=p->urm;
    p->urm=q;
    if(p==ultim) ultim=q;
    af(prim);

    printf("inseram inainte nodu de val:");
    scanf("%d",&x);
    printf("inf:");
    scanf("%d",&y);
    if(prim->inf==x)
    {
         q=(Nod*)malloc(sizeof(Nod));
        q->inf=y;
        q->urm=prim;
        prim=q;
    }
    else
    {
    p=prim;
    while(p->urm->inf!=x) p=p->urm;
    q=(Nod*)malloc(sizeof(Nod));
    q->inf=y;
    q->urm=p->urm;
    p->urm=q;
    }
    af(prim);
    return 0;
}
