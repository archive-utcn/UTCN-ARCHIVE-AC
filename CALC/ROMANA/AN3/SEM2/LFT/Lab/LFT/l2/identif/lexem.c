/************************/
/*	lexem.c		*/
/************************/

#include <stdio.h>
#include "lex.h"
extern void eroare(char *s, char *p);
extern int ident();

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
		   if( ccc == '\n' ) ccc=' ';
		   printf("<%c>",ccc);
		   goto bucla;
      case LETTER: ps=tamplex;
		   while(tabc[c]==LETTER || tabc[c]==DIGIT)  {
		      if(ps < tamplex+NCPS)  *ps++ = c;
		      /*se consuma toate caracterele simbolului */
		      /*desi se pastreaza doar primelå NCPS     */
		      ccc=c=getchar();
		      if(ccc == '\n') ccc=' ';
		      printf("<%c>",ccc);
		   }
		   while(ps < tamplex+NCPS)  *ps++ = '\0';
		   cascuns=c;
		   if( (c=ident())==KEYW && valc==SIZEOF )
		      c=SIZEOF;
		   return(c);
      case UNKN  : eroare("Caracter necunoscut",NULL);
		   ccc=c=getchar();
		   if(ccc == '\n') ccc=' ';
		   printf("<%c>",c);
		   goto bucla;
      }
      return(tabc[c]);
}
