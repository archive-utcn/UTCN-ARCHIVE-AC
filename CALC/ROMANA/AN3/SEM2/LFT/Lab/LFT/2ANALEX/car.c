//FISIERUL: car.c
#include "lex.h"
#include "afisare.h"
char numefis[64], tamplex[NCPS+2], tampnum[64];
TABDISP tabdisp[DDISP], *lexc;
int lexascuns = -1, cascuns, eof, linie, valc, nerori, disputil;
long valcl;

int carurm()
{     register cc,c;
      if( (c = cascuns) == 0 )  {  c=getchar();  afis(cc,c); }
      if( c=='\t' || c=='\f' )  c=' ';
      else if(c=='\n')  linie++;
      cascuns=c;
      return(c);  
}

void eroare(char *s, char *p)
{     nerori++;
      fprintf(stderr, "       LINIA %d: ", linie);
      fprintf(stderr, s, p);  fprintf(stderr, "\n");
      return; 
}

char tabc[]= {
EOFC,   INSERT, UNKN,    UNKN,   UNKN,   UNKN,   UNKN,   UNKN,
UNKN,   SPACE,  NEWLN,   SPACE,  SPACE,  UNKN,   UNKN,   UNKN,
UNKN,   UNKN,   UNKN,    UNKN,   UNKN,   UNKN,   UNKN,   UNKN,
UNKN,   UNKN,   UNKN,    UNKN,   UNKN,   UNKN,   UNKN,   UNKN,
SPACE,  EXCLA,  DQUOTE,  SHARP,  UNKN,   MOD,    AND,    SQUOTE,
LPARN,  RPARN,  TIMES,   PLUS,   COMMA,  MINUS,  PERIOD, DIVIDE,
DIGIT,  DIGIT,  DIGIT,   DIGIT,  DIGIT,  DIGIT,  DIGIT,  DIGIT,
DIGIT,  DIGIT,  COLON,   SEMI,   LESS,   ASSIGN, GREAT,  QUEST,
UNKN,   LETTER, LETTER,  LETTER, LETTER, LETTER, LETTER, LETTER,
LETTER, LETTER, LETTER,  LETTER, LETTER, LETTER, LETTER, LETTER,
LETTER, LETTER, LETTER,  LETTER, LETTER, LETTER, LETTER, LETTER,
LETTER, LETTER, LETTER,  LBRACK, BSLASH, RBRACK, EXOR,   LETTER,
UNKN,  LETTER,  LETTER,  LETTER, LETTER, LETTER, LETTER, LETTER,
LETTER, LETTER, LETTER,  LETTER, LETTER, LETTER, LETTER, LETTER,
LETTER, LETTER, LETTER,  LETTER, LETTER, LETTER, LETTER, LETTER,
LETTER, LETTER, LETTER,  LBRACE, OR,     RBRACE, COMPL,  UNKN };
