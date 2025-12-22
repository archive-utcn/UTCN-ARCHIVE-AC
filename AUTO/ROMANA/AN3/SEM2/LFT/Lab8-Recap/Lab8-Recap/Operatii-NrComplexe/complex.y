%{
#include <stdio.h>
#include <stdlib.h>
//s-a definit structura de nr. complex in "complex.h"
#include "complex-struct.h"
/*  prototipuri */ 
complex complex_add(complex, complex);
complex complex_sub(complex, complex);
complex complex_mul(complex, complex);
complex complex_div(complex, complex);
%}
%token CNUMBER
%left '+' '-'
%left '*' '/'
%nonassoc '(' ')'
%%
input: /* empty */ 
     | input line
     ;

line: '\n'
    | complexAddSub '\n' {
        if ($1.img != 0)
          printf("%f%+fi\n", $1.real, $1.img);
        else
          printf("%f\n", $1.real);
      }
    ;

complexAddSub: complexAddSub '+' complexMulDiv {$$ = complex_add($1, $3);}
             | complexAddSub '-' complexMulDiv {$$ = complex_sub($1, $3);}
             | complexMulDiv {$$ = $1;}
             ;
             
complexMulDiv: complexMulDiv '*' complexParenthesis {$$ = complex_mul($1, $3);}
             | complexMulDiv '/' complexParenthesis {$$ = complex_div($1, $3);}
             | complexParenthesis {$$ = $1;}
             ;
             
complexParenthesis: '(' complexAddSub ')' {$$ = $2;}
                  | CNUMBER {$$ = $1;}
                  ;
/* end:  Add your grammar rules and actions here */
%%
#include "lex.yy.c"
int main() {
  return yyparse();
}

int yyerror(const char* s) { 
  printf("%s\n", s); 
  return 0; 
}
/* Adunare: (2+3i)+(3+5i) */
complex complex_add (complex c1, complex c2) {
  complex c3;
  c3.real = c1.real + c2.real;
  c3.img = c1.img + c2.img;
  return c3;
}
/* Scadere: (2+3i)+(3+5i) */
complex complex_sub (complex c1, complex c2) {
  complex c3;
  c3.real = c1.real - c2.real;
  c3.img = c1.img - c2.img;
  return c3;
}
/* Inmultire (2+3i)*(3+5i) */
complex complex_mul (complex c1, complex c2) {
  complex c3;
  c3.real = c1.real*c2.real - c1.img*c2.img;
  c3.img = c1.img*c2.real + c1.real*c2.img;
  return c3;
}
/* Impartire (2+3i)*(3+5i) */
complex complex_div (complex c1, complex c2) { 
  complex c3;
  double d;
  /* conjugat c2*/
  d = c2.real*c2.real + c2.img*c2.img;
  c3.real = (c1.real*c2.real + c1.img*c2.img) / d;
  c3.img = (c1.img*c2.real - c1.real*c2.img) / d;
  return c3;
}

