%{
#include "evol.h"
extern double Pow();
%}
%union {             /* tipul stivei Yacc */
	double val;  /* o valoare */
	Symbol *sym; /* pointer in tabela de simboluri */ } 

%token <val>   NUMAR
%token <sym> VAR PREDEF NEDEF
%type <val>    expr asgn
%right '='
%left '+' '-'     /* asociativitate stinga ;aceeasi prioritate */
%left '*' '/'     /* asociativitate stinga ;prioritate superioara */
%left MINUSUNAR   /* prioritate mai mare decit a '*' si '/' */ 
%right '^'        /* ridicare la putere */
%%
list	: /*vida*/
	| list '\n'
	| list asgn '\n'
	| list expr '\n' {printf("\t%.8g\n",$2);}
	| list error '\n' {yyerrok;}
	;
asgn	: VAR '=' expr {$$=$1->u.val=$3;$1->tip=VAR;}
	;
expr	: NUMAR	    
	| VAR      {if ($1->tip == NEDEF)
		      execerror("variabila nedefinita",$1->nume);
				$$=$1->u.val;}
	| asgn
	| PREDEF '(' expr ')'        {$$=(*($1->u.ptr))($3);}
	| expr '+' expr             {$$ = $1 + $3;}
	| expr '-' expr             {$$ = $1 - $3;}
	| expr '*' expr             {$$ = $1 * $3;}
	| expr '/' expr             {
			    if ($3 == 0.0)
				execerror("impartire cu zero","");		
		 		$$ = $1 / $3;}
	| expr '^' expr             {$$=Pow($1,$3);}
	| '(' expr ')'              {$$ = $2;}
	| '-' expr %prec MINUSUNAR  {$$ = - $2;}    
	;
%%
#include <stdio.h>
#include <ctype.h>
char *cmd;       /* pentru mesaje de eroare */
int nrlinie = 1;
#include <signal.h>
#include <setjmp.h>
jmp_buf begin;

void main(argc,argv)
	char *argv[];	int argc; 
{	void fpecatch(),init();
	cmd=argv[0];
	init();
	setjmp(begin);
	signal(SIGFPE,fpecatch);
	yyparse();
}

void execerror(s,t)        /* eroare de executie */
	char *s,*t;
{	void warning();
	warning(s,t);
	longjmp(begin,0);
}

void fpecatch()            /* eroare aritmetica */
{	void execerror();
	execerror("eroare aritmetica",(char *) 0);
}

yylex()
{	int c;
	while ((c=getchar()) == ' ' || c=='\t');
	if (c == EOF) return 0;
	if (c == '.' || isdigit(c)) { /* un numar */
		ungetc(c,stdin);
		scanf("%lf" , &yylval);
		return NUMAR;
	}
	if (isalpha(c)) {
		Symbol *s;
		char sbuf[100],*p=sbuf;
		do {
		 	*p++=c;
		}while ((c=getchar())!=EOF && isalnum(c));
		ungetc(c,stdin);
		*p='\0';
		if ((s=caut(sbuf))==NULL)
			s=instal(sbuf,NEDEF,0.0);
		yylval.sym=s;
		return s->tip==NEDEF ? VAR : s->tip;
	}
	if (c == '\n') nrlinie++;
	return c;
}
		
void yyerror(s)  /* Implicit s="Eroare de sintaxa" */
	char *s;
{	void warning();
	warning(s , (char *) 0);  }

void warning(s , t)    /* afiseaza mesajele de eroare */
	char *s, *t;
{	fprintf(stderr,"%s  %s",cmd,s);
	if(t)
		fprintf(stderr," %s",t);
	fprintf(stderr," ->linia nr. %d\n",nrlinie);
}