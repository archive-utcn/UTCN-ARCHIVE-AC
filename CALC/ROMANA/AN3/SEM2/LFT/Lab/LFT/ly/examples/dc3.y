%{
#include "header.h"
int variables[26];

%}

%union {
	int ivalue;
	char variable;
	struct nnode *np;
};

%token <ivalue>		INTEGER
%token <variable>	VARIABLE
%token WHILE IF PRINT ELSE
%left GE LE EQ NE '>' '<'
%left '+' '-'
%left '*' '/'

%type <np>	statement expression statementlist simplestatement

%%

program : program statement	{ execute($2); freeall($2); }
	| program error ';'	{ yyerrok; }
	| /* NULL */
	;

statement : simplestatement ';'
          | WHILE '(' expression ')' statement
		{ $$ = node(WHILE, $3, $5); }
	  | IF '(' expression ')' statement ELSE statement
		{ $$ = triple(IF,$3,$5,$7); }
	  | IF '(' expression ')' statement
		{ $$ = triple(IF,$3,$5,NNULL); }
	  | '{' statementlist '}'
		{ $$ = $2; }
          ;

statementlist : statement
              | statementlist statement	{ $$ = node(';', $1, $2); }
              ;

simplestatement : expression
                | PRINT expression		{ $$ = node(PRINT,$2,NNULL); }
	        | VARIABLE '=' expression	{ $$ = node('=', $1, $3); }
	        ;

expression : INTEGER			{ $$ = leaf(INTEGER, $1); }
	   | VARIABLE			{ $$ = leaf(VARIABLE, $1); }
	   | expression '+' expression	{ $$ = node('+', $1, $3); }
	   | expression '-' expression	{ $$ = node('-', $1, $3); }
	   | expression '*' expression	{ $$ = node('*', $1, $3); }
	   | expression '/' expression	{ $$ = node('/', $1, $3); }
	   | expression '<' expression	{ $$ = node('<', $1, $3); }
	   | expression '>' expression	{ $$ = node('>', $1, $3); }
	   | expression GE expression	{ $$ = node(GE, $1, $3); }
	   | expression LE expression	{ $$ = node(LE, $1, $3); }
	   | expression NE expression	{ $$ = node(NE, $1, $3); }
	   | expression EQ expression	{ $$ = node(EQ, $1, $3); }
	   | '(' expression ')'		{ $$ = $2; }
	   ;

%%

static struct nnode *
nalloc()
{
	char *malloc();
	struct nnode *np;

	np = (struct nnode *) malloc(sizeof(struct nnode));
	if (np == NNULL)
		yyerror("Out of Memory");
	return np;
}

static struct nnode *
leaf(type, value)
{
	struct nnode *np = nalloc();

	np->operator = type;
	np->left.value = value;
	return np;
}

static struct nnode *
triple(op, left, right, third)
struct nnode *left, *right, *third;
{
	struct nnode *np = nalloc();

	np->operator = op;
	np->left.np = left;
	np->right.np = right;
	np->third.np = third;
	return np;
}

static
freeall(np)
struct nnode *np;
{
	switch(np->operator) {
	case IF:		/* Triple */
		if(np->third.np != NNULL)
			free(np->third.np);
	/* FALLTHROUGH */
				/* Binary */
	case '+': case '-': case '*': case '/':
	case '<': case '>': case GE: case LE:
	case NE: case EQ:
	case ';':
	case WHILE:
		free(np->LEFT);
	/* FALLTHROUGH */
	case PRINT:		/* Unary */
		free(np->RIGHT);
		break;
	}
	free(np);
}
