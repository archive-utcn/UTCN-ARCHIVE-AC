/*17. Sa se scrie o functie care sa verifice daca exista o cale între doua noduri date (v, w) ale unui graf orientat
G =(V, E).*/
#include <stdio.h>
#include <stdlib.h>

typedef struct n{
    int key;
    struct n *urm;
}nod;

nod *prim,*ultim;
int n;
int a[20][20];

void adaugareNod(int s)
{
    ///adaugare la sfarsitul cozii
    nod *p;
    p=(nod*)malloc(sizeof(nod));
    p->key=s;
    if(!prim)
    {
        prim=p;
        prim->urm=0;
        ultim=prim;
    }
    else
    {
        p->urm=0;
        ultim->urm=p;
        ultim=p;
    }
}

int extragereNod()
{
    int x;
    nod *p,*q;
    if(!prim)
    return 0;
    p=prim;
    while(p)
    {
        if(p->urm==ultim)
        {
            q=p->urm;
            p->urm=0;
            ultim=p;
            x=q->key;
            free(q);
            return x;
        }
        else
        if(prim==ultim)
        {
            q=prim;
            x=q->key;
            free(q);
            prim=ultim=0;
            return x;

        }
        p=p->urm;
    }
    return 0;
}

void explorareLargime(int s,int vizitate[])
{
    int i,v,w;
    int conex=1;
    prim=ultim=0;
    for(i=1;i<=n;i++)
        vizitate[i]=0;
    vizitate[s]=1;///vizitare nod s
    printf(" %d\n",s);
    adaugareNod(s);
    while(prim)
    {
        v=extragereNod();
        for(w=1;w<=n;w++)
        if(a[v][w]&&!vizitate[w])
        {
            vizitate[w]=1;
            printf(" %d\n",w);
            adaugareNod(w);
        }
    }
    for(i=1;i<=n;i++)
    if(!vizitate[i])
    conex=0;
    if(!conex)
    printf("\nGraful nu este conex!");

}

void citireGraf()
{
    int i, j;
    FILE *f;
    f=fopen("graf.txt","r");
    fscanf(f,"%d",&n);
    for (i=1;i<=n;i++)
     {
            for (j=1;j<=n;j++)
        {
            fscanf(f,"%d",&(a[i][j]));
            printf("%d ",a[i][j]);
        }
        printf("\n");
     }
}

int main()
{
    int vizitate[30];
    int x,y;
    citireGraf();
    printf("\nParcurgere in largime:\n");
    explorareLargime(1,vizitate);
    printf("\nIntroduceti 2 noduri pt a testa daca exista drum intre ele: ");
    printf("x=");
    fflush(stdin);
    scanf("%d",&x);
    printf("y=");
    fflush(stdin);
    scanf("%d",&y);
    explorareLargime(x,vizitate);
    if(vizitate[y])
    printf("\nExista drum!");
    else
    printf("\nNu exista.....");
    return 0;
}
