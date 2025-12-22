#include <stdio.h>
#include <stdlib.h>

typedef struct nod
{
int key;
int fr ;
struct nod *st , *dr ;
} Nod;

Nod *rad ;



void inserare ( int cheie)
{
Nod *p, *q;
p = ( Nod *) malloc ( sizeof ( Nod ) ) ;
p->key = cheie;
p->st =0;
p->dr=0;
p->fr=1;
if ( rad == NULL )
    {
    rad = p;
    return;
    }
q = rad ;
while (1)
{
    if ( cheie < q->key )
        {
        if ( q-> st == NULL )
            {
            q->st = p;
            return;
            }
        else q = q->st ;
        }
    else
    if ( cheie > q->key )
        {
        if ( q-> dr == NULL )
            {
            q->dr = p;
            return;
            }
        else q = q->dr ;
        }
    else
    if ( cheie == q->key )
    {
    q->fr++;
    free( p ) ;
    return;
    }
}
}


void IN(Nod *p)
{
    if (p->st != 0) {IN(p->st);}
    if (p->fr == 1) printf("  %d; \n",p->key); else printf("  %d (x%d); \n",p->key,p->fr);
    if (p->dr != 0) {IN(p->dr);}
    return ;
}

void afisare()
{
    int i;
    scanf("%d",&i);
    inserare(i);
    return;
}

int main()
{

    int n,i;

    printf("Cate elemente vor fi?\n");
    scanf("%d",&n);
    printf("Dati elementele \n");
    for (i=0;i<n;i++)
    afisare();
    printf("\n\nArborele in in ordine:\n");
    IN(rad);
   return 0;
}

