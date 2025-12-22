%{
#include "evol1.h"
#define cod2(c1,c2)        cod(c1);cod(c2)
#define cod3(c1,c2,c3)     cod(c1);cod(c2);cod(c3)
%}

%union {              /* tipul stivei Yacc */
	Simbol *simb;  /* pointer in tabela de simboluri */
	Inst   *inst; /* instructiune masina */
}

%token <simb> NUMAR PRINT VAR PREDEF NEDEF WHILE
%token <simb> IF ELSE
%type <inst> instr asgn expr listainstr cond while
%type <inst> if end
%right '='
%left OR
%left AND
%left GT GE LT LE EQ NE
%left '+' '-'
%left '*' '/'
%left MINUSUNAR NOT
%right '^'
%%

lista	: /*vida*/
	| lista '\n'
	| lista asgn '\n'   {cod2(print,STOP);return 1;}
	| lista instr '\n'  {cod(STOP);return 1;}
	| lista expr '\n'   {cod2(print,STOP);return 1;}
	| lista error '\n'  {yyerrok;}
	;
asgn	: VAR '=' expr     { $$=$3; cod3(varpush,(Inst)$1,assign);}
	;
instr	: expr          {cod(pop);}
	| PRINT expr    {cod(prexpr); $$=$2;}
	| while cond instr end {
			($1)[1]=(Inst)$3;  /* corpul buclei */
			($1)[2]=(Inst)$4;} /* end */
	| if cond instr end {               /* if fara else */
			($1)[1]=(Inst)$3;  /* partea then */
			($1)[2]=(Inst)$4;}
	| if cond instr end ELSE instr end { /* if cu else */
			($1)[1]=(Inst)$3;  /* then */
			($1)[2]=(Inst)$6;  /* else */
			($1)[3]=(Inst)$7;} /* end */
	| '{' listainstr '}' { cod(STOP); $$=$2; }
	;
cond	: '(' expr ')'  	{cod(STOP); $$=$2;}
	| '(' expr ')' '\n'	{cod(STOP); $$=$2;}
	;
while	: WHILE         {$$=cod3(whilecod,STOP,STOP);}
	;
if	: IF  {$$=cod(ifcod); cod3(STOP,STOP,STOP);}
	;
end	: /* vida */  {cod(STOP); $$=progp;}
	;
listainstr: /* vida */  {$$=progp;}
	| listainstr '\n'
	| listainstr instr
	;
expr	: NUMAR		{$$=cod2(constpush,(Inst)$1);}
	| VAR           {$$=cod3(varpush,(Inst)$1,eval);}
	| asgn
	| PREDEF '(' expr ')'
				{$$=$3; cod2(predf,(Inst)$1);}
	| '(' expr ')'  	{$$=$2;}
	| expr '+' expr         {cod(add);}
	| expr '-' expr         {cod(sub);}
	| expr '*' expr         {cod(mul);}
	| expr '/' expr         {cod(div);}
	| expr '^' expr         {cod(power);}
	| '-' expr %prec MINUSUNAR {$$=$2;cod(negate);}
	| expr GT expr              {cod(gt);}
	| expr GE expr              {cod(ge);}
	| expr LT expr              {cod(lt);}
	| expr LE expr              {cod(le);}
	| expr EQ expr              {cod(eq);}
	| expr NE expr              {cod(ne);}
	| expr AND expr             {cod(and);}
	| expr OR expr              {cod(or);}
	| NOT expr                  {$$=$2; cod(not);}
	;
%%

#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <math.h>
extern double Log(),Log10(),Exp(),Sqrt(),integer();
char *cmd;       /* pentru mesaje de eroare */
int nrlinie = 0;

#include <signal.h>
#include <setjmp.h>
jmp_buf begin;


static struct { char *nume;
		void (*func)();
} instructiuni[]= { "pop", pop,	"eval",	eval,	"add",  add,
	"sub",  sub,  	"mul",  mul,	"div",  div,	"negate",negate,
	"power",power,	"assign",assign,"predf",predf,	"varpush",varpush,
	"constpush",constpush,		"print",print,	"STOP",STOP,
	"prexpr",prexpr,"gt",gt,	"lt",lt,	"eq",eq,
	"ge",ge,	"le",le,	"ne",ne,	"and",and,
	"or",or,	"not",not,	"ifcod",ifcod,
	"whilecod",whilecod,		0,	0 };

Predef predef[]={"sin",sin,	"cos",	cos,	"atan", atan,
"log",  Log,	"log10", Log10,	"exp",Exp,	"sqrt",Sqrt,
"int",integer,	"abs",fabs,	0,0  };

main(argc,argv)
	char *argv[];	int argc;
{	void fpecatch(),init(),initcode(),afisare();
	cmd=argv[0]; 
	init();
	setjmp(begin);
	signal(SIGFPE,fpecatch);
	for(initcod(); yyparse(); ){
		char c;
		afisare(prog);
		printf("\nDoriti executie [d/n]?");  c=getchar();
		putchar('\n');
		if(c=='D' || c=='d') executa(prog);
		progp--; //elimin STOP-urile dintre instructiuni/linii
	}
	return 0;
}

void afisare(prog)
	Inst *prog;
{	void afis();
	Inst *p;
	int contor;
	for(p=prog,contor=0;contor<7;p++){
		if((p-prog)%20==0 &&(p!=prog)) {
			printf("\n\t\tApasati o tasta pentru continuare !\n");
			getchar();
		}
		printf("\n[%3d] ",p-prog);
		if (*p==STOP) contor++;
		else contor=0;
		afis(*p);
	}
	putchar('\n');
}

void afis(inst) Inst inst;
{	int i;
	for(i=0;instructiuni[i].nume;i++) 
		if(inst==instructiuni[i].func){
			printf("%s",instructiuni[i].nume);
			return;
		}

	if(((Simbol *)(inst))->tip==VAR) {
		printf("=======>%s ==",((Simbol *)(inst))->nume);
		printf("%lf {VAR}",((Simbol *)(inst))->u.val);
		return;
	}

	for(i=0;predef[i].nume;i++) 
		if( ( (double (*)())  ( ((Simbol *)(inst))->u.ptr) )
			== predef[i].func) {
		   printf("=======>%s {PREDEF}",predef[i].nume);
		   return;
		}

	if( ( ( ((Inst *)(inst))-prog ) < 200) &&
       	    ( ( ((Inst *)(inst))-prog ) > 0) ) {
		printf("------->[%3d]",((Inst *)(inst))-prog);
		return;
	}

	printf("=======>%lf",((Simbol *)(inst))->u.val);
	switch(((Simbol *)(inst))->tip) {
		case NUMAR:	printf(" {NUMAR}");
				break;
		case NEDEF:     printf(" {NEDEF}");
				break;
		default:        printf(" {NECUNOSCUT}");
	}
	return;
}

void execerror(s,t)        /* eroare de executie */
	char *s,*t;
{	void avert();
	avert(s,t);
	longjmp(begin,0); }

void fpecatch()            /* eroare aritmetica */
{	void execerror();
	execerror("eroare aritmetica",(char *) 0); }

yylex()
{	int c;
	while ((c=getchar()) == ' ' || c=='\t');
	if (c == EOF) return 0;
	if (c == '.' || isdigit(c)) { /* un numar */
		double d;
		ungetc(c,stdin);
		scanf("%lf" , &d);
		yylval.simb=instal("",NUMAR,d);
		return NUMAR;
	}
	if (isalpha(c)) {
		Simbol *s;
		char sbuf[100],*p=sbuf;
		do { *p++=c; }while ((c=getchar())!=EOF && isalnum(c));
		ungetc(c,stdin);
		*p='\0';
		if ((s=caut(sbuf))==NULL)
			s=instal(sbuf,NEDEF,0.0);
		yylval.simb=s;
		return s->tip==NEDEF ? VAR : s->tip;
	}
	switch(c) {
		case '>':    return urmator('=',GE,GT);
		case '<':    return urmator('=',LE,LT);
		case '=':    return urmator('=',EQ,'=');
		case '!':    return urmator('=',NE,NOT);
		case '|':    return urmator('|',OR,'|');
		case '&':    return urmator('&',AND,'&');
		case '\n':   nrlinie++; return '\n';
		default:     return c;
	}
}

urmator(asteptat,da,nu)
{	int c=getchar();
	if(c==asteptat) return da;
	ungetc(c,stdin);
	return nu; }

void yyerror(s)  /* Implicit s="Eroare de sintaxa" */
	char *s;
{	void avert();
	avert(s , (char *) 0); }

void avert(s , t)    /* afiseaza mesajele de eroare */
	char *s, *t;
{	fprintf(stderr,"%s  %s",cmd,s);
	if(t)	fprintf(stderr," %s",t);
	fprintf(stderr," ->linia nr. %d\n",nrlinie); }