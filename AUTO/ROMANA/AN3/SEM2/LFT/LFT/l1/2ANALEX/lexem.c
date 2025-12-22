// FISIERUL: lexem.c
#include "lex.h"
#include "afisare.h"

extern void eroare(char *s, char *p);
extern int ident();

lexem()
{     register c;   register char *ps;   char ccc,cc;   register liniet;
      if(lexascuns >= 0) { c = lexascuns;  lexascuns = -1;  return(c); }
      if(cascuns) { c = cascuns;  cascuns = 0;  }
      else if(eof)  return(EOFC);
      else  { c=getchar();  afis(cc,c);  }
bucla:
      if(c==EOF) {  eof++;  return(EOFC);  }
      switch(tabc[c]) {
      case SHARP :if( (c=lexem()) != CON ) {
                        eroare("# ilegal",NULL);
                        return(c);
                  }
                  liniet = valc;
                  while( tabc[cascuns] == SPACE )  {
                        cascuns=getchar();
                        afis(cc,cascuns);
                  }
                  if(cascuns=='"') {
                        ps=numefis;
                        while( (c=mapcar('"')) >= 0 )  *ps++ = c;
                        *ps++ = 0;
                        cascuns = getchar();
                        afis(cc,cascuns);
                        }
                  if(cascuns != '\n' ) {
                        eroare("# ilegal",NULL);
                        while( (ccc=getchar()) != '\n' && eof==0) {
                              afis(cc,ccc);
                        }
                  }
                  cascuns=0;
                  linie=liniet;
                  return( lexem() );
      case INSERT:c=getchar();  /* ignora*/
                  afis(cc,c);
                  goto bucla;
      case NEWLN :linie++;
      case SPACE :c=getchar(); afis(cc,c); goto bucla;
      case PLUS  :return( urmator(c, PLUS, INCBEF) );
      case MINUS :return( urmator(c,urmator('>', MINUS, ARROW), DECBEF) );
      case ASSIGN:c=carurm(); cascuns=0;
                  if( c == '=' ) return(EQUAL);
                  if( c == ' ' ) return(ASSIGN);
                  if( c == '<' || c == '>' ) {
                        if( carurm() != c ) {   lexascuns=tabc[c];
                                                return(ASSIGN);
                       }cascuns=0;
                        return( c == '<' ? ASLSH : ASRSH );
                  }
                  if( tabc[c] >= PLUS && tabc[c] <= EXOR ) {
                     if( carurm() != ' ' && (c=='-' || c=='&' || c=='*') ) {
                        eroare("Avertisment: presupus %c=", c);
                        nerori--;
                    }c = tabc[c];
                     return(c+ASPLUS-PLUS);
                 }cascuns = c;
                  return(ASSIGN);
      case LESS  :if( urmator(c, 0, 1) ) return(LSHIFT);
                  return( urmator('=', LESS, LESSEQ) );
      case GREAT :if( urmator(c, 0, 1) ) return(RSHIFT);
                  return( urmator('=', GREAT, GREATEQ) );
      case EXCLA :return( urmator('=', EXCLA, NEQUAL) );
      case BSLASH:if( urmator('/', 0, 1) ) return(MAX);
                  goto necunoscut;
      case DIVIDE:if( urmator('\\', 0, 1) ) return(MIN);
                  if( urmator('*', 1, 0) ) return(DIVIDE);
                  while( (c=carurm()) != EOFC ) {
                        cascuns=0;
                        if( c=='*' ) {
                              if( carurm() == '/' ) {
                                    cascuns=0;    c=getchar(); 
                                    afis(cc,c);   goto bucla;
                  }     }     }
                  eof++;
                  eroare("Comentariu neterminat",NULL);
                  return(0);
      case PERIOD:
      case DIGIT :cascuns=c;  return( numar() );
      case DQUOTE:return(STRING);
      case SQUOTE:return( constc() );
      case LETTER:ps=tamplex;
                  while(tabc[c]==LETTER || tabc[c]==DIGIT)  {
                        if(ps < tamplex+NCPS)  *ps++ = c;
                        c=getchar(); 
                        afis(cc,c);
		  }
		  while(ps < tamplex+NCPS)  *ps++ = '\0';
                  cascuns=c;
                  if( (c=ident())==KEYW && valc==SIZEOF ) c=SIZEOF;
                  return(c);
      case AND   :return( urmator('&', AND, LOGAND) );
      case OR    :return( urmator('|', OR, LOGOR) );
      case UNKN  :
      necunoscut :eroare("Caracter necunoscut",NULL);
                  c=getchar();   
                  afis(cc,c);   
                  goto bucla;
      }
      return(tabc[c]);
}

int urmator(char c, int a, int b)
{     if ( carurm() != c ) return(a);
      cascuns = 0;
      return(b);
}

int constc()
{     register int c, cc;
      register char *pcc;
      char creal;
      valc=0;  
      pcc=&valc;  cc=0;
      while( (c=mapcar('\'')) >= 0 ) 
            if(cc++ < NCPC)  *pcc++ = c;
      if(cc>NCPC)  eroare("Constanta caracter lunga",NULL);
      if(cc==1) { creal=valc;  valc=creal; }
      return(CON);
}

int mapcar(int ac)
{     register int cc, a, c, n;
      static mascuns;
      c=ac;
      if(a=mascuns)  mascuns=0;
      else  { a=getchar(); afis(cc,a); }
bucla:
      if(a==c)  return(-1);
      switch(a) {
      case '\n' :
      case '\0' : eroare("Sir neterminat",NULL);
                  cascuns=a;
                  return(-1);
      case '\\' : a=getchar(); 
                  afis(cc,a);
                  switch( a ) {
                  case 't' : return('\t');
                  case 'n' : return('\n');
                  case 'b' : return('\b');
                  case 'f' : return('\f');
                  case '0' : case '1' : case '2' : case '3' :
                  case '4' : case '5' : case '6' : case '7' :
                              n=0;  c=0;
                              while( ++c<=3 && '0'<=a && a<='7' ) {
                                    n<<=3;  
                                    n += a-'0';
                                    a=getchar(); 
                                    afis(cc,a);
                              }
                              mascuns=a;
                              return(n);
                  case 'r'  : return('\r');
                  case '\n' : linie++;
                              a=getchar();
                              afis(cc,a);
                              goto bucla;
                  }
      }
      return(a);
}
