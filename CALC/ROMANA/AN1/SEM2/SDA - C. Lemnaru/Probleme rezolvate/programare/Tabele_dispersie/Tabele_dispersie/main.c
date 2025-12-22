#include<stdio.h>
#include<conio.h>
#include<malloc.h>
#include<string.h>

#define M 97

typedef struct nod
{
	char *c[50];
	struct nod *st,*dr;
}NOD;

void inserare(NOD **p,NOD *q)
{
	if ((*p)==0)
	{*p=q;}         /*daca arborele este NULL se initializeaza tabelul de dispersie*/
	else
	{
		if (strcmp(q->c,(*p)->c)>0)     /*se face comparatia si se insereaza recursiv la stanga si la dreapta in funtie de rezultatul comparatiei*/
		{inserare(&(*p)->dr,q);}
		else
		{inserare(&(*p)->st,q);}
	}
}

int f(char *ch)
{
	int i,suma=0;
	for (i=0;i<strlen(ch);i++)
	{
		suma=suma+ch[i]; /*suma coduri ASCII*/
	}
	return (suma%M);  /*returnam cod de dispersie*/
}

int cauta_arbore(NOD *q,char *suma)
{
	if (q!=0)
	{
		if (strcmp(suma,q->c)==0)    /*daca rezultatul comparatiei e 0 s-a gasit nodul*/
		{
			printf("Nodul de cheie data s-a gasit %s",q->c);
			return 1;
		}
		else if (strcmp(suma,q->c)>0)      /*daca rezultatul comparatiei e mai mare ca 0 se cauta in dreapta pentru nod de cheie data*/
		{return cauta_arbore(q->dr,suma);}
		else
		{return cauta_arbore(q->st,suma);} /*daca rezultatul e mai mic decat 0 se cauta in stanga*/
	}
}

int cautare(NOD *H[M],char *suma)
{
    int i;
	for (i=0;i<M;i++)
	{
		if (cauta_arbore(H[i],suma)==1)
		return 1;   /*cauta efectiv nodul in tabel de dispersie*/
	}
}

void inordine(NOD *p,int hh,int poz)  /*afisarea in inordine la fel ca si la arbori*/
{
	int i;
	if(p!=0)
	{

		if (hh==0) printf("Cod dispersie %d: ",poz);
		inordine(p->st,hh+1,poz);
		for(i=0;i<hh;i++)
		printf("");
		printf("%s\n",p->c);
		inordine(p->dr,hh+1,poz);
	}
}

void main()
{
	NOD *H[M],*p;
	FILE *fs;
	char *ch;
	int suma,i;
	for(i=0;i<M;i++)
	{
		H[i]=0;
	}
	fs=fopen("keywords.txt","r");
	while (fscanf(fs,"%s",ch)>0)   /*se insereaza atat timp cat mai sunt elemente in fisier*/
	{
		p=(NOD *)malloc(sizeof(NOD));
		strcpy(p->c,ch);
		p->st=0;
		p->dr=0;
		suma=f(ch);
		inserare(&H[suma],p);
	}
	fclose(fs);
	for(i=0;i<M;i++)
	{
		if (H[i]!=0)
		{
			inordine(H[i],0,i);
		}
	}
	printf("\nCautati nodul de cheie: ");
	scanf("%s",ch);
	if (cautare(H,ch)==0) printf("Nu s-a gasit nodul de cheie %s",ch);
	getch();
}
