/*Pe un pod se afla n capre care vin dintr-un sens, cu n capre care vin din sens opus. Acestea nu se pot
ocoli, însa fiecare capra poate sari peste o singura capra din grupul opus si desigur poate avansa daca în
fata sa este un spatiu liber. Cum reusesc aceste capre sa traverseze podul doar prin cele doua miscari
posibile (avans si saritura).*/

#include <stdio.h>
#include <stdlib.h>
#define max_fii 5

typedef struct nod_arbore{
    int v[100];
    int ok;
    int nr_fii;
    int cost;
    struct nod_arbore *tata;
    struct nod_arbore *adr_fii[max_fii];
}NOD_ARBORE;

typedef struct nod_coada{
    NOD_ARBORE *adr;
    struct nod_coada *urm;
}NOD_COADA;

NOD_ARBORE *rad;
NOD_COADA *prim,*ultim;
int vv[100],n;

void citire ()
{
    printf ("Introduceti numarul de capre,n :\n");
    scanf ("%d",&n);
    int i;
    for (i=1;i<=n;i++)
    {
        vv[i]=1;
        vv[2*n+2-i]=2;
    }
    vv[n+1]=0;
}

//functii prelucrare coada

int adaug (NOD_ARBORE *p)
{
    NOD_COADA *qq;
    qq=(NOD_COADA *)malloc(sizeof(NOD_COADA));
    if (qq==NULL)
    {
        printf ("Eroare la alocarea memoriei pentru un nod al cozii!\n");
        return 0;
    }
    qq->adr=p;
    qq->urm=0;
    if (prim==0)
    {
        prim=qq;
        ultim=qq;
    }
    else
    {
        ultim->urm=qq;
        ultim=qq;
    }
    return 1;
}

NOD_ARBORE * elimin ()
{
    NOD_COADA *p;
    NOD_ARBORE *q;
    if (prim==0)
        return 0;
    p=prim;
    prim=prim->urm;
    if (prim==0)
        ultim=0;
    q=p->adr;
    free (p);
    return q;
}

int costt (int a[100])  //numarul de mutari pana la solutie
{
    int i,c=0,c1=0,c2=0;
    for (i=1;i<=2*n+1;i++)
        if (a[i]==1)
        {
            c1++;
            c+=n+c1+1-i;
        }
        else if (a[i]==2)
             {
                c2++;
                c+=i-c2;
             }
    return c;
}

int solutie (int a[100])
{
    int i,da_1=1,da_2=1;  //presupunem ca avem solutie
    for (i=1;i<=n;i++)
        if (a[i]!=2)
            da_2=0;
    if (da_2==1)
        if (a[n+1]==0)
        {
            for (i=n+2;i<=2*n+1;i++)
                if (a[i]!=1)
                    da_1=0;
            if (da_1==1)
                return 1;
        }
    return 0;
}

void afis_solutie (NOD_ARBORE *p)  //afisarea solutiei
{
    int i,j;
    NOD_ARBORE *q,*r;
    if ((q=(NOD_ARBORE *)malloc(sizeof(NOD_ARBORE)))==NULL)
    {
        printf ("Eroare la alocarea memoriei la afisarea solutiei!\n");
        exit (10);
    }
    if ((r=(NOD_ARBORE *)malloc(sizeof(NOD_ARBORE)))==NULL)
    {
        printf ("Eroare la alocarea memoriei la afisarea solutiei!\n");
        exit (10);
    }
    q->nr_fii=0;
    while (p)
    {
        q->nr_fii++;
        q->adr_fii[q->nr_fii]=p;
        p=p->tata;
    }
    r=q;
    for (i=q->nr_fii;i>=1;i--)
    {
        for (j=1;j<=2*n+1;j++)
            switch (q->adr_fii[i]->v[j])
            {
                case 0: printf ("- ");
                        break;
                case 1: printf ("> ");
                        break;
                case 2: printf ("< ");
                        break;
            }
        printf ("     ");

        for (j=2*n+1;j>=1;j--)
            switch (q->adr_fii[i]->v[j])
            {
                case 0: printf ("- ");
                        break;
                case 1: printf ("< ");
                        break;
                case 2: printf ("> ");
                        break;
            }

        printf ("\n");
    }
    free (q);
}

void Branch_and_Bound ()
{
    int i,gasit;
    NOD_ARBORE *p,*t;
    if ((rad=(NOD_ARBORE *)malloc(sizeof(NOD_ARBORE)))==NULL)
    {
        printf ("Eroare la alocarea memoriei pentru radacina!\n");
        exit (1);
    }
    if ((p=(NOD_ARBORE *)malloc(sizeof(NOD_ARBORE)))==NULL)
    {
        printf ("Eroare la alocarea memoriei pentru un nod din arbore!\n");
        exit (2);
    }
    for (i=1;i<=2*n+1;i++)
    {
        rad->v[i]=vv[i];
    }
    printf ("\n");
    rad->ok=1;
    rad->tata=0;
    rad->cost=costt(rad->v);
    p=rad;

    int avem_solutie=0,arbore_plin=0;
    int k;
    while (avem_solutie==0 && arbore_plin==0)
    {
        //cautam zeroul din vectorul nodului p
        gasit=0;
        for (i=1;i<=2*n+1&&gasit==0;i++)
            if (p->v[i]==0)
                gasit=1;
        i--;

        //cautam fiii nodului p
        //verificam cele 4 mutari posibile
        p->nr_fii=0;
        if (i-2>=1 && p->ok==1)
            if (p->v[i-2]==1)
            {
                p->nr_fii++;
                if ((t=(NOD_ARBORE *)malloc(sizeof(NOD_ARBORE)))==NULL)
                {
                    printf ("Eroare la alocarea memoriei pentru un fiu!\n");
                    exit (3);
                }
                for (k=1;k<=2*n+1;k++)
                    t->v[k]=p->v[k];
                t->v[i-2]=0;
                t->v[i]=1;
                t->cost=costt(t->v);
                t->ok=1;
                t->tata=p;
                t->nr_fii=0;
                p->adr_fii[p->nr_fii]=t;
            }
        if (i-1>=1 && p->ok==1)
            if (p->v[i-1]==1)
            {
                p->nr_fii++;
                if ((t=(NOD_ARBORE *)malloc(sizeof(NOD_ARBORE)))==NULL)
                {
                    printf ("Eroare la alocarea memoriei pentru un fiu!\n");
                    exit (3);
                }
                for (k=1;k<=2*n+1;k++)
                    t->v[k]=p->v[k];
                t->v[i-1]=0;
                t->v[i]=1;
                t->cost=costt(t->v);
                t->ok=1;
                t->tata=p;
                t->nr_fii=0;
                p->adr_fii[p->nr_fii]=t;
            }
        if (i+1<=2*n+1 && p->ok==1)
            if (p->v[i+1]==2)
            {
                p->nr_fii++;
                if ((t=(NOD_ARBORE *)malloc(sizeof(NOD_ARBORE)))==NULL)
                {
                    printf ("Eroare la alocarea memoriei pentru un fiu!\n");
                    exit (3);
                }
                for (k=1;k<=2*n+1;k++)
                    t->v[k]=p->v[k];
                t->v[i+1]=0;
                t->v[i]=2;
                t->cost=costt(t->v);
                t->ok=1;
                t->tata=p;
                t->nr_fii=0;
                p->adr_fii[p->nr_fii]=t;
            }
        if (i+2<=2*n+1 && p->ok==1)
            if (p->v[i+2]==2)
            {
                p->nr_fii++;
                if ((t=(NOD_ARBORE *)malloc(sizeof(NOD_ARBORE)))==NULL)
                {
                    printf ("Eroare la alocarea memoriei pentru un fiu!\n");
                    exit (3);
                }
                for (k=1;k<=2*n+1;k++)
                    t->v[k]=p->v[k];
                t->v[i+2]=0;
                t->v[i]=2;
                t->cost=costt(t->v);
                t->ok=1;
                t->tata=p;
                t->nr_fii=0;
                p->adr_fii[p->nr_fii]=t;
            }
        if (p->nr_fii==0)
            p->ok=0;

        //cautam in arbore nodul ok cu costul minim
        free (p);

        if ((p=(NOD_ARBORE *)malloc(sizeof(NOD_ARBORE)))==NULL)
        {
            printf ("Eroare la alocarea memoriei pentru un fiu!\n");
            exit (5);
        }
        p->cost=30000;
        prim=0;
        ultim=0;
        if ((adaug(rad))==0)
            return;
        do{
            t=elimin ();
            if (t!=0)
            {
                if (t->ok==1)
                    if (p->cost>t->cost)
                        p=t;
                for (k=1;k<=t->nr_fii;k++)
                    if (adaug(t->adr_fii[k])==0)
                        return;
            }
        }while (t!=0);

        if (p->nr_fii!=0)
            p->ok=0;

        if (p->cost==30000)  //daca nu am gasit nod cu cost minim diferit de radacina
            arbore_plin=1;
        if (solutie(p->v)==1)
            avem_solutie=1;
   }

    printf("Solutiile problemei sunt:\n\n");
    afis_solutie (p);
}

int main()
{
    citire ();
    Branch_and_Bound ();
    return 0;
}
