#include <stdio.h>
#include <stdlib.h>
#include <math.h>

typedef struct no{
    int nr;
    int dist[30];
    int nr_dist;
    struct no *urm,*prec;
}nod;///punctele ce trebuiesc determinate

nod *prim, *ultim;

int distante[100];///distantele
int max;///valoarea maxima a distantelor
int m;///nr de distante
float n;///nr de puncte, implicit nr de noduri
int exista;///verifica existenta unui set de puncte
int invers[100];///pt afisarea solutiei simetrice

void citire_date()
{
    int i;
    do{
    ///citeste nr de distante m
    printf("\nNr de distante: ");
    fflush(stdin);
    scanf("%d",&m);
    ///determinarea nr de puncte n si verificare corectitudinii acestuia
    n=(1+sqrt(1+8*m))/2;
    if(n!=floor(n)) printf("\nNr distante incorect!!! Reintroduceti: ");
    }while(n!=floor(n));

    for(i=1;i<=m;i++)
    {
        ///citirea distantelor
        printf("D[%d]: ",i);
        fflush(stdin);
        scanf("%d",&distante[i]);
    }


}

void adauga(nod *p)
{
    ///adauga un nr in coada
    ultim->urm=p;
    p->prec=ultim;
    p->urm=0;
    ultim=p;
}

int elimina()
{
    ///scoate un nod din lista si returneaza valoarea nr din nod
    nod *p;
    int i,j;
    p=ultim;
    ultim=ultim->prec;
    if(ultim==0) prim=0;
    else ultim->urm=0;
    ///refacere distante
    for(i=0;i<p->nr_dist;i++)
    for(j=1;j<=m;j++)
    if(distante[j]==0)
    {
        distante[j]=p->dist[i];
        break;
    }
    j=p->nr;
    free(p);
    return j;

}

void afisare_solutie()
{
    nod *p;
    int i=0,j,k;
    p=prim;
    printf("\nSolutie: \n");
    ///parcurgerea listei pt afisarea numerelor
    while(p)
    {
        for(k=0;k<=p->dist[0];k++)
        printf("  ");
        printf("%2d",p->nr);
        invers[i]=max-p->nr;
        p=p->urm;
        i++;
    }
    printf("\n");
    ///afisarea solutiei simetrice
    printf("\nSolutie inversa:\n  ");
    for(j=i-1;j>=0;j--)
    {
        printf("%2d",invers[j]);
        for(k=0;k<=invers[j-1]-invers[j];k++)
        printf("   ");

    }

}

int valid(nod *p)
{
    ///verifica validitatea nr ce urmeaza sa fie adaugat
    nod *q;
    q=prim;
    while(q)
    {
        if(q->nr>=p->nr)  return 0;
        q=q->urm;
    }
    return 1;
}

void back_recursiv(int x)
{
    ///x este nr ce urmeaza sa fie verificat pt adaugare in lista
    nod *p;
    int aux[10],i=0,j,cond=0,k;
    p=prim;
    if(x<=max)
    {
    while(p)
    {
        aux[i]=x-p->nr;
        cond=0;
        for(j=1;j<=m;j++)
        if(distante[j]==aux[i])
        {
            cond=1;
            break;
        }
        if(cond) distante[j]=0;
        else{
            if(i)
            {
                ///refacere distante
                for(k=0;k<i;k++)
                for(j=1;j<=m;j++)
                if(distante[j]==0)
                {
                    distante[j]=aux[k];
                    break;
                }
               if(x<=max){
               back_recursiv(x+1);
               return;
               }
                else{
                    x=elimina();
                    back_recursiv(x+1);
                return;
                }

            }
            else{
                 back_recursiv(x+1);
                return;
            }
        }
        i++;
        p=p->urm;
    }

    p=(nod *)malloc(sizeof(nod));
    for(j=0;j<i;j++)
    p->dist[j]=aux[j];
    p->nr=x;
    p->nr_dist=i;
    if (valid(p))
    adauga(p);
    else{
        adauga(p);
        elimina();
        back_recursiv(x+1);
        return;
    }
    if(x<max){
         back_recursiv(x+1);
         return;
    }
    else if(p->nr_dist+1==n){
         afisare_solutie();
         exista=1;
         return;
    }
    else {
        x=elimina();
        back_recursiv(x+1);
        return;
    }

    }
    else if(x>distante[m])
    {
        x=elimina();
        if(x)
        back_recursiv(x+1);
        else{
             printf("\nNUUUU");
             return;
        }
    }
}

int main()
{

    ///initializarea primului punct x=0
    prim=(nod *)malloc(sizeof(nod));
    prim->nr=0;
    prim->dist[0]=0;
    prim->urm=0;
    prim->prec=0;
    ///initial, avem doar punctul 0, deci primul nod e si ultimul
    ultim=prim;
    citire_date();
    max=distante[m];
    back_recursiv(1);
    if(!exista)
    printf("\nDistantele introduse nu determina un set de puncte!!!\n");
    return 0;
}
