#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
typedef struct arbore
{
    float key;
    struct arbore *stg, *dr;
} NodeT;
NodeT *rad;
FILE *df;
int in1,in2;

NodeT *creare( NodeT* q, float y)
{
    if(q==0)
    {
        NodeT *p=(NodeT*)malloc(sizeof(NodeT));
        p->key=y;
        p->dr=0;
        p->stg=0;
        return p;
    }

    else if (q->key<y) q->dr=creare(q->dr,y);
    else if(q->key>y) q->stg=creare(q->stg,y);
    else ;
    return q;



}

void inordine(NodeT *p,int hight,int *h)
{
    int i;
    if(p!=0)
    {
        if(hight>*h) *h=hight;
        inordine(p->stg,hight+1,h);
        for(i=1; i<=2*hight; i++)
            printf(" ");
        printf("%.1f\n ",p->key);
        inordine(p->dr,hight+1,h);

    }
}
void inaltime(NodeT *p,int hight,int *h)
{
    int i;
    if(p!=0)
    {
        if(hight>*h) *h=hight;
        inaltime(p->stg,hight+1,h);
        for(i=1; i<=2*hight; i++)
            inaltime(p->dr,hight+1,h);

    }
}

void rotire_SD()
{
    NodeT *a, *b;

    a=rad->stg;
    b=a->dr;

    rad->stg=b;
    a->dr=b->stg;
    b->stg=a;

    rad->stg=b->dr;
    b->dr=rad;
    rad=b;

}

void rotire_DS()
{

    NodeT *a, *b;
    a=rad->dr;
    b=a->stg;

    rad->dr=b;
    a->stg=b->dr;
    b->dr=a;

    rad->dr=b->stg;
    b->stg=rad;
    rad=b;

}

int main()
{
    float n;
    int i,m;
    printf("Nr noduri");
    scanf("%d",&m);
    for(i=0; i<m; i++)
    {
        scanf("%f",&n);
        rad=creare(rad,n);
    }
    inaltime(rad->stg,1,&in1);
    inaltime(rad->dr,1,&in2);

    if(in1-in2>=2)
    {
        rotire_SD();
        inordine(rad,1,&in1);
    }
    printf("\n\n\n");


    if(in2-in1>=2)
    {
        rotire_DS();
        inordine(rad,1,&in1);
    }

    return 0;
}
