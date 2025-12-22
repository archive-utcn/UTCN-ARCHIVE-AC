#include<stdio.h>
#include<stdlib.h>

typedef struct nod{
                int cheie;
                char nume[20];
                int clasa;
                struct nod *urm;
                }NOD;
void main()
{
    NOD *p=0,*pnod=0;
    int i;
    for(i=0;i<5;i++)
    {
        p=(NOD*)malloc(sizeof(NOD));
        p->urm=0;
        if(pnod==0)
        {
            pnod=p;
            pnod->urm=p;
        }else
        {
        p->urm=pnod->urm;
        pnod->urm=p;
        pnod=p;
        }
    }
}


