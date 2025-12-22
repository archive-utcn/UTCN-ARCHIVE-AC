#include "evol1.h"
#include "ytab.h"

#define NPROG 200
#define NSTIVA 256
static Data stiva[NSTIVA];  /* stiva de executie a interpretorului */
static Data *stivap;        /* urmatoarea pozitie libera pe stiva */

Inst prog[NPROG];              /* masina interpretorului */
			       /* aici se genereaza 'codul' program care */
		               /* va fi executat cu ajutorul stivei 'stack' */
Inst *progp;                   /* urmatoarea pozitie libera in 'prog' */
Inst *pc;                      /* program counter */

void STOP(){}

void initcod()           /* initializare pentru generare */
{	int i;
	stivap=stiva;
	for(i=0;i<NPROG;i++)
		prog[i]=STOP;
	progp=prog; }

void push(d)            /* depune pe 'd' pe stiva de executie */
	Data d;
{	if(stivap>=&stiva[NSTIVA])
	   execerror("depasire capacitate stiva de executie",(char *) 0);
	*stivap++=d; }

Data pop()               /* preia o valoare de pe stiva */
{	if(stivap<=stiva)
		execerror("stiva de executie vida",(char *)0);
	return *--stivap; }

Inst *cod(f)       /* adauga la codul generat in masina 'prog' */
	Inst f;		    /* instructiune sau operand */
{	Inst *oprogp=progp;
	if(progp>=&prog[NPROG])
		execerror("program prea mare",(char *)0);
	*progp++=f;
	return oprogp; }

void executa(p)          /* executa un program aflat in masina 'prog' */
	Inst *p;
{	for (pc=p;*pc!=STOP;) 	(*(*pc++))(); }

void constpush()    /* depune pe stiva de executie o constanta */
		    /* aflata pe urmatoarea pozitie in 'prog' */
{	Data d;
	d.val=((Simbol *)*pc++)->u.val;
	push(d); }

void varpush()       /* depune pe stiva de executie o variabila */
		     /* adica un pointer in tabela de simboluri */
{	Data d;
	d.simb=(Simbol *)(*pc++);
	push(d); }

void add()         /* aduna primele doua elemente din virful stivei */
{	Data d1,d2; d2=pop(); d1=pop();
	d1.val+=d2.val;
	push(d1); }

void eval()         /* evalueaza o variabila aflata in virful stivei */
{	Data d;  d=pop();
	if(d.simb->tip==NEDEF)
		execerror("variabila nedefinita",d.simb->nume);
	d.val=d.simb->u.val;
	push(d); }

void assign() /*asigneaza elementului din virful stivei urmatorul element */
{	Data d1,d2;	d1=pop();	d2=pop();
	if(d1.simb->tip!=VAR && d1.simb->tip!=NEDEF)
		execerror("asignare imposibila",d1.simb->nume);
	d1.simb->u.val=d2.val;
	d1.simb->tip=VAR;
	push(d2); }

void print()       /* afiseaza virful stivei */
{	Data d;  d=pop();
	printf("\t%.8g\n",d.val); }

void predf()       /* evalueaza o functie predefinita */
{	Data d;	   d=pop();
	d.val=( *(double (*)()) ( ((Simbol *)(*pc)) ->u.ptr) ) (d.val);
	pc++;
	push(d); }

void negate()
{	Data d; d=pop();  d.val=-d.val;	push(d); }

void power()
{	Data d1,d2;
	extern double Pow();
	d2=pop(); d1=pop();
	d1.val=Pow(d1.val,d2.val);
	push(d1); }

void div()
{	Data d1,d2;    d2=pop();
	if(d2.val==0.0)	execerror("impartire cu zero",(char *)0);
	d1=pop();
	d1.val /= d2.val;
	push(d1); }

void mul()
{	Data d1,d2;	d2=pop();	d1=pop();
	d1.val *= d2.val;
	push(d1); }

void sub()
{	Data d1,d2;	d2=pop();	d1=pop();
	d1.val -= d2.val;
	push(d1); }

void gt()
{	Data d1,d2;	d2=pop();	d1=pop();
	d1.val=(double)(d1.val>d2.val);
	push(d1); }

void lt()
{	Data d1,d2;	d2=pop();	d1=pop();
	d1.val=(double)(d1.val<d2.val);
	push(d1); }

void eq()
{	Data d1,d2;	d2=pop();	d1=pop();
	d1.val=(double)(d1.val==d2.val);
	push(d1); }

void ge()
{	Data d1,d2;	d2=pop();	d1=pop();
	d1.val=(double)(d1.val>=d2.val);
	push(d1); }

void le()
{	Data d1,d2;	d2=pop();	d1=pop();
	d1.val=(double)(d1.val<=d2.val);
	push(d1); }

void ne()
{	Data d1,d2;	d2=pop();	d1=pop();
	d1.val=(double)(d1.val!=d2.val);
	push(d1); }

void and()
{	Data d1,d2;	d2=pop();	d1=pop();
	d1.val=(double)(d1.val!=0.0 && d2.val!=0.0);
	push(d1); }

void or()
{	Data d1,d2;	d2=pop();	d1=pop();
	d1.val=(double)(d1.val!=0.0 || d2.val!=0.0);
	push(d1); }

void not()
{	Data d;  d=pop();
	d.val=(double)(d.val==0.0);
	push(d); }

void prexpr()
{	Data d;   d=pop();   printf("%.8g\n",d.val); }

void whilecod()
{	Data d;	Inst *savepc=pc;
	executa(savepc+2);     /* conditia */
	d=pop();
	while(d.val) {
		executa(*((Inst **)(savepc)));  /* corpul */
		executa(savepc+2);
		d=pop();
	}
	pc=*((Inst **)(savepc+1));    /* ultima instructiune */
}

void ifcod()
{	Data d;
	void afis();
	Inst *savepc=pc;  /* portiunea then */
	executa(savepc+3);  /* conditie */
	d=pop();
	if(d.val) executa(*((Inst **)(savepc)));
	else if (**((Inst **)(savepc+1))!=STOP)   /* else */
		executa(*((Inst **)(savepc+1)));
	pc=*((Inst **)(savepc+2));
}
