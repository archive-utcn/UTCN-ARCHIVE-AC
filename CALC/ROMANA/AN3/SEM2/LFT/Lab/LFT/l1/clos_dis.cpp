//FISIERUL: clos_dis.cpp

#include "def2.h"

#include <iostream.h>

#include <string.h>

#include <alloc.h>

//#include <process.h>





//constructor



hash::hash()

{ D = 51;

  cout << "hash:hash() begin";
 LIMITA_INCERCARI = D/2;

 for(int i=0;i<D;i++)

     tabela_dispersie[i].nume=NULL;

  cout << "hash::hash() end";
}



hash::hash(int param)

{ D = param;

  cout << "hash:hash(param) begin\n";

  LIMITA_INCERCARI = D/2;

  if(D > 71){

     cerr << "Dimensiune prea mare pentru tabela\n";

     exit(1);

     }

 for(int i=0;i<D;i++)

     tabela_dispersie[i].nume=NULL;

  cout << "hash::hash(param) end\n";
}





// definitiile functiilor membru ale clasei hash



int hash::calcul_hash(char *s)

{ register int h=0;

  // dorin andreica, oct 12

  if ((s == NULL) || (strlen(s) < 2))
    return 0;

  h+=(*s&017)+(*(s+1)*017);

  h+=strlen(s)*16;

  h=(h&0377); //numar cuprins intre 0 si 255

  return h%D;

}





char * hash::makesir(char *s)

{ char *p;

  return strcpy(p=(char *)malloc(strlen(s)+1),s) ;

}



int hash::aux(int h,int incr) { return h+incr;}



int hash::modif_incr(int incr){ return incr*incr+2*incr+1;}





int hash::caut(char *s)

{register incr,h,nr_incercari=0;

 for(incr=1,h=calcul_hash(s); ; )

     if(!strcmp(tabela_dispersie[h].nume,s))

     return h;

     else{ // coliziune

     h=aux(h,incr);

     incr=modif_incr(incr);

     nr_incercari++;

     while(h > D) h-=D;

     if(nr_incercari > LIMITA_INCERCARI)

	       return (-1);

     }

 }



int hash::install(char *nume,int atribut)

{

 register incr,semaphor,h;

 int nr_incercari=0;

 
 for(incr=1,semaphor=0,h=calcul_hash(nume); !semaphor ; )
 {

      if(tabela_dispersie[h].nume == NULL){

     semaphor=1;

     tabela_dispersie[h].nume = makesir(nume);

     tabela_dispersie[h].atribut=atribut;

     }

     else
   if( ! (semaphor= !strcmp(tabela_dispersie[h].nume,nume))) {

     /* coliziune */

     h=aux(h,incr);

     incr=modif_incr(incr);

     nr_incercari++;

     while(h > D) h-=D;

     if(nr_incercari > LIMITA_INCERCARI){

               cerr << "Nu mai pot insera in tabela de dispersie\n";

               return (-1);

               }

     }
  }
  return nr_incercari;   // PLUS

 }



int hash::assign_val(char *nume,int val)

{ int p;

  if((p=caut(nume)) == -1){

     cerr << "Eroare, identificator inexistent\n" ;

     return NULL;

     }

  tabela_dispersie[p].atribut=val;

  return p;

}





int hash::retrieve_val(char *nume)

{ int p;

  if((p=caut(nume)) == -1){

     cerr << "Eroare, identificator inexistent\n" ;

     return NULL;

     }

  return tabela_dispersie[p].atribut;

}





void hash::print_tab_disp(void)

{

 for(int i=0 ; i<D ; i++)

     if(tabela_dispersie[i].nume)

         cout << i << '\t' << tabela_dispersie[i].nume << '\t' <<

tabela_dispersie[i].atribut << '\n';

}



