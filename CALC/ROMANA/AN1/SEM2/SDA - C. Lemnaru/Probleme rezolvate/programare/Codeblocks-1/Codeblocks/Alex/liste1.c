#include <stdio.h>
#include <stdlib.h>
#include<string.h>
typedef struct nod
    {
        int cheie;
        struct nod *urm;
    }NOD;
NOD *prim,*ultim;

void creare(NOD *p)
{
    prim=0;
    ultim=0;
    p=(NOD *)malloc(sizeof(NOD));
    p->urm=0;
    if(ultim!=0)
    ultim->urm=p;
    else
        prim=p;
        ultim=p;
}

int main()
{
    int n,i,*p;
    printf("Numere introduse:");
    scanf("%d",&n);
    for(i=0;i<n;i++)
    {
    creare(&p);

}}
