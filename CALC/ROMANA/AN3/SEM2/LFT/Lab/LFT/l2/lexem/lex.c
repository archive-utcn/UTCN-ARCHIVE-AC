/****************/
/* 	lex.c	*/
/****************/

#include "lex.h"
#define N 7

extern void eroare(char *s, char *p);
extern int lexem();
extern void inidisp();

void main(int argc, char *argv[])
{  register int l, n;
   if(argc>1)
      if(freopen(argv[1], "r", stdin) == NULL) {
	 eroare("Nu pot deschide fisierul %s (ca intrare)",argv[1]);
	 exit(1);
      }
   if(argc>2)
      if(freopen(argv[2], "w", stdout) == NULL) {
	 eroare("Nu pot deschide fisierul %s (ca iesire)",argv[2]);
	 exit(1);
      }
   inidisp();
   while( (l=lexem()) != 0 ) {
      printf(" %d", l);  n++;
      switch(l) {
      case CON   :  printf("CON(%o)", valc);		break;
      case LCON  :  printf("LCON(%ld)", valc);		break;
      case FCON  :  printf("FCON(%s)", tampnum);		break;
      case STRING:  printf("STRING");
		    putchar('(');
		    punesir();
		    putchar(')');
		    break;
      case NAME  :  printf("NAME(%s)", lexc->nume);		break;
      case KEYW  :  printf("KEYW(%s:%d)", tamplex, valc);	break;
      }
      putchar('\n');
   }
}

punesir()
{  register c;
   while( (c = mapcar('"')) >= 0) ;
   return;
}
