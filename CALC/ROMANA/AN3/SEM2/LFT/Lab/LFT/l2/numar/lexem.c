/************************/
/*	lexem.c		*/
/************************/
#include "lex.h"
extern void eroare(char *s, char *p);
extern int numar();

lexem()
{     register c;
      char ccc;
      register char *ps;
      register liniet;
      if(lexascuns >= 0) {
	 c = lexascuns;
	 lexascuns = -1;
	 return(c);
      }
      if(cascuns) { c = cascuns;  cascuns = 0;  }
      else
	 if(eof)  return(EOFC);
	 else  { ccc=c=getchar();
		 if( ccc == '\n' ) ccc=' ';
		 printf("<%c>",ccc);
	 }

bucla:
      if(c==EOF) {  eof++;  return(EOFC);  }
      switch(tabc[c]) {
      case NEWLN : linie++;
      case SPACE : ccc=c=getchar();
		   if( ccc== '\n' ) ccc=' ';
		   printf("<%c>",ccc);
		   goto bucla;
      case PERIOD:
      case DIGIT : cascuns=c;
		   return( numar() );
      case UNKN  : eroare("Caracter necunoscut",NULL);
		   ccc=c=getchar();
		   if( ccc== '\n' ) ccc=' ';
		   printf("<%c>",ccc);
		   goto bucla;
      }
      return(tabc[c]);
}
