#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <string.h>

typedef struct NOD{
                    char inf;
                    struct NOD *urm;
                    struct NOD *pred;
                    }nod;
nod *a=0;
nod *prim=0;
nod *q,*p;
char s[100];
int k,i;

int adaugare(char b)
{
    if (prim==NULL)
    {
        a=(nod *)malloc(sizeof(nod));
        a->inf=b;
        a->urm=0;
        a->pred=0;
        prim=a;
    }
    else
        {
            p=(nod *)malloc (sizeof(nod));
            p->inf=b;
            p->urm=0;
            p->pred=prim;
            prim->urm=p;
            prim=p;
        }
}

int stergere()
{
    prim=prim->pred;
}

int verificare(char b)
{
    if (prim==NULL) k=0;
    else
        if (prim->inf==b) stergere();
        else k=0;
}


int main()
{
    strcpy(s,"4*{3+2}-([)");
  k=1;
   for(i=0;i<strlen(s);i++){if(k==1){
                              if (s[i]=='(') adaugare('(');
                              if(s[i]=='[') adaugare('[');
                              if(s[i]=='{') adaugare('{');
                              if(s[i]==')') verificare('(');
                              if(s[i]==']') verificare('[');
                              if(s[i]=='}') verificare('{');
                                }
                            }
if(prim!=0) k=0;
if (k==0)printf("Parantezele sunt puse incorect \n");
    else printf("Parantezele sunt puse corect \n");
}

