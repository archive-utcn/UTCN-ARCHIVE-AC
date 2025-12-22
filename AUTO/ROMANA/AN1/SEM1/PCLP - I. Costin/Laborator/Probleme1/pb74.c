/*Se va scrie o functie pentru inserarea unui sir de caractere sursa într-un sir de caractere destinatie,
specificând pozitia din care începe inserarea. */
#include <stdio.h>
#include <stdlib.h>
#include<string.h>
#include<conio.h>
void inserare (char sir[50],char dest[50],int i)
{
    int k;
    char aux[50];
strcpy(aux,dest+i);

for(k=i;k<strlen(dest);k++)
    dest[k]=0;
strcat(dest,sir);
strcat(dest,aux);
}
int main()
{
  int i;
  char sir[50],dest[50];
  printf("Introduceti sirul:");
  gets(dest);
  printf("\nIntroduceti pozitia unde vreti sa insereze:");
  scanf("%d",&i);
  printf("\nIntroduceti sirul pe care vreti sa il inserati: ");
  fflush(stdin);
  gets(sir);
inserare(sir,dest,i);
  puts(dest);
    return 0;
}
