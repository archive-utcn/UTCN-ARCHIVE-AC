%{
#include <stdio.h>
#include <stdlib.h>
%}
%token ID NUM SELECT DISTINCT FROM WHERE LE GE EQ NE OR AND LIKE GROUP HAVING ORDER ASC DESC
%right '='
%left AND OR
%left '<' '>' LE GE EQ NE
%%

S	: ST1';' {printf("INPUT ACCEPTED....");exit(0);};
ST1	: SELECT attributeList FROM tableList ST2
	| SELECT DISTINCT attributeList FROM tableList ST2
	;
ST2	: WHERE COND ST3
	| ST3
	;
ST3	: GROUP attributeList ST4
	| ST4
	;
ST4	: HAVING COND ST5
	| ST5
	;
ST5	: ORDER attributeList ST6
	|
	;
ST6	: DESC
	| ASC
	|
	;
attributeList	:	ID','attributeList
	| '*'
	| ID
	;
tableList	: ID',' tableList
	| ID
	;
COND	: COND OR COND
	| COND AND COND
	| E
	;
E	: F '=' F
	| F '<' F
	| F '>' F
	| F LE F
	| F GE F
	| F EQ F
	| F NE F
	| F OR F
	| F AND F
	| F LIKE F
	;
F	: ID 
	| NUM
	;
%%
#include "lex.yy.c"
#include <ctype.h>
int main()
{
	printf("Enter the query:");
	yyparse();
}
int yyerror(char *s) {;}/*implicit syntax error*/ 

