/*
 Afiseaza rezumatul unui director dat. Se foloseste functia popen, care deschide un pipe, si
 executa un fork. 
 
*/
#include <stdio.h>
#include <string.h>

int main()
{
  char linie[1024],rezumat[30000],*p;
  char director[20];
  char comanda[40];
  FILE *fin;

  /* citim numele directorului */
  printf("Directorul este:");
  scanf("%s",director);
  
  /* construim comanda */
  sprintf(comanda,"ls -l %s",director);
  p=rezumat;
  
  /* executam si afisam rezultatul */
  fin=popen(comanda,"r");
  while (fgets(linie,1024,fin)!=NULL) 
  {
   strcpy(p,linie);
   p+=strlen(linie);
  }
  
  pclose(fin);
  printf("Rezumatul directorului - %s - este: \n",director);
  printf("%s\n",rezumat);
}
