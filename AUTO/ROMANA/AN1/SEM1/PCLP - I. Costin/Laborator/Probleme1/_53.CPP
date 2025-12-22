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
lista* e=l;
while(e){
	printf("%f ",e->inf);
	e=e->leg;
	}
printf("\n");
}

//Metoda bulelor
//compararea a 2 elem alaturate din lista
//(interschimbare de valori)
void ordonare1(lista* l){
lista *e;
float v;
int ok;
do{
ok=1;
e=l;
while(e->leg){
	if(e->inf>e->leg->inf){
		v=e->inf;
		e->inf=e->leg->inf;
		e->leg->inf=v;
		ok=0;
		}
	e=e->leg;
	}
}while(!ok);
}

//Metoda selectiei directe
//fiecare elem se compara cu toate elem care-l succed
//(interschimbare de valori)
void ordonare2(lista* l){
lista *a,*b;
float v;
a=l;
while(a){
	b=a->leg;
	while(b){
		if(a->inf>b->inf){
			v=a->inf;
			a->inf=b->inf;
			b->inf=v;
			}
		b=b->leg;
		}
	a=a->leg;
	}
}

//Metoda insertiei
//fiecarui elem i se cauta pozitia de inserare (printre elem care-l preced)
void ordonare3(lista* &l){
lista *e,*a,*c,*d;
if(l){
	a=l;
	e=l->leg;
	while(e)
		if(e->inf<l->inf){
			c=e;
			e=e->leg;
			a->leg=e;
			c->leg=l;
			l=c;
			}
		else
			if(e!=l->leg){
				c=l;
				while(e->inf>c->leg->inf) c=c->leg;
				if(c->leg!=e){
					d=e->leg;
					e->leg=c->leg;
					c->leg=e;
					e=d;
					a->leg=e;
					}
				else{
					a=e;
					e=e->leg;
					}
			}
	}
}

int main(){
lista *l;
citire(l);
afisare(l);
ordonare3(l);
afisare(l);
return 0;
}