//FISIERUL: main2.cpp

#include <iostream.h>

#include "def2.h"

#include "tabcuv.h"



void main()

{
  cout << "Starting\n";
  cout.flush();

  int nr_coliziuni = 0; // pentru compararea numarului total de

//  coliziuni ce apar la instalarea aceluiasi set de

//identificatori

// in doua tabele de dimensiuni diferite

   hash hashtable;

  for(int i=0;i<27;i++)

     nr_coliziuni+=hashtable.install(tabcuv[i].nume, tabcuv[i].val);


  hashtable.print_tab_disp();

  hashtable.assign_val("auto",100);

  hashtable.assign_val("else",100);

  hashtable.print_tab_disp();

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




cout << "Hello world";
return;

}
