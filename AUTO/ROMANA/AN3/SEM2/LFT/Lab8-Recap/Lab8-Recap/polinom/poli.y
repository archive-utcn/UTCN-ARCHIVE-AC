// rulare LINUX: 
// yacc -d poli.y && lex poli.l && gcc *.c && ./a.out <in.txt >rezultat.txt
// se compileaza ambele fisiere c la gcc *.c cand se foloseste y.tab.h 
// y.tab.h se obtine din compilarea yccc -d poli.y
%{
#include <stdio.h>
%}
%union {
int nr;
int sir[10];
}
%token VAR
%token <nr> NUMBER
%type <sir> expresie monom
%left '+' '-'%%
program : program expresie '\n' { tipareste($2); }
| program '\n'
| /* null */
;
polinom : '(' monoame ')'
	;
monoame : monom
	| monoame '+' monoame
	| monoame '-' monoame
	;
expresie : monom
	| expresie '+' expresie { aduna($$, $1, $3);}
	| expresie '-' expresie { scade($$, $1, $3);}
	| '(' expresie ')' { int i; for(i = 0; i < 10; i++)$$[i] =$2[i];}
	;

monom : NUMBER '*' VAR '^' NUMBER	{ init($$); $$[$5] = $1;}
	| VAR '^' NUMBER	{ init($$); $$[$3] = 1; }
	| NUMBER '*' VAR	{ init($$); $$[1] = $1; }
	| NUMBER		{ init($$); $$[0] = $1; }
	| VAR			{ init($$); $$[1] = 1; }
	;
%%
void init(int x[10]){int i; for(i = 0; i < 10; i++)x[i] = 0;}

void aduna(int x[10], int y[10], int z[10])
{int i; for(i = 0; i < 10; i++)x[i] = y[i] + z[i];}

void scade(int x[10], int y[10], int z[10])
{int i; for(i = 0; i < 10; i++)x[i] = y[i] - z[i];}

void tipareste(int x[10])
{int i; printf("\nCoeficientii polinomului rezultat:\n");
for(i = 0; i < 10; i++)
if(x[i] != 0)
printf("%d*X^%d\t", x[i], i);
}

int main(){
printf("Primele doua sunt reprezentarile polinoamelor initiale:\n");
yyparse();}
yyerror(char *s) { printf("%s\n", s); }
