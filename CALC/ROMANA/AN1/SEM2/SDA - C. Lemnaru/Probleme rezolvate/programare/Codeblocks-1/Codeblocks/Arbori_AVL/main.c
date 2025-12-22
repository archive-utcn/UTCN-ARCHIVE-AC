#include <stdio.h>
#include <stdlib.h>

typedef struct tip_nod {
    int ch;
    struct tip_nod *st,*dr;
}NOD;

NOD* constructie()
{
        NOD*p;
        int c;
        fflush(stdin);
        scanf("%d",&c);
        if (c=='0') return 0;
        else{
            p= (NOD*) malloc (sizeof (NOD));
            p->ch=c;
            p->st=constructie();
            p->dr=constructie();
        }
        return p;
}

void inordine (NOD *r, int nivel)
{
    int i;
    if (r!=0)
    {
        inordine(r->st,nivel+1);
        for (i=0;i<=nivel;i++) printf("   ");
        printf("%d\n",r->ch);
        inordine(r->dr,nivel+1);
    }
}

// arbore binar tot echilib, RSD
NOD* echilib (int nr_noduri)
{
    int n_st,n_dr;
    NOD* p;
    int c;
    if (nr_noduri==0) return 0;
    else
    {
        n_st=nr_noduri/2;
        n_dr=nr_noduri-n_st-1;
        p= (NOD*) malloc (sizeof(NOD));
        printf("\n Nodul:  ");
        fflush(stdin);
        scanf("%d",&c);
        p->ch=c;
        p->st=echilib(n_st);
        p->dr=echilib(n_dr);

    }return p;
}


void con_cautare (NOD **r)
{
        int i,n, inserat=0;
        NOD *p,*q;
        printf("nr de noduri");
        scanf("%d",&n);
        for (i=0;i<n;i++)
        {
            printf("\nnodul: ");
            fflush(stdin);
            q=(NOD*) malloc (sizeof(NOD));
            scanf("%d",&(q->ch));
            q->st=0;
            q->dr=0;
            inserat=0;

            if (*r==0)
            {
                    *r=q;
                    inserat=1;
            }
            p=*r;
            while (inserat==0)
            {
                    if (q->ch<p->ch)
                    {
                            if (p->st==0)
                                {   p->st=q;
                                    inserat=1;
                                }
                            else p=p->st;
                    }
                    else if (q->ch>p->ch)
                            {
                            if (p->dr==0)
                                {   p->dr=q;
                                    inserat=1;
                                }
                            else p=p->dr;
                            }
                          else
                          {
                            free(q);
                            printf("\ncheie dubla");
                            inserat=1;
                          }
            }

        }
return;
}

NOD *cautare(NOD*r, int key)
{
    NOD*p;
    p=r;
    if (r==0) return 0;
    int gasit=0;
    while (gasit==0 && p!=0)
    {
        if (key<p->ch)
        {
            p=p->st;
        }else if (key>p->ch)
            {
                p=p->dr;
            }
         else gasit=1;
    }
    return p;
}


int main()
{
    NOD *p,*r=NULL;
    int c;
    printf("Introd in preordine\n");
    //r=constructie();
    //inordine(r,0);
    //r=echilib(9);
    con_cautare(&r);
    inordine(r,0);

    return 0;
}
