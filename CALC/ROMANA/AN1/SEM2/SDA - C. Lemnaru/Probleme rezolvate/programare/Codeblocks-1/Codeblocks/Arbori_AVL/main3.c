#include <stdio.h>
#include <stdlib.h>
#include "function.h"

NOD* echilibrare(NOD *p)
{
NOD *w;
fact_ech(p);//se calculeaza factorul de echilibru a NODului curent p
if(p->ech==-2){// daca p NOD este critic
w=p->st; // atunci w este copilul st al lui p
if (w->ech==1)// si daca acesta are factorul de echilibru 1
p = d_rot_dr(p);// atunci se face dubla rotatie dr
else//altfel se face o simpla rotatie dr
p = s_rot_dr(p);
}
else
if(p->ech==2){//daca p NOD este critic
w=p->dr;//w este copilul dr al NODului curent p
if (w->ech==-1)// si acesta are factorul de ech -1
p = d_rot_st(p);//se face o dubla rotatie st
else//altfel se face o simpla rotatie st
p = s_rot_st(p);
}
return p;
}

NOD* s_rot_dr(NOD *p)
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

NOD* s_rot_st(NOD *p)
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


NOD* d_rot_st(NOD *p)
{
    p->dr=s_rot_dr(p->dr);
    p=s_rot_st(p);
    return p;
}

NOD* d_rot_dr(NOD *p)
{
    p->st=s_rot_st(p->st);
    p=s_rot_dr(p);
    return p;
}



NOD* insereaza(NOD *p,int x)
{
if (p==NULL){ // daca NODul curent este NULL atunci
p=(NOD *)malloc(sizeof(NOD)); //se aloca spatiu pentru el in zona heap
p->key=x; //informatia devine x
p->ech=0;
p->dr=NULL;// NODul se insereaza ca NOD frunza
p->st=NULL; //deci referintele catre copii sai sunt NULL
return p;
}
else {
if (x<p->key) //daca cheia care se doreste inserata este
//mai mica ca valoare decat informatia din NODul curent
p->st = insereaza(p->st,x);// atunci se insereaza
//in subarborele stang al NODului curent
else
if (x>p->key) //altfel daca cheia care se va insera
//e mai mare decat informatia din NODul curent
p ->dr = insereaza(p->dr,x); // atunci se va insera
//in subarborele drept
else
printf("NODul exista deja");
}
p = echilibrare(p);// daca intervin cazuri de dezechilibru
//se va echilibra subarborele sau chiar arborele
}

void drum_maxim(NOD* p,int *max,int lung)
{
if (p!=NULL){
drum_maxim(p->dr,&max,lung+1);
if ((p->st==NULL)&&(p->dr==NULL)&&(*max<lung))
*max=lung;
drum_maxim(p->st,&max,lung+1);
}
}

void fact_ech(NOD *p)
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



int main()
{
    NOD *p;
    int n,i,x;
    printf("Nr. noduri:");
    scanf("%d",&n);
    for(i=0;i<n;i++)
    {
    scanf("%d",&x);
    p=insereaza(p,x);
    }
    return 0;
}
