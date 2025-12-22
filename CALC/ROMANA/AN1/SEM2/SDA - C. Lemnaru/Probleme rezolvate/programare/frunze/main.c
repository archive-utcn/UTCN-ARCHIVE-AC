//3.11	Să se scrie o funcţie care determină numărul de frunze ale unui arbore binar.
#include <stdio.h>
#include <stdlib.h>

typedef struct nod
{
    struct nod *st,*dr;
    int inf;
}NOD;

NOD* construire(NOD **rad)
{
    NOD *p;
    int a;

    scanf("%d",&a);
    if(a==0) p=NULL;
    else
    {
        p=(NOD *)malloc(sizeof(NOD));
        p->inf=a;
        p->st=construire(rad);
        p->dr=construire(rad);
    }
    return p;
}

int nr=0;

void frunze(NOD *rad)
{
    if(rad!=NULL)
    {
        if(rad->st==NULL&&rad->dr==NULL) nr=nr+1;
        frunze(rad->st);
        frunze(rad->dr);
    }

}

int main()
{
    NOD *rad;
    rad=construire(&rad);
    frunze(rad);
    printf("nr de frunze: %d",nr);
    return 0;
}
