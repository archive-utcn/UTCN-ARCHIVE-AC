/*Se va scrie o functie pentru a verifica daca un sir dat este subsir al unui alt sir de caractere. În caz
afirmativ, se va specifica pozitia pe care se regaseste pentru prima data.*/

#include <stdlib.h>
#include <conio.h>
#include <string.h>
#include <stdio.h>

int VerifSubsir(char s[], char a[])
{
    if(strstr(s,a)==0) return 0;
     else return strstr(s,a)-s;
}

int main()
{
    char sir[200], subsir[200];
    int i;

    printf("Introduceti sirul: \n");
    gets(sir);
    printf("Introduceti subsirul: \n");
    gets(subsir);

    if(VerifSubsir(sir,subsir)==0) printf("\nNu");
     else
     {  printf("\nDa");
        printf("\nSubsirul incepe de la pozitia ");
        printf("\n %d ",VerifSubsir(sir,subsir));
     }
    return 0;
}
