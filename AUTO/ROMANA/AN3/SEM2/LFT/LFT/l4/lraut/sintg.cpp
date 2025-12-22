#include <stdio.h>
#include <string.h>
#include <alloc.h>
#include "gs.h"

// Alocator de memorie pentru siruri

char *makesir(char *s)
{ char *p;
  return strcpy(p=(char *)malloc(strlen(s)+1),s);
}

// Extrage dintr-un fisier componentele regulilor gramaticii

char * getsymb(FILE *f)
{ char c=' ';
  char id[20];
  char *sir;
  int k=0;
  while( c == ' ' || c == '\t' || c == '\n') c=getc(f);
  if(c != EOF){
	while(c != ' ' && c != '\t' && c != '\n'){
		id[k++]=c;
		c=getc(f);
		}
	id[k++]='\0';
	sir = makesir(id);
	return sir;
	}
  else return NULL;
  }

char *  umplestruct(FILE *f,prod *pu)
  {
  prod *q;
  char *sir;
  char * start = makesir(getsymb(f));
  while((sir = getsymb(f)) != NULL){
	pu->car=makesir(sir);
	(void)getsymb(f); //extragere ->
	sir = getsymb(f);
	pu->cdr=makesir(sir);
	pu->urm=new prod;
	q=pu;
	pu=pu->urm;
	}
  q->urm=NULL;
  delete pu;
  return start;
  }

void  tipstruct(prod *q)
  {
   while(q != NULL){
	printf("%s -> ",q->car);
	printf("%s\n",q->cdr);
	q=q->urm;
	}
   }