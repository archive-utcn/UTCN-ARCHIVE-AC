/* ob.cpp */
/***********/
#include<array.h>
#include<strng.h>
#include <assoc.h>
#include"tabcuv.h"

main()
{
   Array tabla(30);
   for(int i=0;i<27;i++){
	   String*s=new String(tabcuv[i].nume);
	   int pint=tabcuv[i].val;
	   int* ppint=&pint;
	   //String * atrib=new String(tabcuv[i].val);
	   Association *a=new Association(s,ppint);
	   tabla.add(*a);
   }
   for(i=0;i<tabla.arraySize();i++){
	   tabla[i].printOn(cout);
	   cout<<'\n';
   }
}

