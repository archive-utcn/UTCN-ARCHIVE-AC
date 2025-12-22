#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include<string.h>
typedef struct nod
{
    int nrbilet;
    char clasa[30];
    int valoare;
    char sursa[30];
    char destinatie[30];
}NOD;
NOD a;
typedef struct tip_bilet
{
     NOD a;
    struct tip_bilet *stg,*dr;
} TIP_BILET;
TIP_BILET *rad;
int n;


TIP_BILET *inserare(TIP_BILET *rad,int nr)
{
    TIP_BILET *p;

    if (rad==0)
    {
        p=(TIP_BILET*)malloc(sizeof(TIP_BILET));
        p->a.nrbilet=nr;
        p->stg=0;
        p->dr=0;
        return p;
    }
    else
    {

        if(nr<rad->a.nrbilet)
            rad->stg=inserare(rad->stg,nr);
        else if(nr>rad->a.nrbilet)
         rad->dr=inserare(rad->dr,nr);
        else printf ("nod multiplu");

    return rad;
}
}
TIP_BILET *cautare(TIP_BILET *rad,int nr)
{
    TIP_BILET *p;
    if(rad==0) return 0;
    p=rad;
    while(p!=0)
    {
        if(p->a.nrbilet==nr) return p;
        else if(nr< p->a.nrbilet) p=p->stg;
        else  p=p->dr;
    }
    return 0;
}


int main()
{

    TIP_BILET *b;
    NOD x;
    char ch;
    int key,i,n,q;

    printf("dati nr de noduri ");
    scanf("%d",&n);
    printf("\n\n1.CREARE ARBORE\n");
    printf("2.CAUTARE DUPA CHEIA\n");
    printf("3.IESIRE\n\n\n");
    while(ch!='3')
    {
        scanf("%c",&ch);
        switch(ch)
        {
        case '1':
           {
            rad=0;
            i=1;
            for(i=1; i<=n; i++)
            {    printf("\n\ndati nrbilet, clasa, valoarea, sursa, destinatia\n");
        scanf("%d",&x.nrbilet);
        scanf("%s",x.clasa);
        scanf("%d",&x.valoare);
        scanf("%s",x.sursa);
        scanf("%s",x.destinatie);
                rad=inserare(rad,x.nrbilet);
            }}
            break;
        case '2':
           {
            printf("Numarul biletului cautat este:");
            scanf("%d",&q);

            b=cautare(rad,q);
            if(b!=0)printf("Biletul exista si are datele %s %d %s %s", b->a.clasa, b->a.valoare, b->a.sursa, b->a.destinatie);
            else printf("Nu exista niciun bilet cu acel numar\n");}
            break;


        case '3':
            return 0;
        }
    }
    return 0;

}

