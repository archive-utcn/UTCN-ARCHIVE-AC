#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define M 127
typedef struct tnod
{
    char nume[15];
    char prenume[15];
    float np1;
    float np2;
    float medie;
    char optiune[15];
    struct tnod *urm;
} TNOD;

TNOD *thash[M];
int nr[M];

unsigned hf(char *s)
{
    unsigned h;
    for(h=0;*s;)
        h+=*s++;
    return h%M;
}

TNOD *hcaut(char *s1,char *s2,unsigned h)
{
    TNOD *p;
    for(p=thash[h];p;p=p->urm)
        if(strcmp(s1,p->nume)==0 && strcmp(s2,p->prenume)==0)
            return p;
    return 0;
}

void elibnod(TNOD *p)
{
    free(p);
}

void adaugare(char a[],char b[],float c,float d,char e[])
{
    TNOD *p,*q;
    unsigned h;
    p=(TNOD *)malloc(sizeof(TNOD));
    strcpy(p->nume,a);
    strcpy(p->prenume,b);
    p->np1=c;
    p->np2=d;
    p->medie=(p->np1+p->np2)/2;
    strcpy(p->optiune,e);
    h=hf(p->optiune);
    if(thash[h])
        if((q=hcaut(p->nume,p->prenume,h))!=0)
            elibnod(p);
        else
        {
            p->urm=thash[h];
            thash[h]=p;
        }
    else
    {
        thash[h]=p;
        p->urm=0;
    }
}

void ordonare(TNOD *p)
{
    TNOD *q,*r;
    char aux[15];
    float a;
    for(q=p;q->urm;q=q->urm)
        for(r=q->urm;r;r=r->urm)
            if((q->medie<r->medie) || ((q->medie==r->medie) && (q->np1<r->np1)) || ((q->medie==r->medie) && (q->np1==r->np1) && (q->np2<r->np2)))
               {
                   strcpy(aux,q->nume);
                   strcpy(q->nume,r->nume);
                   strcpy(r->nume,aux);

                   strcpy(aux,q->prenume);
                   strcpy(q->prenume,r->prenume);
                   strcpy(r->prenume,aux);

                   a=q->np1;
                   q->np1=r->np1;
                   r->np1=a;

                   a=q->np2;
                   q->np2=r->np2;
                   r->np2=a;

                   a=q->medie;
                   q->medie=r->medie;
                   r->medie=a;
               }
}

void afisare(TNOD *p,int n)
{
    FILE *f,*g;
    TNOD *q;
    f=fopen("admisi.txt","a");
    g=fopen("respinsi.txt","a");
    int contor=0;
    fprintf(f,"Candidatii cu optiunea %s sunt:\n",p->optiune);
    fprintf(g,"Candidatii cu optiunea %s sunt:\n",p->optiune);
    for(q=p;q;q=q->urm)
    {
        if(contor<nr[n])
            fprintf(f,"%s %s %0.2f %0.2f %0.2f\n",q->nume,q->prenume,q->np1,q->np2,q->medie);
        else
            fprintf(g,"%s %s %0.2f %0.2f %0.2f\n",q->nume,q->prenume,q->np1,q->np2,q->medie);
        contor++;
    }
    fprintf(f,"\n");
    fprintf(g,"\n");
    fclose(f);
    fclose(g);
}

int main()
{
    int i;
    TNOD *p;
    FILE *f,*g,*h;
    char a[15],b[15],c[15];
    float x,y;
    for(i=0;i<M;i++)
        thash[i]=0;
    f=fopen("candidati.txt","r");
    g=fopen("admisi.txt","w");
    h=fopen("respinsi.txt","w");
    while(!feof(f))
    {
        fscanf(f,"%s %s %f %f %s",a,b,&x,&y,c);
        adaugare(a,b,x,y,c);
    }

    for(i=0;i<M;i++)
        if(thash[i]!=0)
        {
            p=thash[i];
            ordonare(p);
            p=p->urm;
        }
    for(i=0;i<M;i++)
        if(thash[i]!=0)
        {
            p=thash[i];
            printf("Nr de locuri pt optiunea %s: ",p->optiune);
            scanf("%d",&nr[i]);
            printf("\n");
            p=p->urm;
        }
    for(i=0;i<M;i++)
        if(thash[i]!=0)
        {
            p=thash[i];
            afisare(p,i);
            p=p->urm;
        }
    fclose(f);
    fclose(g);
    fclose(h);
    return 0;
}
