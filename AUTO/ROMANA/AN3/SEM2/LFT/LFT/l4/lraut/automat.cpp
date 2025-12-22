#include "gs.h"
#include <string.h>
#include <stdio.h>
//#include <conio.h>

void tiparire_situatie(char *stivanoua,char *input,prod *reguli)
{
 printf("\n     %-15sq   %-15s",stivanoua,input);
 char sir[15];
 strncpy(sir,reguli->car,1);
 sir[1]='\0';
 strcat(sir, " -> ");
 strcat(sir,strrev(reguli->cdr)+1);
 strrev(reguli->cdr);
 printf("   %s",sir);
 getchar();
 }


bool acceptare(char *stiva,char *stare,char *input,prod *reg,set *term)
{
 prod* reguli = reg;
 if( !strcmp(stiva,"") && !strcmp(input,""))
	return True;

 char sir[15];
 while( reguli != NULL){
	strcpy(sir,stiva);
	strcat(sir,"q");
	if( !strcmp(reguli->car,sir+strlen(sir)-strlen(reguli->car))){
		//am identificat o regula aplicabila
		if( !strcmp(reguli->car,"Eq") && strcmp(input,"")){
			reguli = reguli->urm;
			continue;
			}
		char sir1[15];
		if(strlen(sir) > strlen(reguli->car)){
			strncpy(sir1,sir,strlen(sir)-strlen(reguli->car));
			sir1[strlen(stiva)-strlen(reguli->car)+1]='\0';
			}
		else
			strcpy(sir1,"");
		strncat(sir1,reguli->cdr,strlen(reguli->cdr)-1);
		char *stivanoua=makesir(sir1);
		char *inputnou=makesir(input);
		printf("\n     %-15sq   %-15s",stivanoua,inputnou);
		printf("   Reducere");
		getchar();
		if(acceptare(stivanoua,stare,inputnou,reg,term))
			return True;
		printf("\n                                          Eroare");
		}
	reguli = reguli->urm;
	}
 strcpy(sir,"q");
 strncat(sir,input,1);
 reguli = reg;
  while( reguli != NULL){
	if( !strcmp(reguli->car,sir)){
		//am identificat o regula aplicabila
		char sir1[15];
		strcpy(sir1,stiva);
		strncat(sir1,input,1);
		char *stivanoua=makesir(sir1);
		char *inputnou=makesir(input+1);
		printf("\n     %-15sq   %-15s",stivanoua,inputnou);
		printf("   Deplasare");
		getchar();
		if(acceptare(stivanoua,stare,inputnou,reg,term))
			return True;
		printf("\n                                          Eroare");
		}
	reguli = reguli->urm;
	}
 return False;
 }

