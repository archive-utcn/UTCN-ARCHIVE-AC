#include <stdio.h>
#include <alloc.h>

//Matrice implementata sub forma unei liste simplu inlantuite
//Fiecare element al listei va retine valoarea unui element al matricei (inf)
//si legatura (adresa) catre urmatorul element
//Elementele matricei vor fi retinute in ordinea data de liniarizare
//Primele doua elemente ale listei vor retine ca informatii dimensiunile
//matricei
typedef struct mat{
	int inf;
	struct mat *leg;
	}matrice;


void citire(matrice* &m){
int i,j,l,c,v;
matrice *u,*e;
printf("Dati dimensiunile matricei (nr linii / nr coloane)\n");
scanf("%d%d",&l,&c);
m=(matrice *)malloc(sizeof(matrice));
m->inf=l;
m->leg=0;
u=(matrice *)malloc(sizeof(matrice));
u->inf=c;
u->leg=0;
m->leg=u;
for(i=0;i<l;i++)
	for(j=0;j<c;j++){
		printf("Elementul de pe pozitia (%d,%d): ",i+1,j+1);
		scanf("%d",&v);
		e=(matrice *)malloc(sizeof(matrice));
		e->inf=v;
		e->leg=0;
		u->leg=e;
		u=e;
		}
}

void afisare(matrice *m){
int i,j,l=m->inf,c=m->leg->inf;
matrice *e=m->leg->leg;
for(i=0;i<l;i++){
	for(j=0;j<c;j++){
		printf("%d ",e->inf);
		e=e->leg;
		}
	printf("\n");
	}
}

void produs(matrice *a,matrice *b,matrice *&p){
int l1=a->inf,c1=a->leg->inf,l2=b->inf,c2=b->leg->inf,l,c,i,j,k,n;
matrice *u,*e,*a1,*b1;
if(c1==l2){
	l=l1;
	c=c2;
	}
else l=c=0;
p=(matrice *)malloc(sizeof(matrice));
p->inf=l;
p->leg=0;
u=(matrice *)malloc(sizeof(matrice));
u->inf=c;
u->leg=0;
p->leg=u;
for(i=0;i<l;i++)
	for(j=0;j<c;j++){
		e=(matrice *)malloc(sizeof(matrice));
		e->inf=0;
		e->leg=0;
		u->leg=e;
		u=e;
		a1=a->leg->leg;
		b1=b->leg->leg;
		//Se cauta elem din mat a si elem din mat b
		//care inmultite si adunate corespunzator vor da elem din mat c
		for(k=0;k<i;k++)
			for(n=0;n<c1;n++) a1=a1->leg;
		for(k=0;k<j;k++) b1=b1->leg;
		for(k=0;k<c1;k++){
			u->inf+=a1->inf*b1->inf;
			if(k<c1-1){
				a1=a1->leg;
				for(n=0;n<c2;n++) b1=b1->leg;
				}
			}
		}
}

int main(){
matrice *a,*b,*p;
citire(a);
citire(b);
produs(a,b,p);
afisare(p);
return 0;
}