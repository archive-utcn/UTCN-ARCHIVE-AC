%{
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include "types.h"
#define YYDEBUG 0
/* prototypes */
nodeType *opr(int oper, int nops, ...);
nodeType *id(int i);
nodeType *con(int value);
void freeNode(nodeType *p);
void yyerror(char *s);

int sym[26]; /* symbol table */

%}

%union {
  int iValue;      /* integer value */
  char sIndex;     /* symbol table index */
  nodeType *nPtr;  /* node pointer */
};

%token <iValue> INTEGER 
%token <sIndex> VARIABLE
%token WHILE IF PRINT
%nonassoc IFX
%nonassoc ELSE

%left GE LE EQ NE '>' '<'
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS

%type <nPtr> statement expr stmt_list

%start      program

%%

program   : function '.'          { exit(0); }
          ;

function  : function statement    { ex($2); freeNode($2); }
          | /* NULL */
          ;
 
statement : ';'                   { $$ = opr(';', 2, NULL, NULL); }
          | expr ';'              { $$ = $1; }
          | PRINT expr ';'        { $$ = opr(PRINT, 1, $2); }
          | VARIABLE '=' expr ';' { $$ = opr('=', 2, id($1), $3); }
          | WHILE '(' expr ')' statement
                 { $$ = opr(WHILE, 2, $3, $5); }
          | IF '(' expr ')' statement %prec IFX
                 { $$ = opr(IF, 2, $3, $5); }
          | IF '(' expr ')' statement ELSE statement
                 { $$ = opr(IF, 3, $3, $5, $7); }
          | '{' stmt_list '}' { $$ = $2; }
          ;

stmt_list : statement
          | stmt_list statement   { $$ = opr(';', 2, $1, $2); }
          ;

expr      : INTEGER               { $$ = con($1); }
          | VARIABLE              { $$ = id($1); }
          | '-' expr %prec UMINUS { $$ = opr(UMINUS, 1, $2); }
          | expr '+' expr         { $$ = opr('+', 2, $1, $3); }
          | expr '-' expr         { $$ = opr('-', 2, $1, $3); }
          | expr '*' expr         { $$ = opr('*', 2, $1, $3); }
          | expr '/' expr         { $$ = opr('/', 2, $1, $3); }
          | expr '<' expr         { $$ = opr('<', 2, $1, $3); }
          | expr '>' expr         { $$ = opr('>', 2, $1, $3); }
          | expr GE expr          { $$ = opr(GE, 2, $1, $3); }
          | expr LE expr          { $$ = opr(LE, 2, $1, $3); }
          | expr NE expr          { $$ = opr(NE, 2, $1, $3); }
          | expr EQ expr          { $$ = opr(EQ, 2, $1, $3); }
          | '(' expr ')'          { $$ = $2; }
          ;

%%

nodeType *con(int value) 
{ 
  nodeType *p; 
  
  /* allocate node */ 
  if ((p = malloc(sizeof(conNodeType))) == NULL) 
    yyerror("out of memory"); 
  /* copy information */ 
  p->type = typeCon; 
  p->con.value = value; 
  return p; 
} 

nodeType *id(int i) 
{ 
  nodeType *p; 
  /* allocate node */ 
  if ((p = malloc(sizeof(idNodeType))) == NULL) 
    yyerror("out of memory"); 
  /* copy information */ 
  p->type = typeId; 
  p->id.i = i; 
  return p; 
} 

nodeType *opr(int oper, int nops, ...) 
{ 
  va_list ap; 
  nodeType *p; 
  size_t size; 
  int i; 

  /* allocate node */ 
  size = sizeof(oprNodeType) + (nops - 1) * sizeof(nodeType*); 
  if ((p = malloc(size)) == NULL) 
    yyerror("out of memory"); 
  /* copy information */
  p->type = typeOpr; 
  p->opr.oper = oper; 
  p->opr.nops = nops; 
  va_start(ap, nops); 
  for (i = 0; i < nops; i++) 
    p->opr.op[i] = va_arg(ap, nodeType*); 
  va_end(ap); 
  
  return p; 
}

void freeNode(nodeType *p) 
{ 
  int i; 

  if (!p) 
    return; 
  if (p->type == typeOpr) { 
    for (i = 0; i < p->opr.nops; i++) 
      freeNode(p->opr.op[i]); 
  } 
  free (p); 
} 

int ex(nodeType *p) 
{ 
  if (!p) 
    return 0; 

  switch(p->type) 
    { 
    case typeCon: return p->con.value; 
    case typeId: return sym[p->id.i]; 
    case typeOpr: switch(p->opr.oper) 
                    { 
		    case WHILE: while(ex(p->opr.op[0])) 
		                   ex(p->opr.op[1]); 
		                return 0; 
		    case IF: if (ex(p->opr.op[0])) 
		                ex(p->opr.op[1]); 
		             else if (p->opr.nops > 2) 
			             ex(p->opr.op[2]); 
		             return 0; 
		    case PRINT: printf("%d\n", ex(p->opr.op[0])); 
		                return 0; 
		    case ';': ex(p->opr.op[0]); 
		              return ex(p->opr.op[1]); 
		    case '=': return sym[p->opr.op[0]->id.i] = ex(p->opr.op[1]); 
		    case UMINUS: return -ex(p->opr.op[0]); 
		    case '+': return ex(p->opr.op[0]) + ex(p->opr.op[1]); 
		    case '-': return ex(p->opr.op[0]) - ex(p->opr.op[1]); 
		    case '*': return ex(p->opr.op[0]) * ex(p->opr.op[1]); 
		    case '/': return ex(p->opr.op[0]) / ex(p->opr.op[1]); 
		    case '<': return ex(p->opr.op[0]) < ex(p->opr.op[1]); 
		    case '>': return ex(p->opr.op[0]) > ex(p->opr.op[1]); 
		    case GE: return ex(p->opr.op[0]) >= ex(p->opr.op[1]); 
		    case LE: return ex(p->opr.op[0]) <= ex(p->opr.op[1]); 
		    case NE: return ex(p->opr.op[0]) != ex(p->opr.op[1]); 
		    case EQ: return ex(p->opr.op[0]) == ex(p->opr.op[1]); 
		    } 
    } 
}

void yyerror(char *s) 
{ 
  fprintf(stdout, "%s\n", s); 
} 

int main(void) 
{
#if YYDEBUG
  yydebug = 1;
#endif
  yyparse();
  return 0; 
}
