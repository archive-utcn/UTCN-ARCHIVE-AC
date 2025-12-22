/* Se va scrie o functie pentru stergerea unui subsir dintr-un sir de caractere dat. Subsirul se va
specifica prin pozitie si numar de caractere.*/
#include <stdio.h>
#include <stdlib.h>
#include<string.h>
#include<conio.h>
void stergere (char sir[50],int i,int n)
{
    char aux[50];
strcpy(sir+i,sir+i+n);


}
int main()
{
  int i,n;
  char sir[50];
  printf("Introduceti sirul:");
  gets(sir);
  printf("\nIntroduceti pozitia unde vreti sa stergeti:");
  scanf("%d",&i);
  printf("\nIntroduceti nr de caract. pe care vreti sa il stergeti: ");
  fflush(stdin);
  scanf("%d",&n);
stergere(sir,i,n);
  puts(sir);
    return 0;
}
