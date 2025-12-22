#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define m 97
typedef struct nod
{
    int cheie;
    char inf[20];
    struct nod *urm;
}NOD;

NOD *ht[m];
// f calculeaza cheie % m
int f(int key)
{
    return key%m;
}

void initializare()
{
    int i;
    for(i=0;i<m;i++)
        ht[i]=NULL;
}

void creare(char c[20],int cheie)
{
    NOD *p,*prim;
    int h;
    p=(NOD *)malloc(sizeof(NOD));
    strcpy(p->inf,c);
    p->cheie=cheie;
    h=f(p->cheie);
    if(ht[h]==0)
    {
		 ht[h]=p;
		 p->urm=NULL;
	}
	else
	{
	    prim=ht[h];
	    while(prim!=NULL&&prim->cheie!=p->cheie)
            prim=prim->urm;
        if(prim==NULL)
        {
            p->urm=ht[h];
            ht[h]=p;
        }
        else strcat(prim->inf,p->inf);
	}
}

void af()
{
    int i;
    NOD *p;
    for(i=0;i<m;i++)
        if(ht[i]!=NULL)
        {
            p=ht[i];
            printf("cod de dispersie %d ",i);
            while(p!=NULL)
            {
                printf("inf:%s cheie:%d ",p->inf,p->cheie);
                p=p->urm;
            }
            printf("\n");
        }
}

int main()
{
    FILE *f;
    int n,i,cheie;
    char c[20];
    f=fopen("fis.txt","r");
    fscanf(f,"%d",&n);
    initializare();
    for(i=1;i<=n;i++)
    {
        fscanf(f,"%s",c);
        fscanf(f,"%d",&cheie);
        creare(c,cheie);
    }
    af();
    fclose(f);
    return 0;
}
