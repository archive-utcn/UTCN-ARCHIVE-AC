#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

#define NRMAX_NODURI 20
#define NRMAX_MUCHII 100

typedef struct {
   int u,v; //nodurile muchiei
   float cost; //costul muchiei
} MUCHIE;

void citeste(int *nr_noduri, int *nr_muchii, MUCHIE *m)
{
    //citeste elementele grafului
    int i,j;
    float c;
    printf("Introduceti numarul nodurilor: ");
    scanf("%d", nr_noduri);
    printf("Introduceti muchiile cu urmatoarele reguli:\n");
    printf("Muchia este (i,j), unde j>i; cand nu mai sunt muchii care pleaca dintr-un nod, j=0\n");
    *nr_muchii=0;
    for(i=1; i<*nr_noduri;i++)
    {
        do {
            printf("Muchia pleaca din nodul i=%d in nodul j=",i);
            scanf("%d", &j);
            if (j>0){
                (*nr_muchii)++;
                m[*nr_muchii].u=i; m[*nr_muchii].v=j;
                printf("Costul muchiei: ");
                scanf("%f", &c);
                m[*nr_muchii].cost=c;
            };
        } while (j>0);
    }
}

void scrie (int nr_noduri, int nr_muchii, MUCHIE *m)
{
    int i;
    //afiseaza datele grafului
    printf("\nNR.NODURI=%d", nr_noduri);
    printf("\nNR.MUCHII=%d", nr_muchii);
    printf("\nMUCHIA COST\n");
    for(i=1; i<=nr_muchii; i++)
     printf("(%d, %d)  %f\n", m[i].u, m[i].v, m[i].cost);

}

void ordonare (int nr_muchii, MUCHIE *m)
{
    //ordoneaza muchiile in sens crescator dupa cost prin metoda bulelor
    int i,j,sem;
    MUCHIE x;
    j=-1;
    do {
        sem=1;
        j++;
        for (i=1;i<nr_muchii;i++)
            if (m[i].cost>m[i+1].cost)
        {
            x=m[i]; m[i]=m[i+1]; m[i+1]=x;
            sem=0;
        };
    } while (sem==0);
}

int gasire_cap_componenta(int *tata, int i)
{
    //gaseste capul componentei din care face parte nodul i
    while (tata[i]>0) i=tata[i];
    return i;
}

void unire_componente(int a, int b, int *tata)
{
    //uneste componentele cu capul a si respectiv b
    int k;
    k=tata[a]+tata[b]; /*|k| este nr total de noduri ale celor 2 componente*/
    if (tata[a]>tata[b]) /* tata[a] contine nr de noduri ale componentei cu capul a in val negativa; la fel tata[b]*/
    {
        tata[a]=b;
        tata[b]=k;
    }
    else
    {
        tata[b]=a; /*componenta b este inserata in a*/
        tata[a]=k;
    };

int kruskal(int nr_noduri, int nr_muchii, MUCHIE *m, int *selectate, int *tata)
{
    // selecteaza muchiile care fac parte din arborele de acoperire minim
    int i,j,c1,c2;
    i=0; j=0;
    while ((i<nr_noduri-1) && (j<nr_muchii)){
        j++;
        c1=gasire_cap_componenta(tata,m[j].u);
        c2=gasire_cap_componenta(tata, m[j].v);
        if (c1 != c2)
        {
            i++;
            selectate[j]=1; //muchia este adaugata la arbore
            unire_componente(c1,c2,tata);
        };
    }
if (i==nr_noduri-1) return 1; //succes
else return 0; //insucces-exista mai multe componente
}

void main(void)
{
    int nr_noduri,nr_muchii,i;
    int tata[NRMAX_NODURI];
    int selectate[NRMAX_MUCHII];
    float cost_total;
    MUCHIE m[100];
    citeste(&nr_noduri, &nr_muchii,m);
    scrie(nr_noduri, nr_muchii,m);
    ordonare(nr_muchii,m);
    printf("DUPA ORDONARE\n");
    scrie (nr_noduri, nr_muchii,m);
    getch();
    //initializare tata
    for (i=1;i<=nr_noduri;i++)
        tata[i]=-1;
    //initializare selectate
    for (i=1; i<=nr_muchii; i++)
        selectate[i]=0;
    i=kruskal(nr_noduri,nr_muchii,m,selectate,tata);
    if (i==0) printf("\nNU S-A PUTUT CONSTRUI ARBORELE DE ACOPERIRE DE COST MINIM!!\n");
    else
    {
        cost_total=0;
        printf("\nARBORELE DE ACOPERIRE DE COST MINIM ARE MUCHIILE:\n");
        printf("MUCHIA COST\n");
        for (i=1; i<=nr_muchii;i++)
        {
            if (selectate[i]==1)
            {
                printf(" (%d, %d) %f\n", m[i].u,m[i].v, m[i].cost);
                cost_total+=m[i].cost;
            };
        };
        printf("COSTUL TOTAL AL ARBORELUI: %f\n", cost_total);
    }
    getch();
}
}

