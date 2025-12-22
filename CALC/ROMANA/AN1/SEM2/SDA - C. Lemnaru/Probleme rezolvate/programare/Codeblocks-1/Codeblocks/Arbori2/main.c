#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

typedef struct nod{
	 char inf;
	 struct nod *st, *dr, *urm;
	} NOD;
NOD *arbore;

void preordine(NOD* rad)
{
 if(rad)
 {
  printf("%c",rad->inf);
  preordine(rad->st);
  preordine(rad->dr);
 }
}

void inordine(NOD* rad)
{
 if(rad)
 {
  inordine(rad->st);
  printf("%c",rad->inf);
  inordine(rad->dr);
 }
}

void creare(char *s, NOD **arbore){
 NOD *top = NULL;
 int i;
 for( i=0;i<strlen(s);i++ ){
  while(('0'<=s[i] && s[i]<='9') || ('a'<=s[i] && s[i]<='z') )
  {
   NOD *p = (NOD *) malloc(sizeof(NOD));
   p->inf = s[i];
   i++;
   p->st = p->dr = NULL;
   p->urm = top;
   top = p;
  }
  NOD *ps, *pd;
  NOD *pr =  (NOD *) malloc(sizeof(NOD));
  pd = top;
  ps = top->urm;
  pr->st = ps;
  pr->dr = pd;
  pr->inf = s[i];
  top = top->urm->urm;
  pr->urm = top;
  top = pr;
 }
 *arbore = top;
}


double rezultat(NOD *rad)
{
 if(!rad) return 0;

 switch(rad->inf)
 {
  case '+' : return rezultat(rad->st) + rezultat(rad->dr);
  case '-' : return rezultat(rad->st) - rezultat(rad->dr);
  case '/' : return rezultat(rad->st) / rezultat(rad->dr);
  case '*' : return rezultat(rad->st) * rezultat(rad->dr);
  default :  return rad->inf - '0';
 }
}

int main()
{
 double a;
 char s[101];
 printf("Expresia in forma postfixa este:\n");
 gets(s);
 creare(s,&arbore);
 printf("Expresia in forma genrala:\n");
 inordine(arbore);
 printf("\n");
 a=rezultat(arbore);
 printf("\n4.2%lf\n",a);
}
