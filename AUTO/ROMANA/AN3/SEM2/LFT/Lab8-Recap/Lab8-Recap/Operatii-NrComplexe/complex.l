%option noyywrap
%{
#define YYSTYPE complex

#include <stdio.h>
#include <stdlib.h>
void RmWs(char* str);
%}
op [-+*/()]
ws [ \t]+
digits [0-9]
number (0|[1-9]+{digits}*)\.?{digits}*
im [i]
complexnum {ws}*[-]*{ws}*{number}{ws}*[+|-]{ws}*{number}{ws}*{im}{ws}*
%%
{complexnum} {RmWs(yytext); sscanf(yytext,"%lf %lf",&(yylval.real),&(yylval.img)); return CNUMBER;}
{op}|\n {return *yytext;}
{ws} 	{ ;} 
. 	{ ;}
%%

/* stergere spatii din string   */
void RmWs(char* str) {
  int i = 0, j = 0;
  char temp[strlen(str) + 1];
  strcpy(temp, str);
  while (temp[i] != '\0') {
    while (temp[i] == ' ')
      i++;
    str[j] = temp[i];
    i++;
    j++;
  }
 str[j] = '\0';
}

