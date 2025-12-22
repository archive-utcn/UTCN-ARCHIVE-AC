#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct nod
{
    char nr;
    struct nod *st,*dr;
}NOD;

NOD *constructie()
{
    NOD *p;
    char c;
    scanf("%c",&c);
    if(c=='*') return 0;
    else
    {
        p=malloc(sizeof(NOD));
        p->nr=c;
        p->st=constructie();
        p->dr=constructie();
    }
    return p;
}

void preordine(NOD *p,int nivel)
{
    if(p)
    {
        printf(" %c ",p->nr);
        preordine(p->st,nivel+1);
        preordine(p->dr,nivel+1);
    }
}


void inordine(NOD *p,int nivel)
{
    if(p)
    {
        inordine(p->st,nivel+1);
        printf(" %c ",p->nr);
        inordine(p->dr,nivel+1);
    }
}


void postordine(NOD *p,int nivel)
{
    if(p)
    {
        postordine(p->st,nivel+1);
        postordine(p->dr,nivel+1);
        printf(" %c ",p->nr);

    }
}

void main ()
{
    NOD *rad;
    rad=constructie();
    printf("\nVizitare in preordine");
    preordine(rad,0);
    printf("\nVizitare in inordine");
    inordine(rad,0);
    printf("\nVizitare in postordine");
    postordine(rad,0);
    getch();
}
