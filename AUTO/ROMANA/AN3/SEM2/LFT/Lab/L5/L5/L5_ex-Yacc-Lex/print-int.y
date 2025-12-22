/* print-int.y YACC COMPILAT PRIMA DATA*/
%{
 #include <stdio.h>
%}
%token INTEGER NEWLINE
%%
linii:	 /* empty ignora liniile vide*/
	| linii NEWLINE
	| linii olinie NEWLINE {printf("identifica nr.=%d\n", $2);}
	| error NEWLINE { yyerror("Includeti-nr-intreg."); 
	  /* sau "syntax error";*/ yyerrok;}
	;
olinie : INTEGER {$$ = $1;}
	;
%%
/* ! FARA: #include "lex.yy.c" */
/* compilare:$   yacc *.y -d  genereaza fisier y.tab.h inclus in Lex */
int main() {return yyparse();}

int yyerror(char *s) {fprintf(stderr,"%s\n",s);}