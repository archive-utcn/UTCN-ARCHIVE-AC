#include <stdio.h>
#include <alloc.h>

typedef struct lis{
	float inf;
	lis *leg;
	}lista;

void citire(lista* &l){
int n,i;
lista *u,*e;
float v;
l=0;
printf("Numarul de elemente: ");
scanf("%d",&n);
printf("Elementele in ordine crescatoare...\n");
for(i=0;i<n;i++){
	e=(lista *) malloc (sizeof(lista));
	printf("Elemetul al %d-lea: ",i+1);
	scanf("%f",&v);
	e->inf=v;
	e->leg=0;
	if(l==0) l=e;
	else u->leg=e;
	u=e;
	}
}

void afisare(lista* l){
lista *e=l;
while(e){
	printf("%f ",e->inf);
	e=e->leg;
	}
printf("\n");
}

void interclasare(lista *a,lista *b,lista *&c){
lista *e,*u;
float min;
c=0;
while(a&&b){
	min=a->inf;
	if(min>b->inf) min=b->inf;
	if((c==0)||(min>u->inf)){
		e=(lista*) malloc (sizeof(lista*));
		e->inf=min;
		e->leg=0;
		if(c==0) c=e;
		else u->leg=e;
		u=e;
		}
	if(min==a->inf) a=a->leg;
	if(min==b->inf) b=b->leg;
	}
while(a){
	if((c==0)||(a->inf>u->inf)){
		e=(lista*) malloc (sizeof(lista*));
		e->inf=a->inf;
		e->leg=0;
		if(c==0) c=e;
		else u->leg=e;
		u=e;
		}
	a=a->leg;
	}
while(b){
	if((c==0)||(b->inf>u->inf)){
		e=(lista*) malloc (sizeof(lista*));
		e->inf=b->inf;
		e->leg=0;
		if(c==0) c=e;
		else u->leg=e;
		u=e;
		}
	b=b->leg;
	}
}

int main(){
lista *a,*b,*c;
citire(a);
citire(b);
interclasare(a,b,c);
afisare(c);
return 0;
}