//FISIERUL: tabcuv.h

typedef struct{
      char *nume;
      int val;
      }cuvint;
cuvint     tabcuv[]={
     "int",1,       "char",2,       "float",3,
      "double",4,           "struct",5,   "long",6,
     "unsigned",7,    "union",8,           "short",9,
     "auto",10,           "extern",11,  "static",12,
     "register",13, "goto",14,               "return",15,
     "if",16,         "while",17,         "else",18,
     "switch",19,   "case",20,               "break",21,
     "continue",22, "do",23,         "default",24,
     "for",25,       "sizeof",26,  "typedef",27,
     "",0,               };

//FISIERUL: main2.cpp
#include <iostream.h>
//#include "tabcuv.h"
#include "def2.cpp"

void main()
{
  char raspuns;
  int nr_coliziuni = 0; // pentru compararea numarului total de
//  coliziuni ce apar la instalarea aceluiasi set de
//identificatori
// in doua tabele de dimensiuni diferite
   hash hashtable;
  for(int i=0;i<27;i++)
     nr_coliziuni+=hashtable.install(tabcuv[i].nume,
																						    tabcuv[i].val);
  hashtable.print_tab_disp();
  cin >> raspuns; //pt. oprirea ecranului
  hashtable.assign_val("auto",100);
  hashtable.assign_val("else",100);
  hashtable.print_tab_disp();
  cin >> raspuns; //pt. oprirea ecranului
  cout << " Atributul ident. auto are valoarea " <<
hashtable.retrieve_val("auto") << '\n';
  cout << " Atributul ident. while are valoarea " <<
hashtable.retrieve_val("while") << '\n';
  cout << "Numarul de coliziuni este: " << nr_coliziuni << '\n' ;
  nr_coliziuni=0;
  cin >> nr_coliziuni;
  nr_coliziuni = 0;
  hash hashtable2(31);

  for(i=0;i<27;i++)
     nr_coliziuni+=hashtable2.install(tabcuv[i].nume,
																						    tabcuv[i].val);
  hashtable2.assign_val("auto",100);
  hashtable2.assign_val("else",100);
  hashtable2.print_tab_disp();
  cout << " Atributul ident. auto are valoarea " <<
hashtable2.retrieve_val("auto") << '\n';
  cout << " Atributul ident. while are valoarea " <<
hashtable2.retrieve_val("while") << '\n';
  cout << "Numarul de coliziuni este: " << nr_coliziuni << '\n' ;
//return;
}