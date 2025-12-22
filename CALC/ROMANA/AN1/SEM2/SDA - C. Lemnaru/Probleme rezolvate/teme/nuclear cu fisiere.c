#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <string.h>
typedef struct tip_bilet
{
    int nrbilet;
    char clasa[30];
    int valoare;
    char sursa[30];
    char destinatie[30];
    struct tip_bilet *stg,*dr;
} TIP_BILET;
TIP_BILET *rad;
int n;
TIP_BILET *inserare (TIP_BILET *rad,int nr,char *cl, int val, char *sursa, char *dest)
{
    TIP_BILET *p;
    if (rad==0)
    {
        p=(TIP_BILET*)malloc(sizeof(TIP_BILET));
        p->nrbilet=nr;
        strcpy(p->clasa,cl);
        p->valoare=val;
        strcpy(p->sursa,sursa);
        strcpy(p->destinatie,dest);
        p->stg=0;
        p->dr=0;
        return p;
    }
    else
    {
        if(nr < rad->nrbilet&&(strcmp(p->clasa,cl)>0) &&p->valoare<val&&(strcmp(p->sursa,sursa)>0)&&strcmp(p->destinatie,dest)>0)
            rad->stg=inserare(rad->stg,nr,cl,val,sursa,dest);
        else
        {
            if(nr > rad->nrbilet) rad->dr=inserare(rad->dr,nr,cl, val, sursa, dest);
            else
            {
                if(nr > rad->nrbilet &&(strcmp(p->clasa,cl)<0) && p->valoare>val && (strcmp(p->sursa,sursa)<0)&& (strcmp(p->destinatie,dest)<0))
                    rad->stg=inserare(rad->stg,nr,cl,val,sursa,dest);
            }
        }
    }
    return rad;
}
TIP_BILET *cautare(TIP_BILET *rad,int nr)
{
    TIP_BILET *p;
    if(rad==0) return 0;
    p=rad;
    while(p != 0)
    {
        if(p->nrbilet=nr) return p;
        else if(nr<p->nrbilet) p=p->stg;
        else p=p->dr;
    }
    return 0;
}

int main()
{
    FILE*f;
    f=fopen("bilet","r");

    TIP_BILET *b;
    char ch,dest[20], sursa[20], cl[20];
    int key,i,nr,n, q, val;



    printf("\n\n1.CREARE ARBORE\n");
    printf("2.CAUTARE DUPA CHEIA\n");
    printf("3.IESIRE\n\n\n");
while (!feof(f))    {
        fscanf(f,"%d",&nr);
        fscanf(f,"%s",cl);
        fscanf(f,"%d",&val);
        fscanf(f,"%s",sursa);
        fscanf(f,"%s",dest);
    }
    fclose(f);

    while(ch!='3')
    {
        scanf("%c",&ch);
        switch(ch)
        {
        case '1':
            rad=0;
            i=1;
            for(i=1; i<=n; i++)
            {
                rad=inserare(rad,nr, cl, val, sursa, dest);
            }
            break;
        case '2':
            printf("Numarul biletului cautat este:");
            scanf("%d",&q);
            b=cautare(rad,q);
            if(b!=0)printf("Biletul exista si are datele %s %d %s %s", b->clasa, b->valoare, b->sursa, b->destinatie);
            else printf("Nu exista niciun bilet cu acel numar\n");
            break;
        case '3':
            return 0;
        }
    }
    return 0;

}

