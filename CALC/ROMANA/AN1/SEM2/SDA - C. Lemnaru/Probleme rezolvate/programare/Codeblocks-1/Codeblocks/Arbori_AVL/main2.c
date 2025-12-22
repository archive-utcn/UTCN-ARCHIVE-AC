#include <stdio.h>
#include <stdlib.h>

typedef struct tip_NOD {
    int ch;
    int ech;
    struct tip_NOD *st,*dr;
}NOD;



void echilibrare(NOD *p)
{
int hst,hdr;
hst=1; hdr=1;
if(p->st!=NULL)
drum_maxim(p->st,hst,1);
else
hst=0;
if(p->dr!=NULL)
drum_maxim(p->dr,hdr,1);
else
hdr=0;
p->ech=hdr-hst;
}

NOD* s_rot_dreapta(NOD *p)
{
    NOD *q;
    q=p->st;
    p->st=q->dr;
    q->dr=p;
    echilibrare(p);
    echilibrare(q);
    p=q;
    return p;
}

NOD* s_rot_stanga(NOD *p)
{
    NOD *q;
    q=p->dr;
    p->dr=q->st;
    q->st=p;
    echilibrare(p);
    echilibrare(q);
    p=q;
    return p;
}




int main()
{
    NOD *p,*r=NULL;
    int c;
    printf("Introd in preordine\n");
    con_cautare(&r);
    inordine(r,0);

    return 0;
}

