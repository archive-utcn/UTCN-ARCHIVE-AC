//FISIERUL: open_dis.cpp
// contine definitiile functiilor obiectului hash

#include "def1.cpp"
#include <iostream.h>
#include <string.h>
#include <alloc.h>

//constructor
hash::hash()
{ D = 11;
 for(int i=0;i<D;i++)
     tabela_dispersie[i]=NULL;
}
// definitiile functiilor membru ale clasei hash

int hash::calcul_hash(char *s)
{ register int h;
  for(h=0;*s != '\0'; )
     h += *s++;
  return h%D;
}

char * hash::makesir(char *s)  //alocator memorie
{ char *p;
  return strcpy(p=(char *)malloc(strlen(s)+1),s) ;
}

INTRARE * hash::caut(char *s)
{INTRARE *p;
 for(p=tabela_dispersie[calcul_hash(s)]; p != NULL ; p=p->urm)
     if(!strcmp(s,p->nume))
	       return p;
 return NULL;
 }

INTRARE * hash::install(char *nume,int atribut)
{ INTRARE *p;
  int indice;
  if((p=caut(nume)) == NULL){
     p=new INTRARE;
     p->nume=makesir(nume);
     p->atribut=atribut;
     p->urm=tabela_dispersie[indice=calcul_hash(p->nume)];
     tabela_dispersie[indice]=p;
     }
  else{
     cerr << "Atentie, acest simbol este deja instalat";
     return p;
     }
  }

INTRARE * hash::assign_val(char *nume,int val)
{ INTRARE *p;
  if((p=caut(nume)) == NULL){
     cerr << "Eroare, identificator inexistent" << "\n" ;
     return NULL;
     }
  p->atribut=val;
  return p;
}

int  hash::retrieve_val(char *nume)
{ INTRARE *p;
  if((p=caut(nume)) == NULL){
     cerr << "Eroare, identificator inexistent" ;
     return NULL;
     }
  return p->atribut;
}

void hash::del( char* nume)
{ INTRARE *p,*cap,*ant;
  int indice;
  cap=tabela_dispersie[indice=calcul_hash(nume)];
  if((p=(INTRARE *)caut(nume)) == NULL){
     cerr <<"Eroare, identificator inexistent" ;
     return;
     }
  ant=cap->urm;
  if(cap == p)
     if(ant == NULL){
	       delete p;tabela_dispersie[indice]=NULL;
	       return;
	       }
     else{
	       delete p;tabela_dispersie[indice]=ant;
	       return;
               }
  ant=cap;
  while(ant->urm != p)
               ant=ant->urm;
  ant->urm=p->urm;
  delete p;
  return;
}

void hash::print_tab_disp(void)
{INTRARE *p;
 for(int i=0 ; i<D ; i++)
               if(tabela_dispersie[i])
               for(p=tabela_dispersie[i];p;p=p->urm)
                   cout << i << '\t' << p->nume << '\t' << p->atribut
<< '\n';}
