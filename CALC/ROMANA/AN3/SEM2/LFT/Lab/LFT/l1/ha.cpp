/**********/
/* ha.cpp */
/**********/
#include<strng.h>
#include<iostream.h>
#include<hashtbl.h>

char* tabcuv[]={
	"int","char","float","double","struct","long","unsigned",
	"union","short","auto","extern","static","register","goto",
	"return","if","while","else","switch","case","break","continue",
	"do","default","for","sizeof","typedef",""};

main()
{
   HashTable tabel;
   String *cuv1;
   for(int i=0; i<27; i++) {
	cuv1=new String(tabcuv[i]);
	tabel.add(*cuv1);
   }
   cuv1=new String(tabcuv[7]);
   cout<<tabel.findMember(*cuv1)<<'\n';
   cuv1=new String(tabcuv[11]);
   cout<<tabel.findMember(*cuv1)<<'\n';
   cuv1=new String(tabcuv[22]);
   cout<<tabel.findMember(*cuv1)<<'\n';
   tabel.detach(*cuv1);
   cout<<tabel.findMember(*cuv1)<<"\n\n";
   tabel.printOn(cout);
}


