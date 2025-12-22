#include "evol2.h"
#include "ytab.h"
#include <stdio.h>

#define NSTIVA 256
static Data stiva[NSTIVA]; /* stiva de executie a interpretorului */
static Data *stivap;       /* urmatoarea pozitie libera pe stiva */

#define NPROG 200
Inst prog[NPROG];  /* masina interpretorului */
		   /* aici se genereaza codul program care */
		   /* va fi executat cu ajutorul stivei  */
Inst *progp;             /* urmatoarea pozitie libera in 'prog' */
Inst *pc;                /* contoò program */
Inst *progbase=prog;     /* inceputul pe program */
int revenire;            /* arå val® 1 daca a fost vazut RETURN */
typedef struct Cadru {   /* stiva pt® proceduri si functii */
	Simbol *sp;      /* intrare in tabela de simboluri */
	Inst *retpc;     /* adresa de revenire */
	Data *argn;      /* al n-lea argument de pe stiva */
	int nrarg;       /* numar de argumente */
} Cadru;

#define NCADRE 100
Cadru cadre[NCADRE];
Cadru *fp;            /* pointer in stiva de apeluri */

void STOP(){}

void initcod()           /* initializare pentru generare */
{	int i;
	stivap=stiva;
	for(i=progbase-prog;i<NPROG;i++) prog[i]=STOP;
	progp=progbase;
	fp=cadre;
	revenire=0;
}

void push(d)         /* pune pe 'd' pe stiva de executie */
	Data d;
{	if(stivap>=&stiva[NSTIVA])
	   execerror("depasire capacit. stiva de exec.",(char *) 0);
	*stivap++=d;  }

Data pop()               /* preia o valoare de pe stiva */
{	if(stivap<=stiva) execerror("stiva de executie vida",(char *)0);
	return *--stivap;  }

Inst *cod(f)       /* adauga la codul generat in masina 'prog' */
	Inst f;		    /* instructiune sau operand */
{	Inst *oprogp=progp;
	if(progp>=&prog[NPROG])	execerror("program prea mare",(char *)0);
	*progp++=f;
	return oprogp; }

void executa(p)          /* executa un program aflat in masina 'prog' */
	Inst *p;
{	for (pc=p;*pc!=STOP && !revenire;) (*(*pc++))(); }

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
{	Data d1,d2;	d2=pop();	d1=pop();
	d1.val+=d2.val;
	push(d1); }

void eval()         /* evalueaza o variabila aflata in virful stivei */
{	Data d;	d=pop();
	if(d.simb->tip==NEDEF)
		execerror("variabila nedefinita",d.simb->nume);
	d.val=d.simb->u.val;
	push(d); }

void assign()  /* asigneaza elem. din vf. stivei urmatorul element */
{	Data d1,d2;	d1=pop();	d2=pop();
	if(d1.simb->tip!=VAR && d1.simb->tip!=NEDEF)
		execerror("asignare imposibila",d1.simb->nume);
	d1.simb->u.val=d2.val;
	d1.simb->tip=VAR;
	push(d2);
}

void print()       /* afiseaza virful stivei */
{	Data d;	d=pop();
	printf("\t%.8g",d.val); }

void predf()       /* evalueaza o functie predefinita */
{	Data d;	d=pop();
	d.val=( *(double (*)()) ( ((Simbol *)(*pc)) ->u.ptr) ) (d.val);
	pc++;
	push(d); }

void negate()
{	Data d;	d=pop(); d.val=-d.val;	push(d); }

void power()
{	Data d1,d2;	extern double Pow();
	d2=pop();  	d1=pop();
	d1.val=Pow(d1.val,d2.val);
	push(d1); }

void div()
{	Data d1,d2;	d2=pop();
	if(d2.val==0.0) execerror("impartire cu zero",(char *)0);
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
{	Data d;	d=pop(); d.val=(double)(d.val==0.0); push(d); }

void prexpr()
{	Data d;	d=pop(); printf("%.8g",d.val); }

void prstr()    /* tipareste un sir */
{	printf("%s",((Simbol *)(*pc++))->u.str); }

void whilecod()
{	Data d;
	Inst *savepc=pc;
	executa(savepc+2);     /* conditia */
	d=pop();
	while(d.val){
		executa(*((Inst **)(savepc)));  /* corpul */
		if(revenire) break;
		executa(savepc+2);              /* conditia */
		d=pop();
	}
	if (!revenire)
	  pc=*((Inst **)(savepc+1));    /* urmatoarea instructiune */
}

void ifcod()
{	Data d;
	Inst *savepc=pc;  /* portiunea then */
	executa(savepc+3);  /* conditie */
	d=pop();
	if(d.val) executa(*((Inst **)(savepc)));
	else if (**((Inst **)(savepc+1))!=STOP) {    /* else ? */
		executa(*((Inst **)(savepc+1)));}
	if(!revenire)
	  if (**((Inst **)(savepc+1))!=STOP)  /* else ? */
		  pc=*((Inst **)(savepc+2));
	  else
		  pc=*((Inst **)(savepc+1));
}

void define(sp)      /* instaleaza functie si procedura */
	Simbol *sp;
{	sp->u.defn=(Inst)progbase;    /* inceputul codului */
	progbase=progp; }

void call()      /* apel de functie */
{	Simbol *sp=(Simbol *) pc[0];    /* tabela de simboluri */
					/* ptr. functie */
	if(fp++>=&cadre[NCADRE-1])
		execerror(sp->nume,"prea multe apeluri imbricate");
	fp->sp=sp;
	fp->nrarg=(int)pc[1];
	fp->retpc=pc+2;
	fp->argn=stivap-1; /* urmatorul argument */
	executa(sp->u.defn);
	revenire=0;
}

void ret()    /* portiunea comuna ptr. reveniri */
{	int i;
	for(i=0;i<fp->nrarg;i++)   pop();
	pc=(Inst *)fp->retpc;
	--fp;
	revenire=1;
}

void funcret()     /* revenire dintr-o functie */
{	Data d;
	if(fp->sp->tip == PROCEDURE)
		execerror(fp->sp->nume,"(proc) returneaza o valoare");
	d=pop();
	ret();
	push(d); }

void procret()     /* revenirea dintr-o procedura */
{	if (fp->sp->tip == FUNCTION)
	   execerror(fp->sp->nume,"(func) nu returneaza nici o valoare");
	ret(); }

double *getarg()     /* pointer la argument */
{	int nrarg=(int)*pc++;
	if(nrarg > fp->nrarg)
		execerror(fp->sp->nume,"insuficiente argumente");
	return &fp->argn[nrarg - fp->nrarg].val; }

void arg()                /* aranjeaza un argument pe stiva */
{	Data d;
	d.val=*getarg();
	push(d); }

void argassign()       /* aranjeaza vf.-ul stivei in argument */
{	Data d; d=pop(); push(d);
	*getarg()=d.val; }

void varread()         /* citeste intr-o variabila */
{	Data d;
	extern FILE *fin;
	Simbol *var=(Simbol *) *pc++;
Bucla:  switch(fscanf(fin,"%lf",&var->u.val)){
	case EOF:	if (moreinput())  goto Bucla;
			d.val=var->u.val=0.0;
			break;
	case 0:         execerror("valoare ne-numerica",var->nume);
			break;
	default:        d.val=1.0;
			break;
	}
	var->tip=VAR;
	push(d);
}