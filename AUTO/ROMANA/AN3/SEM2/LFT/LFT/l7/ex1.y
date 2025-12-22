%{
#define YYSTYPE double  /* stiva Yacc */
%}

%token NUMAR
%left '+' '-'     /* asociativitate stinga ;aceeasi prioritate */
%left '*' '/'     /* asociativitate stinga ;prioritate superioara */
%left MINUSUNAR   /* prioritate mai mare decit a '*' si '/' */ 

%%
list	: /*vida*/
	| list '\n'
	| list expr '\n' {printf("\t%.8g\n",$2);}
	;
expr	: NUMAR	                    {$$ = $1;}
	| expr '+' expr             {$$ = $1 + $3;}
	| expr '-' expr             {$$ = $1 - $3;}
	| expr '*' expr             {$$ = $1 * $3;}
	| expr '/' expr             {$$ = $1 / $3;}
	| '-' expr %prec MINUSUNAR  {$$ = - $2;}    
	| '(' expr ')'              {$$ = $2;}
	;
%%
#include <stdio.h>
#include <ctype.h>
char *cmd;       /* pentru mesaje de eroare */
int nrlinie = 1;
void main(argc,argv)	char *argv[];	int argc;
{ cmd=argv[0]; yyparse();}

yylex()
{	int c;
	yylval=0;
	while ((c=getchar()) == ' ' || c=='\t');
	if (c == EOF) return 0;
	if (c == '.' || isdigit(c)) { /* un numar */
		ungetc(c,stdin);
		scanf("%lf" , &yylval);
		return NUMAR;
	}
	if (c == '\n') nrlinie++;
	return c;
}

void yyerror(s)  /* Implicit s="Eroare de sintaxa" */
	char *s;
{	void warning();
	warning(s , (char *) 0);
}

void warning(s , t)    /* afiseaza mesajele de eroare */
	char *s, *t;
{
	fprintf(stderr,"%s  %s",cmd,s);
	if(t)
		fprintf(stderr," %s",t);
	fprintf(stderr," ->linia numarul %d\n",nrlinie);
}
