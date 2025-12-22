/******************************
      Nume:         Maja
      Prenume:    Ovidiu Dan
      Grupa:         30214
******************************/

/************************************************************************************************
#                                                                                               #
# 17. Se considera un triunghi format din n linii, pe fiecare linie i sunt numere intregi       #
# pozitive, ca in exemplul de mai jos:                                                          #
#                                                                                               #
#                                 7                                                             #
#                            3       8                                                          #
#                         8     1       0                                                       #
#                      2    7     4       4                                                     #
#                    4   5     2      6     5                                                   #
#                                                                                               #
# Sa se scrie un program care calculeaza cea mai mare suma a numerelor aflate pe un             #
# drum ce leaga varful de sus al triunghiului cu baza. Drumul este astfel construit incat       #
# la fiecare pas se coboara pe diagonala, spre stanga sau spre dreapta.                         #
#                                                                                               #
# Exemplu: pentru triunghiul de mai sus, drumul cautat este:                                    #
#                                                                7 -> 3-> 8 -> 7 -> 5           #
#                                                                                               #
************************************************************************************************/

#include <stdio.h>
#include <stdlib.h>

char line[]="-----------------------------------------------------\n";
 typedef struct nod
  {
      int nr;
      int rating;
      int vazut;
      struct nod *st,*dr;
   } NOD;

# include "create.h"
# include "read.h"
# include "back.h"
# include "print.h"



int main()
{char s[20];
 NOD *r;
 int n,*x,*y,**z,suma=0,i;
 r=0;
   printf("Nume fisier inserare date:  ");
   gets(s);
   n=read(&r,s);
create_int(&x,n);
create_int(&y,n);
z=(int**)calloc(n,sizeof(int *));
if(z==NULL) {fprintf(stderr,"\nEroare la alocare de memorie");getchar();exit(1);}
for (i=0;i<n;i++)
 {create_int(&z[i],i+1);
   initialize(z[i],i+1);
 }
back(r,r,x,y,&suma,n,1);
get_tree(z,r,0);
printf("Nume fisier afisare date:  ");
gets(s);
afisare(s,z,x,n,r);
printf("\n%sDeschideti fisierul \"%s\"\n%s",line,s,line);
getchar();
return 0;
}
