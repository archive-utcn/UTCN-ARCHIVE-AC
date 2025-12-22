#include<stdio.h>
#include<conio.h>
#include<malloc.h>
#include<string.h>

#define B 100

typedef struct _NOD
{
    char *valoare;
    struct _NOD *st,*dr;
}NOD;

int f(char *sir)
{
    int i,aux;
    aux=0;
    for (i=0;i<strlen(sir);i++)
    {
        aux=aux+sir[i];
    }
    return aux;
}

void afisare(NOD *p_nod,int nivel,int poz)
{
    int i;
    if(p_nod!=0)
    {
        afisare(p_nod->st,nivel+1,poz);
        if (nivel==0) printf("%d: ",poz);
        for(i=0;i<nivel;i++) printf("\t");
        printf("%s\n",p_nod->valoare);
        afisare(p_nod->dr,nivel+1,poz);
    }
}


void inserare(NOD **p_nod,NOD *nod)
{
    if ((*p_nod)==0)
    {
        *p_nod=nod;
    }else
    {
        if (strcmp(nod->valoare,(*p_nod)->valoare)>0)
        {
            inserare(&(*p_nod)->dr,nod);
        }
        else
        {
            inserare(&(*p_nod)->st,nod);
        }
    }
}
int cauta(NOD *nod,char *aux)
{
    int a;
    if (nod!=0)
    {
        a=strcmp(aux,nod->valoare);
        if (a==0)
        {
            printf("s-a gasit nodul de cheie %s",nod->valoare);
            return 1;
        }else if (a>0)
        {
        return cauta(nod->dr,aux);
        }else
        {
        return cauta(nod->st,aux);
        }
    }
    return 0;
}

int cautare(NOD *tabel[],char *aux)
{
    int i;
    for (i=0;i<B;i++)
    {
        if (cauta(tabel[i],aux)==1) return 1;
    }
    return 0;
}

void main()
{
    NOD *tabel[B],*nod;
    FILE *fisier;
    char *sir;
    int aux,i;
    for(i=0;i<B;i++)
    {
        tabel[i]=0;
    }
    fisier=fopen("keywords.txt","r");
    sir=(char *)malloc(256*sizeof(char));
    while (fscanf(fisier,"%s",sir)>0)
    {
        nod=(NOD *)malloc(sizeof(NOD));
        nod->valoare=(char *)malloc(256*sizeof(char));
        strcpy(nod->valoare,sir);
        nod->st=0;
        nod->dr=0;
        aux=f(sir)%B;
        inserare(&tabel[aux],nod);
    }
    fclose(fisier);
    for(i=0;i<B;i++)
    {
        if (tabel[i]!=0)
        {
            afisare(tabel[i],0,i);
        }
    }
    printf("\ncautati nodul de cheie\ncheie=");
    scanf("%s",sir);
    if (cautare(tabel,sir)==0) printf("nu s-a gasit nodul de cheie %s",sir);
    getch();
}
