#include<stdio.h>
#include<stdlib.h>
#define PI 3.14159
#include<math.h>
typedef union
{
	int lungime;
	int latime;
	int raza;
	int latura;
} date;

typedef struct
{
	char nume[20];
	double arie;
	date d;
} figura;

int main ()
{
	figura cerc,dreptunghi[2],patrat,triunghi;
	char s;
	printf("figura geometrica: 'c'=cerc   'd'=dreptunghi   'p'=patrat   't'=triunghi \n");
	scanf("%c",&s);
	if(s=='c')
	{
		strcpy(cerc.nume,"cerc");
		printf("R=");
		scanf("%d",&cerc.d.raza);
		cerc.arie=PI*cerc.d.raza*cerc.d.raza;
		printf("aria cercului %f",cerc.arie);
	}
	if(s=='d')
	{
		strcpy(dreptunghi[1].nume,"dreptunghi");
		printf("L=");
		scanf("%d",&dreptunghi[1].d.lungime);
		printf("l=");
		scanf("%d",&dreptunghi[2].d.latime);
		dreptunghi[1].arie=dreptunghi[1].d.lungime*dreptunghi[2].d.latime;
		printf("aria dreptunghiului %f",dreptunghi[1].arie);
	}
	if(s=='p')
	{
		strcpy(patrat.nume,"patrat");
		printf("l=");
		scanf("%d",&patrat.d.lungime);
		patrat.arie=patrat.d.lungime*patrat.d.lungime;
		printf("aria patratului %f",patrat.arie);
	}
	if(s=='t')
	{
		strcpy(triunghi.nume,"triunghi");
		printf("l=");
		scanf("%d",&triunghi.d.latura);
		triunghi.arie=(triunghi.d.latura*3)*(triunghi.d.latura*3)/(12*sqrt(3));
		printf("aria triunghiului %f",triunghi.arie);
	}
	return 0;
}
