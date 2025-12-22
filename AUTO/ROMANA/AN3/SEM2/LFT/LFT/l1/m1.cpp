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

//FISIERUL: main1.cpp

#include <iostream.h>
#include "def1.h"

main()
{
  hash hashtable;
  for(int i=0;i<27;i++)
     hashtable.install(tabcuv[i].nume,tabcuv[i].val);
  hashtable.assign_val("auto",100);
  hashtable.install("auto",10); // EROARE - id. deja instalat
  hashtable.del("else");
  hashtable.del("int");
  hashtable.del("unsigned");
  hashtable.del("case");
  hashtable.del("case"); // EROARE - id. inexistent
  hashtable.print_tab_disp();
  cout << " Atributul ident. auto are valoarea " <<
hashtable.retrieve_val("auto") << '\n';
  cout << " Atributul ident. while are valoarea " <<
hashtable.retrieve_val("while") << '\n';
cout << hashtable.retrieve_val("case") << '\n';
cout << hashtable.install("auto",200) << '\n';
cout << hashtable.assign_val("case",10) << '\n';
}

