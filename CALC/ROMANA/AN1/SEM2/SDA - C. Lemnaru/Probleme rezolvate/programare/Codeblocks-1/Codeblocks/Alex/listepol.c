#include <stdio.h>
#include <stdlib.h>
#include<string.h>
typedef struct nod
    {
        int co,pt;
        struct nod *urm;
    }NOD;

void citire(NOD **prim,NOD **ultim,char c[50])
{
    int nr=0,pt=0,i,j;
    NOD *p;
    j=0;
    while(c[j]>='0'&&c[j]<='9')
    {
        nr=nr*10+c[j]-'0';
        j++;
    }
    for(i=j;i<strlen(c);i++)
    {
       if(c[i]=='X'&&(c[i-1]=='+'||c[i]=='-'||i==0)) nr=1;
       if((c[i]=='X'&&c[i+1]!='^')||i==(strlen(c)-1)) pt=1;
       else if(c[i]=='+')
        {
            i++;
            while(c[i]>='0'&&c[i]<='9')
            {
                nr=nr*10+c[i]-'0';
                i++;
            }
            i--;
        }
       else if(c[i]=='-')
        {
            i++;
            while(c[i]>='0'&&c[i]<='9')
            {
                nr=nr*10+c[i]-'0';
                i++;
            }
            nr=-nr;
            i--;
        }
        else if(c[i]=='^')
        {
            i++;
            while(c[i]>='0'&&c[i]<='9')
            {
                pt=pt*10+c[i]-'0';
                i++;
            }
            i--;
        }
        if((nr!=0&&pt!=0)||(i==(strlen(c)-1)))
        {

            p=(NOD *)malloc(sizeof(NOD));
            p->co=nr;
            p->pt=pt;
            p->urm=NULL;
            if(*prim==NULL)
                *prim=*ultim=p;
            else
            {   (*ultim)->urm=p;
                *ultim=p;
            }
        nr=0;
        pt=0;
        }
    }
}

void scrie(int *ok,int i,int nr)
{
//ok=0 ii prima data cat scrie
    if(nr>0)
    {
        if(*ok==0&&i>1) printf("%dX^%d",nr,i);
        else if(*ok==0&&i==1) printf("%dX",nr);
        else if(*ok==0&&i==0) printf("%d",nr);
        else if(i==1) printf("+%dX",nr);
        else if(i==0) printf("+%d",nr);
        else printf("+%dX^%d",nr,i);
    }
    else if(nr<0)
    {
        if(i==1) printf("%dX",nr);
        else if(i==0) printf("%d",nr);
        else printf("%dX^%d",nr,i);
    }
    if(nr!=0)
    *ok=1;
}

void adunare(NOD *prim1,NOD *prim2)
{
    int max,i,nr,ok=0;
    NOD *p;
    if(prim1->pt>prim2->pt) max=prim1->pt;
        else max=prim2->pt;
    for(i=max;i>=0;i--)
    {
        nr=0;
        p=prim1;
        while(p!=NULL)
        {
            if(p->pt==i) nr=nr+p->co;
            p=p->urm;
        }
        p=prim2;
        while(p!=NULL)
        {
            if(p->pt==i) nr=nr+p->co;
            p=p->urm;
        }
        scrie(&ok,i,nr);

    }
}

void scadere(NOD *prim1,NOD *prim2)
{
    int max,i,nr,ok=0;
    NOD *p;
    if(prim1->pt>prim2->pt) max=prim1->pt;
        else max=prim2->pt;
    for(i=max;i>=0;i--)
    {
        nr=0;
        p=prim1;
        while(p!=NULL)
        {
            if(p->pt==i) nr=p->co;
            p=p->urm;
        }
        p=prim2;
        while(p!=NULL)
        {
            if(p->pt==i) nr=nr-p->co;
            p=p->urm;
        }
        scrie(&ok,i,nr);

    }
}

void inmultire(NOD *prim1,NOD *prim2)
{
    int max,i,nr,ok=0;
    NOD *p,*q;
    if(prim1->pt==0) max=prim2->pt;
    else if(prim2->pt==0) max=prim1->pt;
    else max=(prim1->pt)+(prim2->pt);
    for(i=max;i>=0;i--)
    {
        nr=0;
        p=prim1;
        while(p!=NULL)
        {
            q=prim2;
            while(q!=NULL)
            {
                if((p->pt+q->pt)==i) nr=nr+p->co*q->co;
                q=q->urm;
            }
            p=p->urm;
        }
    scrie(&ok,i,nr);
    }
}

int main()
{
    NOD *prim1,*ultim1,*prim2,*ultim2;
    char c[50];
    FILE *f;
    prim1=ultim1=prim2=ultim2=NULL;
    f=fopen("fis.txt","r");
    fscanf(f,"%s",c);
    citire(&prim1,&ultim1,c);
    fclose(f);
    f=fopen("fis1.txt","r");
    fscanf(f,"%s",c);
    citire(&prim2,&ultim2,c);
    fclose(f);
    adunare(prim1,prim2);
    printf("\n");
    scadere(prim1,prim2);
    printf("\n");
    inmultire(prim1,prim2);
    printf("\n");

    return 0;
}
