#include <stdio.h>
#include <stdlib.h>

typedef struct nod
{
    int inf;
    struct nod *st,*dr;
}Nod;

Nod * construire(Nod **rad)
{
    int x;
    Nod *p;
    scanf("%d",&x);
    if(x==0) p=NULL;
    else
    {
        p=(Nod *)malloc(sizeof(Nod));
        p->inf=x;
        p->st=construire(rad);
        p->dr=construire(rad);
    }
    return p;
}

void srd(Nod * rad)
{
    if(rad!=NULL)
    {
        srd(rad->st);
        printf("%d ",rad->inf);
        srd(rad->dr);
    }
}



int main()
{
    Nod *rad;
    rad=construire(&rad);
    srd(rad);
    return 0;
}
