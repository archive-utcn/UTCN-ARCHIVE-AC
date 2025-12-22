/* Se va scrie o functie care sa realizeze extragerea dintr-un sir de caractere sursa a unui subsir
specificat prin pozitia în cadrul sursei si a numarului de caractere extrase.*/
#include <stdio.h>
#include <stdlib.h>
#include<string.h>
#include<conio.h>
/*void extragere (char sursa[50],char extras[50],int i,int n)
{

strncpy(extras,sursa+i,n);

//puts(extras);
extras[n]='\0';

} */
int main()
{
  int i,n;
  char sursa[50],extras[50];
  printf("Introduceti sirul sursa :P :");
  gets(sursa);
  printf("\nIntroduceti pozitia de unde vreti sa se faca extragerea :-W :");
  scanf("%d",&i);
  printf("\nIntroduceti numarul de caractere pe care doriti sa il extragecti: ");
  scanf("%d",&n);
  strncpy(extras,sursa+i,n);
  //extragere(sursa,extras,i,n);
  fflush(stdin);
  printf("%s",extras);
    return 0;
}
