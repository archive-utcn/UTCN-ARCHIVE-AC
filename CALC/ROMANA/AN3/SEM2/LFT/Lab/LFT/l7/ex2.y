%{
double mem[26];   /* pentru variabile */
%}

%union {             /* tipul stivei Yacc */
	double val;  /* o valoare */
	int  index;  /* index in mem[] */
} 

%token <val>   NUMBER
%token <index> VAR
%type <val>    expr
%right '='
%left '+' '-'     /* asociativitate stinga ;aceeasi prioritate */
%left '*' '/'     /* asociativitate stinga ;prioritate superioara */
%left UNARYMINUS  /* prioritate mai mare decit a '*' si '/' */ 
%%

list	: /*vida*/
	| list '\n'
	| list expr '\n' {printf("\t%.8g\n",$2);}
	| list error '\n' {yyerrok;}
	;
expr	: NUMBER	    
	| VAR                       {$$ = mem[$1];}
	| VAR '=' expr              {$$ = mem[$1]=$3;}
	| expr '+' expr             {$$ = $1 + $3;}
	| expr '-' expr             {$$ = $1 - $3;}
	| expr '*' expr             {$$ = $1 * $3;}
	| expr '/' expr             {
			if ($3 == 0.0)
				execerror("impartire cu zero","");		
		 		$$ = $1 / $3;}
	| '(' expr ')'              {$$ = $2;}
	| '-' expr %prec UNARYMINUS {$$ = - $2;}    
	;
%%

#include <stdio.h>
#include <ctype.h>
char *nompg;       /* pentru mesaje de eroare */
int lineno = 1;

#include <signal.h>
#include <setjmp.h>
jmp_buf begin;

void main(argc,argv) 
	char *argv[];
	int argc;

{	void fpecatch();
	nompg=argv[0];
	setjmp(begin);
	signal(SIGFPE,fpecatch);
	yyparse();
}

execerror(s,t)        /* eroare de executie */
char *s,*t;
{
	void warning();
	warning(s,t);
	longjmp(begin,0);
}

void fpecatch()            /* eroare aritmetica */
{
   execerror("eroare aritmetica",(char *) 0);
}

yylex()
{
	int c;
	while ((c=getchar()) == ' ' || c=='\t');
	if (c == EOF) return 0;
	if (c == '.' || isdigit(c)) { /* un numar */
		ungetc(c,stdin);
		scanf("%lf" , &yylval);
		return NUMBER;
	}
	if (islower(c)) {
		yylval.index=c-'a';
		return VAR;
	}
	if (c == '\n') lineno++;
	return c;
}
		
void yyerror(s)  /* Implicit s="Sintax eror" */
	char *s;
{
	void warning();
	warning(s , (char *) 0);
}

void warning(s , t)    /* afiseaza mesajele de eroare */
	char *s, *t;
{
	fprintf(stderr,"%s  %s",nompg,s);
	if(t)
		fprintf(stderr," %s",t);
	fprintf(stderr," ->line no. %d\n",lineno);
}