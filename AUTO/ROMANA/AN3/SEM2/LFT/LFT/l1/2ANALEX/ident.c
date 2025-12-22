// FISIERUL: ident.c

#include "lex.h"

struct tabcc {    char *numecc;
                  int valcc;
} tabcc[] = {            "int",INT,              "char",CHAR,       
"float",FLOAT,           "double",DOUBLE,        "struct",STRUCT,   
"long",LONG,             "unsigned",UNSIGN,      "union",UNION,           
"short",INT,             "auto",AUTO,            "extern",EXTERN,
"static",STATIC,         "register",REG,         "goto",GOTO,       
"return",RETURN,         "if",IF,                "while",WHILE,     
"else",ELSE,             "switch",SWITCH,        "case",CASE,             
"break",BREAK,           "continue",CONTIN,      "do",DO,                 
"default",DEFAULT,       "for",FOR,              "sizeof",SIZEOF,         
"typedef",TYPEDEF,       "enum",ENUM,            0,0,};

inidisp()
{     register struct tabcc *p;  register char *ps;   register i;
      disputil=0;
      for( p=tabcc; ps=p->numecc; p++ )  { i=0;  disputil++;
                                            while( *ps )  i += *ps++;
                                            tabdisp[i%DDISP].semd = FKEYW;
     }return;  }

ident()
{     int idisp;
      register struct tabdisp *p;  register char *pl, *pn;
      idisp=0;   pl=tamplex;
      while( pl < tamplex+NCPS )  idisp += *pl++&0177;
      p = &tabdisp[idisp%DDISP];
      if( p->semd&FKEYW )  if( cautcc() )  return(KEYW);
      while( *(pn = p->nume) ) {
            for( pl=tamplex; pl<tamplex+NCPS; )
	      if( *pn++ != *pl++ )  goto nu;  // coliziune
            lexc = p;
            return(NAME);
nu:         if( ++p >= &tabdisp[DDISP] )  p = tabdisp;
      }
      if( ++disputil >= DDISP )  {
            eroare("Depasire tabel de dispersie",NULL);
            exit(1);
      }
      pl=tamplex;
      for( pn=p->nume; pl<tamplex+NCPS; )  *pn++ = *pl++;
      lexc = p;
      return(NAME);
}

cautcc()
{     register struct tabcc *p; register char *p1, *p2;
      for( p=tabcc; p2=p->numecc; p++ )  {
            p1 = tamplex;
            while( *p1 == *p2++ )
                  if( *p1++ == '\0' ) {    valc = p->valcc;
                                           return(1);
      }           }
      return(0);
}
