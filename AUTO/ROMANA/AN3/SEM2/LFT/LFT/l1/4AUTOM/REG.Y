/* FISIERUL: reg.y */ 
/* Expresii regulate
      c           orice caracter nespecial
      r*          zero sau mai multe aparitii a expresiei r
      r1r2        r1 urmat de r2
      r1|r2       r1 sau r2
      (r)         expresia regulata r poate fi incuibarita
*/

/* Precedenta operatori */

%term CHAR OR CAT STAR
%left OR
%left CHAR
%left CAT
%left STAR

%{
#include <stdio.h>
#include <process.h>
#include <ctype.h>

#define TRUE 1
#define FALSE 0
#define NOTFOUND -1

char *ind = "                                        ";
char t[3]={'|', '&', '*'};

#define MAXLIN 350
#define MAXSET 400
#define NCHARS 128
#define NSTATES 128
#define FINAL -1
#define NIL 0
#define ITMPSTAT for(count=0,i=1; i<=line; i++) tmpstat[i] = FALSE

typedef int STATE;

char gotofn[NSTATES][NCHARS], out[NSTATES];
STATE state[NSTATES], nstates;

int name[MAXLIN],left[MAXLIN],right[MAXLIN],parent[MAXLIN],follow[MAXLIN];

int line=1,sets[MAXSET],nextset;

char *input,*cmd;

int count,tmpstat[MAXLIN], dflag;

/* Declaratii functii */

void cfollow(int);
void include(int*,int);
void execute(char *);
void prstr(char*,char*,char*);
void prautom(void);
void prtrarr(void);
void prfoll(void);
void prstates(void);

%}

%%

s     :     r     ={ unary(FINAL, $1); line--;}
      ;

r     :     CHAR        ={ $$ = enter($1); }
      |     r OR r          ={ $$ = node(OR,$1,$3);}
      |     r r %prec CAT   ={ $$ = node(CAT,$1,$2);}
      |     r STAR            ={ $$ = unary(STAR,$1);}
      |       '(' r ')'       ={ $$ = $2; }
      |     error
      ;
%%

void yyerror(s)    char *s;
{ fprintf(stderr, "%s: %s\n",cmd,s);
  exit(1);
}
void overflo()
{ fprintf(stderr,"%s: expresie regulata este prea mare",cmd);
  exit(1);
}

yylex(void)
{  register char c;
   switch(c = *input++){
      case '|' : return OR;
      case '*' : return STAR;
      case '(' :
      case ')' : return c;
      case '\0': return 0;
      default  : yylval= c; return CHAR;
      }
}

enter(x)
{ if(line >= MAXLIN)
      overflo();
  name[line]=x; left[line]=right[line]=NIL;
  return line++;
}

node(x,l,r)
{ if(line >= MAXLIN)
      overflo();
  name[line]=x; left[line]=l; right[line]=r;
  parent[l]=parent[r]=line;
  return line++;
}

unary(x,l)
{ if(line >= MAXLIN)
      overflo();
  name[line]=x; left[line]=l; right[line]=NIL;
  parent[l]=line;
  return line++;
}

void cfoll(v)
{  register i;
   if(left[v] == NIL) { /* atom */
      ITMPSTAT;
      cfollow(v);
      include(follow,v);
      }
   else{
      cfoll(left[v]);
      if(right[v] != NIL)
            cfoll(right[v]);
      }
}
void cfollow(v)
{  int p;
   if (v == line)
      return;
   p=parent[v];
   switch(name[p]){
      case STAR: cfirst(v); cfollow(p); return;
      case OR :  cfollow(p); return;
      case CAT : if (v == left[p]) { /* fiul sting */
                  if(cfirst(right[p]))
                        cfollow(p);
                  }
               else
                  cfollow(p);
               return;
      case FINAL : if (!tmpstat[line]){
                        tmpstat[line]=TRUE;
                        count++;
                        }
      return;
      }
}

int cfirst(v)
{ /* TRUE - EMPTY  incluse; FALSE - EMPTY neincluse */
  register b;
  if(left[v] == NIL){ /* atom */
      if(!tmpstat[v]){
            tmpstat[v]=TRUE;count++;
            }
      return FALSE;
      }
  else if(right[v] == NIL) { /* unary : STAR */
      cfirst(left[v]);
      return TRUE;
      }
  else if(name[v] == CAT){
      return cfirst(left[v]) && cfirst(right[v]);
      }
  else{  /* OR */
      b = cfirst(right[v]);
      return cfirst(left[v]) || b;
      }
}

void include(int *array,int n)
{ register i,j,set;
  for(i=0;i<nextset;i+=sets[i]+1){
      if(sets[i] == count){
            for(j=0,set=i+1; j < count; j++)
                  if(!tmpstat[sets[set++]])
                        goto next;
            array[n] = i;
            return;
            }
      next: ;
  }
  if(nextset+count > MAXSET)
      overflo();
  array[n] = nextset;  sets[nextset++] = count;
  for(i=0;i<=line;i++)
      if(tmpstat[i])
            sets[nextset++] = i;
}

void cgotofn()
{  register c,i,k;
   STATE n,s;
   char symbol[NCHARS];
   int set,curnode,num;
   int number,newnode;
   STATE x;
   ITMPSTAT;
   include(state,0);
   if(cfirst(line-1)){
      tmpstat[line]=TRUE;
      count++; out[1]=TRUE;
      }
   include(state,nstates=1);
   if(dflag)
      prstates();
   for(n=s=1;s<=n;s++){
      /* extragere caractere asteptate in s (in symbol[]) */
      for(i=0;i<NCHARS;i++)
            symbol[i]=FALSE;
      num=sets[state[s]];
      for(i=0,set=state[s]+1;i<num;i++,set++){
            curnode = sets[set];
            if((c = name[curnode]) >= 0){
                  if(c < NCHARS)
                        symbol[c] = TRUE;
                  else
                        printf("combinatie ciudata\n");
            }
      }

      /* gotofn[s][0..NCHAR-1] */
      for(c=0;c<NCHARS;c++)
            if(symbol[c]){
                  /* nextstate(s,c) */
                  ITMPSTAT;
                  for(i=0,set=state[s]+1;i<num;i++,set++){
                        curnode=sets[set];
                        if(name[curnode] == c){
                              number=sets[follow[curnode]];
                              newnode=follow[curnode]+1;
                              for(k=0;k<number;k++,newnode++)
                                    if(!tmpstat[sets[newnode]]){
                                          tmpstat[sets[newnode]] = TRUE;
                                          count++;
                                          }
                              }
                  } /* end nextstate */

            if((x=getstate(n)) != NOTFOUND)
                  gotofn[s][c] = x;
            else{
                  if(n >= NSTATES)
                        overflo();
                  include(state,nstates = ++n);
                  if(dflag)   prstates();
                  if(tmpstat[line])
                        out[n]=TRUE;
                  gotofn[s][c]=n;
                  }
            }
      }
}

STATE getstate(n)
{  register i,j,set;
   for(i=0;i <= n; i++){
      if(sets[state[i]] == count){
            for(set = state[i]+1, j=0; j < count; j++)
                  if(!tmpstat[sets[set++]])
                        goto next;
                  return i;
                  }
            next: ;
            }
      return NOTFOUND;
}

void main(int argc, char *argv[])
{ int ac;
  char **av,*w;
  ac=argc; av=argv;
  while(ac-- > 0 )
      printf(" %s",*av++);
  putchar('\n');
  cmd=argv[0];
  while(--argc > 0 && (++argv)[0][0] == '-'){
      w=argv[0]+1;
      while(*w)
            switch(*w++){
                  case 'd' : dflag++; continue;
                  default : goto ext;
                  }
      }
  if(argc < 2){
ext:  fprintf(stderr, "Usage: %s [-d] xreg string\n",cmd);
      exit(1);
      }
  input = *argv++;
  yyparse();
  if(dflag){
      prtrarr();printf("\n\n\n");getch();
      }
  cfoll(line-1);
  if(dflag){
      prfoll();printf("\n\n\n");getch();
      }
  cgotofn();
  if(dflag){
      prautom();printf("\n\n\n");getch();
      }
  execute(*argv);
  exit(0);
}

void execute(char *str)
{  register char *q, *s, *mem;
   register stat;
   mem=str;
   while(*str){
      s=q=str;
      stat=1;
      while(*q){
            if(!(stat = gotofn[stat][*q++&0177]))
                  break;
            if(out[stat])
                  s=q;
            }
      if(s > str || out[1])
            prstr(str,s,mem);
      str++;
      }
}
// functii de tiparire
void prstr(char *p,char *q,char *start);
void prtree(i,n);
void prautom();
void prtrarr(), prfoll(), prstates();
