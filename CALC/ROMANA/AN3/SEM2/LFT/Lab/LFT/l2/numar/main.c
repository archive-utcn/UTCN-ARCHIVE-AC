/************************/
/*	lex.c		*/
/************************/
#include "lex.h"

extern void eroare(char *s, char *p);
extern int lexem();

void main(int argc, char *argv[])
{  register int l, n;
   linie=1;
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
   while( (l=lexem()) != 0 ) {
      printf(" %d", l);  n++;
      switch(l) {
      case CON :	printf("CON(valc=%o)",valc);     break;
      case LCON:	printf("LCON(valcl=%ld)",valcl);   break;
      case FCON:	printf("FCON(tampnum=%s)",tampnum);  break;
      }
      putchar('\n');
   }
}