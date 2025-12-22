#include "gs.h"
#include <string.h>
#include <stdio.h>

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
 if( ( !strcmp(stiva,"") && strcmp(input,"") ) ||
     ( strcmp(stiva,"") && !strcmp(input,"") ))
	return False;
 if ( strlen(stiva) > strlen(input))
	return False;
 char sir[15];
 strncpy(sir,strrev(stiva),1);
 strrev(stiva);
 sir[1]='\0';
 if( ! is_member(sir,term)){ // este un neterminal
	strcat(sir,"q");
	while( reguli != NULL){
		if( !strcmp(reguli->car,sir)){
			//am identificat o regula aplicabila
			char sir1[15];
			strncpy(sir1,stiva,strlen(stiva)-1);
			sir1[strlen(stiva)-1]='\0';
			strncat(sir1,reguli->cdr,strlen(reguli->cdr)-1);
			char *stivanoua=makesir(sir1);
			char *inputnou=makesir(input);
			tiparire_situatie(stivanoua,inputnou,reguli);
			if ( acceptare(stivanoua,stare,inputnou,reg,term))
				return True;
			printf("\n                                          Eroare");
			}
		reguli = reguli->urm;
		}
	return False;
	}
 // este terminal
 strcat(sir,"q");
 strncat(sir,input,1);
 while( reguli != NULL){
	if( !strcmp(reguli->car,sir)){
		//am identificat o regula aplicabila
		char sir1[15];
		strncpy(sir1,stiva,strlen(stiva)-1);
		sir1[strlen(stiva)-1]='\0';
		char *stivanoua=makesir(sir1);
		char *inputnou=makesir(input+1);
		printf("\n     %-15sq   %-15s",stivanoua,inputnou);
		printf("   Acceptare lexem");
		if(acceptare(stivanoua,stare,inputnou,reg,term))
			return True;
		printf("\n                                          Eroare");
		}
	reguli = reguli->urm;
	}
 return False;
 }

