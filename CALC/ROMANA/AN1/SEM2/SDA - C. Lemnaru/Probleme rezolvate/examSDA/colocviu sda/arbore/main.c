#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

struct nod{
            struct nod *stg,*dr;
            char inf;
            };
struct nod *rad;
struct nod *creare(void)
{
    struct nod *p;
    char c;
    printf("Dati caract de indentificare al nodului:\n");
    scanf("%c",&c);
    if (c=='*') return 0;
    else
    {
          p=(struct nod *)malloc(sizeof(struct nod));
          p->inf=c;
          p->stg=creare();
          p->dr=creare();
    }
    return p;
}

void preordine(struct nod *p,int nivel)
{
    int i;
    //struct nod *p;
    if (p!=0)
    {
        for (i=0;i<nivel;i++) printf(" ");
        printf("%c\n",p->inf);
        preordine(p->stg,nivel+1);
        preordine(p->dr,nivel+1);
    }
}
void inordine(struct nod *p,int nivel)
{
    int i;
    if (p!=0)
    {
    inordine(p->stg,nivel+1);
    for (i=0;i<nivel;i++) printf(" ");
    printf("%c\n",p->inf);
    inordine(p->dr,nivel+1);
    }
}
void postordine(struct nod *p,int nivel)
{
    int i;
    if (p!=0)
    {
        postordine(p->stg,nivel+1);
        postordine(p->dr,nivel+1);
        for (i=0;i<nivel;i++) printf(" ");
        printf("%c\n",p->inf);
    }
}

void main(void)
{
    rad=creare();
    printf("vizualizati in preordine:\n");
    preordine(rad,0);
    printf("vizualizati in inordine\n");
    inordine(rad,0);
    printf("vizualizati in postordine\n");
    postordine(rad,0);
}
