%{
#include <stdio.h>
#include <stdlib.h>
%}
%token TYPE RETURN ID NUM
%right	'='
%left '+''-'
%left '*' '/'
%right UMINUS
%left '!'

%%
S	: FUN {printf("Input accepted\n"); exit(0);}
FUN	: TYPE ID '(' PARAM ')' '{' BODY '}'
	;
PARAM	: PARAM ',' TYPE ID
	| TYPE ID
	|
	;
BODY	: BODY BODY
	| PARAM ';'
	| E ';'
		| RETURN E ';'
		|
	;
E	: ID '=' E
	| E '+' E
	| E '-' E
	| E '*' E
	| E '/' E
	| ID
	| NUM
	;
	
%%
#include "lex.yy.c"
int main(){
	printf("Enter the expression:\n");
	yyparse();
}

int yyerror(char *s) {;}/*implicit syntax error*/ 
