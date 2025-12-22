/ª                EVOL±     LL1.CPÐ              */

/*   P = { A -> v = A | E ,
	   E -> E+T | E-T | T,
	   T -> T*F | T/F | F,
	   F -> n | v | -F | (A) }
					PRIM 		URMA

     P' = { A -> v = A | E,          	{ n,v,-,( }	{ ),# }
	    E -> T | TC                 { n,v,-,( }     { ),# }
	    C -> +T | +TC | -T | -TC    { +,- } 	{ ),# }
	    T -> F | FD			{ n,v,-,( }	{ +,-,),# }
	    D -> *F | *FD | /F | /FD    { *,/ }		{ +,-,),# }
	    F -> n | v | -F | (A)       { n,v,-,( }     { +,-,*,/,),# }

	n	v	+	-	*	/	=	(	)

A	E     v=A|E		E				E
E     T|TC    T|TC	      T|TC			       T|TC
C		     +T|+TC  -T|-TC
T     F|FD    F|FD            F|FD            		       F|FD
D				     *F|*FD  /F|/FD
F	n	v	       -F			       (A)

									*/

#include <stdio.h>
#include <ctype.h>
#include <signal.h>
#include <setjmp.h>

#define 	NUMAR		01
#define		VAR		02
#define		PLUS		04
#define		MINUS		010
#define		STEA            020
#define		SLASH		040
#define		PARS		0100
#define		PARD		0200
#define		ATRIB		0400
#define		NL		01000
#define		PRIMC		(PLUS|MINUS)
#define		PRIMD		(STEA|SLASH)
#define		PRIMF		(NUMAR|VAR|MINUS|PARS)
#define		URMAE		(PARD|NL)
#define		URMAT		(PLUS|MINUS|PARD|NL)
#define		URMAF		(PLUS|MINUS|STEA|SLASH|PARD|NL)

.PAŠ/ª            EVOL±        LL1.CPÐ              */

double mem[26];		// pentru memorarea valorii variabilelor literare
union{
	double val;
	int index;	// index in mem[]
	}vlexem;

int lexem,lexurm = -1, linie = 1;
char *cmd; 	// pointer comanda
jmp_buf	start;

// declaratii functii
int lex(void);		// analizorul lexical
double erexec(char *);
void fpe(int);
void eroare(char *);
double A(int),E(int),C(int,double),T(int),D(int,double),F(int);
void test(int);

void main(int argc,char *argv[])
{
  cmd=argv[0];
  setjmp(start);     	//   setare buffer start
  signal(SIGFPE,fpe);	//   armare semnal depasire binara
  while( lex() )
	if (lexem != NL)
		printf("\t%.8g\n",A(0));
}

.PAŠ/ª                   EVOL±      LL1.CPÐ             */

int lex(void)
{  int c;
   if(lexurm >= 0){ 	// consum lexemul memorat, nu extrag din fisier
	lexem = lexurm; lexurm = -1;
	return lexem;
	}
   while((c=getchar()) == ' ' || c == '\t');
   if (c == EOF)
	return lexem = 0;
   if ( c == '.' || isdigit(c)){
	ungetc(c,stdin);scanf("%lf",&vlexem.val);
	return lexem=NUMAR;
	}
   if(islower(c)){
	vlexem.index=c-'a';
	return lexem=VAR;
	}
   switch(c){
	case '+' :	lexem=PLUS; break;
	case '-' :	lexem=MINUS; break;
	case '*' :	lexem=STEA; break;
	case '/' :	lexem=SLASH; break;
	case '(' :	lexem=PARS; break;
	case ')' :	lexem=PARD; break;
	case '=' :	lexem=ATRIB; break;
	case '\n' :	lexem=NL; linie++; break;
	default :	lexem = 0;
	}
   return lexem;
}

double erexec(char *s)
{ eroare(s); longjmp(start,0); return 0.0; }

void fpe(int i)
{ eroare("eroare aritmetica"); longjmp(start,0); }

void eroare(char *s)
{ fprintf(stdout,"%s %s linia %d\n",cmd,s,linie);}

#ifdef DEPAN

char *ind="                               ";
void tras(int i,char nt,double v)
{ printf("%s%c %.8g /%o/%o\n",ind+40-i,nt,v,lexurm,lexem);}

#else

#define	 tras(i,nt,v)

#endif

Š/ª                 EVOL±     LL1.CPÐ            */

double	A(int k)
{  int i;					tras(k,'A',0);
   if( lexem == VAR){
	i=vlexem.index;
	if(lex() == ATRIB){
		lex();
		return mem[i] = A(k+2);
		}
	lexurm=lexem;  // refacere lexem
	lexem=VAR;
	vlexem.index=i;
	}
   return E(k+2);
}

double E(int k)
{  double t;					tras(k,'E',0);
   t=T(k+2);
   if(lexem &PRIMC)
	return C(k+2,t);
   test(URMAE);					tras(k,'E',t);
   return t;
}

double C(int k,double v)
{  int opr;
   double t,e;					tras(k,'C',v);
   opr=lexem;
   lex();
   t=T(k+2);
   e=opr==PLUS ? v+t : v-t ;
   if (lexem & PRIMC)
	return C(k+2,e);
   test(URMAE);					tras(k,'C',e);
   return e;
}

double T(int k)
{  double f;					tras(k,'T',0);
   f=F(k+2);
   if(lexem & PRIMD)
	return D(k+2,f);
   test(URMAT);					tras(k,'T',f);
   return f;
}
.PAŠ/ª               EVOL±      LL1.CPÐ             */

double D(int k,double v)
{  int opr;
   double f,t;					tras(k,'D',v);
   opr=lexem;
   lex();
   f=F(k+2);
   t= opr==STEA ? v*f : f != 0.0 ? v/f : erexec("impartire cu zero");
   if(lexem & PRIMD)
	return D(k+2,t);
   test(URMAT);					tras(k,'D',t);
   return t;
}

double F(int k)
{  double n;					tras(k,'F',0);
   test(PRIMF);
   switch(lexem){
	case NUMAR : n=vlexem.val; lex(); break;
	case VAR   : n=mem[vlexem.index]; lex(); break;
	case MINUS : lex(); n= -F(k+2); break;
	case PARS  : lex(); n= A(k+2); test(PARD); lex(); break;
	}
   test(URMAF);					tras(k,'F',n);
   return n;
}

void test(int s)
{
  if( !(lexem & s)){
	eroare("eroare sintactica in expresie");
	while( !(lexem & s))
		lex();
	}
}