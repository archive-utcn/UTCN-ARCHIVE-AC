#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

struct nod{
            struct nod *stg,*dr;
            char inf;
            };
//struct nod *rad;
struct nod *creare()
{
    struct nod *p;
    char c;
    printf ("dati caracterul nodului:\n");
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

struct nod *inserare(struct nod *rad,int key)
{
    struct nod *p;
    if (rad==0)
    {
        p=(struct nod *)malloc(sizeof(struct nod));
        p->inf=key;
        p->stg=0;
        p->dr=0; return p;
    }
    else
        if (key<rad->inf)
            rad->stg=inserare(rad->stg,key);
        else if (key>rad->inf)
            rad->dr=inserare(rad->dr,key);
            else printf("cheia se afla deja ");
            return rad;
}
struct nod *rad;
void main()
{
    char key;
    printf("dati keia");
    scanf("%c",&key);
     rad=creare();
    rad=inserare(rad,key);
}
