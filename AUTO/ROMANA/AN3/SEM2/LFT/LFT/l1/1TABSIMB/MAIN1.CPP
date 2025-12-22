// FISIERUL: main1.cpp

#include <iostream.h>
#include "def1.h"
#include "tabcuv.h"

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
}
