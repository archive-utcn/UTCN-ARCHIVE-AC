/*Să se introducă tipul RAŢIONAL ca o structură formata din numărător şi numitor.
 Să se scrie funcţii de simplificare, adunare, scădere, înmulţire, împărţire, ridicare la putere.
*/
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

typedef struct rational
    {
        int numarator;
        int numitor;
    }rational;
void simplificare(struct rational *z)
{
    int auxa,auxb;
    auxa=z->numarator;
    auxb=z->numitor;
    while(auxa!=auxb)
    {
        if(auxa>auxb)
        auxa=auxa-auxb;
        else
        auxb=auxb-auxa;
    }
   z->numarator/=auxa;
    z->numitor/=auxa;
}
void adunare(rational *x,rational *y,rational *z)
{
   int auxa,auxb,p;
    auxa=x->numitor;
    auxb=y->numitor;
    while(auxa!=auxb)
    {
        if(auxa>auxb)
        auxa=auxa-auxb;
        else
        auxb=auxb-auxa;
    }
    p=(x->numitor)*(y->numitor);
    z->numitor=p/auxa;
	x->numarator=(x->numarator)*(y->numitor);
	y->numarator=(y->numarator)*(x->numitor);
	z->numarator=x->numarator+y->numarator;
}
void scadere(rational *x,rational *y,rational *z)
{
     int auxa,auxb,p;
    auxa=x->numitor;
    auxb=y->numitor;
    while(auxa!=auxb)
    {
        if(auxa>auxb)
        auxa=auxa-auxb;
        else
        auxb=auxb-auxa;
    }
    p=(x->numitor)*(y->numitor);
    z->numitor=p/auxa;
	x->numarator=(x->numarator)*(y->numitor);
	y->numarator=(y->numarator)*(x->numitor);
	z->numarator=x->numarator-y->numarator;
}
void inmultire(rational *x,rational *y,rational *z)
{
    z->numitor=(x->numitor)*(y->numitor);
    z->numarator=(x->numarator)*(y->numarator);
}
void impartire(rational *x,rational *y,rational *z)
{
    z->numarator=(x->numarator)*(y->numitor);
    z->numitor=(x->numitor)*(y->numarator);
}
void ridicare_la_putere(rational *z,int nr)
{
    int i=1,p1=1,p2=1;
    while(i<=nr)
    {
        p1=p1*z->numarator;
        p2=p2*z->numitor;
        i++;
    }
    z->numarator=p1;
    z->numitor=p2;
}
int main()
{
	FILE *f,*g;
	int nr;
	char fisier[10];
	printf("introduceti numele fisierului de intrare:");
	gets(fisier);
	f=fopen(fisier,"r");
	g=fopen("iesire.txt","w");
	if(f==NULL)
	{
		perror("error");
		exit(1);
	}

    rational x,y,z;
    while(!feof(f))
    {
       fscanf(f, "%d %d",&(z.numarator),&(z.numitor));
        simplificare(&z);
        printf("%d %d \n",z.numarator, z.numitor);
        fprintf(g,"%d %d \n",z.numarator, z.numitor);
    }
    while(!feof(f))
    {
		fscanf(f, "%d %d",&(x.numarator),&(x.numitor));
		fscanf(f, "%d %d",&(y.numarator),&(y.numitor));
        adunare(&x,&y,&z);
        printf("%d %d \n",z.numarator, z.numitor);
        fprintf(g,"%d %d \n",z.numarator, z.numitor);
	}
	while(!feof(f))
	{
        fscanf(f, "%d %d",&(x.numarator),&(x.numitor));
		fscanf(f, "%d %d",&(y.numarator),&(y.numitor));
        scadere(&x,&y,&z);
        printf("%d %d \n",z.numarator, z.numitor);
        fprintf(g,"%d %d \n",z.numarator, z.numitor);
	}
    while(!feof(f))
	{
        fscanf(f, "%d %d",&(x.numarator),&(x.numitor));
		fscanf(f, "%d %d",&(y.numarator),&(y.numitor));
        inmultire(&x,&y,&z);
        printf("%d %d \n",z.numarator, z.numitor);
        fprintf(g,"%d %d \n",z.numarator, z.numitor);
	}
	while(!feof(f))
	{
        fscanf(f, "%d %d",&(x.numarator),&(x.numitor));
		fscanf(f, "%d %d",&(y.numarator),&(y.numitor));
	    impartire(&x,&y,&z);
        printf("%d %d \n",z.numarator, z.numitor);
        fprintf(g,"%d %d \n",z.numarator, z.numitor);
	}
    printf("Introduceti valoarea la care doriti sa ridicati fractiile");
    scanf("%d",&nr);
    while(!feof(f))
    {
       fscanf(f, "%d %d",&(z.numarator),&(z.numitor));
        ridicare_la_putere(&z,nr);
        printf("%d %d \n",z.numarator, z.numitor);
        fprintf(g,"%d %d \n",z.numarator, z.numitor);
    }
    fclose(f);
    fclose(g);
return 0;
}

