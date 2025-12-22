#include <stdio.h>
#include <stdlib.h>

typedef struct nod
{
    int inf;
    struct nod *st,*dr;
}Nod;

Nod * construire(Nod *rad,int x)
{
    Nod *p;
    if(rad==NULL)
    {
        p=(Nod *)malloc(sizeof(Nod));
        p->inf=x;
        p->st=p->dr=NULL;
        return p;
    }
    if(rad->inf>x) rad->st=construire(rad->st,x);
    if(rad->inf<x) rad->dr=construire(rad->dr,x);
    return rad;
}

void srd(Nod * rad)
{
    if(rad!=NULL)
    {
        srd(rad->st);

        srd(rad->dr);
        printf("%d ",rad->inf);
    }
}



int main()
{
    Nod *rad;
    rad=NULL;
    int i,n,x;
    scanf("%d",&n);
    for(i=1;i<=n;i++)
    {
        scanf("%d",&x);
        rad=construire(rad,x);

    }
    srd(rad);
    return 0;
}
