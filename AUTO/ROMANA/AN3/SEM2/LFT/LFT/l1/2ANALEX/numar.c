// FISIERUL: numar.c
#include "lex.h"
#include "afisare.h"
extern char carurm();
extern void eroare(char *s, char *p);

numar()
{    register char *pn;   register c, baza;
     int ub, maxcifre, expvazut, lexem, ncifre;
     char *sintn;   char cc;
     ub=1;   sintn = "Sintaxa numar";
     valcl=0;  baza=10;  maxcifre=0;  ncifre=0;
     pn=tampnum;  lexem=CON;  expvazut=0;
     if( (c=carurm()) == '0' )  baza=8;
     for( ; ; c=getchar() )  {
          afis1;
          *pn++ = c;
          if( tabc[c]==DIGIT  || (baza==16) && ('a'<=c&&c<='f' ||
                                             'A'<=c&&c<='F') )  {
               if(baza==8)  valcl <<=3;
               else if(baza==10) valcl=((valcl<<2) + valcl)<<1;
               else  valcl <<= 4;   /* baza == 16*/
               if(tabc[c]==DIGIT)  c -= '0';
               else if(c>='a')  c -= 'a' - 10;   /* c=c-'a'+10 */
               else  c -= 'A' - 10;
               valcl += c;
               ncifre++;
               if(c>maxcifre)  maxcifre = c;
               continue;
          }
          if(c=='.') {
               if(baza==16 || lexem==FCON)  eroare(sintn,NULL);
               lexem=FCON;  baza=10;  continue;
          }
          if(ncifre==0) {  lexem=DOT;  break;  }
          if( (c=='e'||c=='E') && expvazut==0 )  {
               expvazut++;  lexem=FCON;
               if(baza==16 || maxcifre>=10)  eroare(sintn,NULL);
               baza=10;
               *pn++ = c = getchar();
               afis(cc,c);
               if( c!='+' && c!='-' && tabc[c]!=DIGIT)  break;
          }
          else if(c=='x' || c=='X') {
               if(baza!=8 || valcl!=0 || lexem!=CON) eroare(sintn,NULL);
               baza=16;
            }
          else if( (c=='l' || c=='L') && lexem==CON) {
                    c = getchar();  afis(cc,c);
                    lexem=LCON;     break;
            }
          else  break;
      }
     cascuns=c;
     if(maxcifre>=baza) eroare(sintn,NULL);
     if(lexem==FCON)  { pn[-1] = 0;  valc=pn-tampnum;  return(FCON); }
     if(lexem==CON && (valcl<0||valcl>MAXINT&&baza==10||(valcl>>1)>MAXINT) )
               lexem = LCON;
     valc=valcl;
     return(lexem); 
}
