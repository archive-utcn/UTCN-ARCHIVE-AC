/* Se va scrie o functie pentru a verifica daca un sir dat este subsir al unui alt sir de caractere. În caz
afirmativ, se va specifica pozitia pe care se regaseste pentru prima data.*/
#include <stdio.h>
#include <stdlib.h>
#include<string.h>
#include<conio.h>
void cautare (char sir[50],char subsir[50])
{
    char *m;
    m=strstr(sir,subsir);

    if (m!=0) printf("subsirul s-a gasit in sir pe pozitia %d ",m-sir);
        else printf("Subsirul nu s-a gasit in sirul dat");
}
int main()
{
  int i;
  char subsir[50],sir[50];
  printf("introduceti sirul:");
  gets(sir);

  printf("introduceti sirul pe care vreti sa il cautati: ");
  fflush(stdin);
  gets(subsir);
cautare(sir,subsir);

    return 0;
}
