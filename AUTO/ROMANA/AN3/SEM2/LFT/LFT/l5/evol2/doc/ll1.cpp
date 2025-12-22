/ª                  EVOL²      LL1.CPÐ             */

/*   P = { A -> v = A | E ,
	   E -> E+T | E-T | T,
	   T -> T*F | T/F | F,
	   F -> K^F | K,
	   K -> n | v | b(A) | -F | (A) }
					PRIM 		URMA

     P' = { A -> v = A | E,          	{ n,v,b,-,( }	{ ),# }
	    E -> T | TC                 { n,v,b,-,( }   { ),# }
	    C -> +T | +TC | -T | -TC    { +,- } 	{ ),# }
	    T -> F | FD			{ n,v,b,-,( }	{ +,-,),# }
	    D -> *F | *FD | /F | /FD    { *,/ }		{ +,-,),# }
	    F -> K | K^F                { n,v,b,-,(}    { +,-,*,/,),# }
	    K -> n | v | b(A) | -F | (A){ n,v,b,-,( }   { +,-,*,/,^,),# }

	n	v	b	+	-	*	/	=	(	)

A	E     v=A|E	E		E				E
E      T|TC    T|TC    T|TC    	       T|TC			       T|TC
C		     	      +T|+TC  -T|-TC
T     F|FD    F|FD     F|FD            F|FD            		       F|FD
D				     	       *F|*FD  /F|/FD
F     K|K^F   K|K^F    K|K^F           K|K^F                           K|K^F
K	n	v	b       	-F			       (A)

									*/

#include <stdio.h>
#include <ctype.h>
#include <signal.h>
#include <setjmp.h>
#include "evol.h"

#define		PRIMC		(PLUS|MINUS)
#define		PRIMD		(STEA|SLASH)
#define		PRIMK		(NUMAR|VAR|PREDEF|MINUS|PARS)
#define		URMAE		(PARD|NL)
#define		URMAT		(PLUS|MINUS|PARD|NL)
#define		URMAF		(PLUS|MINUS|STEA|SLASH|PARD|NL)
#define 	URMAK		(PLUS|MINUS|STEA|SLASH|SAG|PARD|NL)

tiplexem  vlexem;
int lexem,lexurm = -1, linie = 1;
char *cmd; 	// pointer comanda
jmp_buf	start;

// declaratii functii
int lex(void);		// analizorul lexical
void fpe(int);
void eroare(char *);
double A(void),E(void),C(double),T(void),D(double),F(void),K(void),Pow(double,double);
void test(int), init(void);
Š/ª                      EVOL²     LL1.CPÐ         */

void main(int argc,char *argv[])
{
  cmd=argv[0];
  init();
  setjmp(start);     	//   setare buffer start
  signal(SIGFPE,fpe);	//   armare semnal depasire binara
  while( lex() )
	if (lexem != NL)
		printf("\t%.8g\n",A());
}

void avert(char *s,char *t)
{ fprintf(stdout,"%s : %s %s\n",cmd,s,t);}

double erexec(char *s,char *t)
{ avert(s,t); longjmp(start,0); return 0.0; }

void fpe(int i)
{ erexec("eroare aritmetica",(char *)0); }

void eroare(char *s)
{ avert(s, (char *)0 ); }


double	A(void)
{  Simbol *s;
   if( lexem == VAR){
	s=vlexem.sim;
	if(lex() == ATRIB){
		lex();s->tip=VAR;
		return s->u.val = A();
		}
	lexurm=lexem;  // refacere lexem
	lexem=VAR;
	vlexem.sim=s;
	}
   return E();
}

double E(void)
{  double t;
   t=T();
   if(lexem & PRIMC)
	return C(t);
   test(URMAE);
   return t;
}

.PAŠ/ª                EVOL²      LL1.CPÐ            */

double C(double v)
{  int opr;
   double t,e;
   opr=lexem;
   lex();
   t=T();
   e=opr==PLUS ? v+t : v-t ;
   if (lexem & PRIMC)
	return C(e);
   test(URMAE);
   return e;
}

double T(void)
{  double f;
   f=F();
   if(lexem & PRIMD)
	return D(f);
   test(URMAT);
   return f;
}

double D(double v)
{  int opr;
   double f,t;
   opr=lexem;
   lex();
   f=F();
   t= opr==STEA ? v*f : f != 0.0 ? v/f : erexec("impartire cu zero",(char *)0);
   if(lexem & PRIMD)
	return D(t);
   test(URMAT);
   return t;
}


double F(void)
{  double f;
   f=K();
   if(lexem == SAG){
	lex(); return Pow(f,F());
	}
   test(URMAF);
   return f;
}
.PAŠ/ª                 EVOL²        LL1.CPÐ          */

double K(void)
{  double n; Simbol *f;
   test(PRIMK);
   switch(lexem){
	case NUMAR : n=vlexem.val; lex(); break;
	case VAR   : if(vlexem.sim->tip == NEDEF)
				erexec("var. nedef.",vlexem.sim->nume);
		     n = vlexem.sim->u.val; lex(); break;
	case PREDEF: f = vlexem.sim; lex(); test(PARS); lex();
		     n = A(); test(PARD); lex();
		     n=(*(f->u.ptr))(n); break;
	case MINUS : lex(); n= -F(); break;
	case PARS  : lex(); n= A(); test(PARD); lex(); break;
	}
   test(URMAK);
   return n;
}

void test(int s)
{
  if( !(lexem & s)){
	eroare("eroare sintactica in expresie");
	while( !(lexem & s))
		lex();
	}
}