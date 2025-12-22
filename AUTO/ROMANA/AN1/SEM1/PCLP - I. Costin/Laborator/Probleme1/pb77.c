/* Sa se scrie doua functii, una care converteste un numar întreg sau real într-un sir de caractere, iar
cealalta face operatia inversa.*/
#include <stdio.h>
#include <stdlib.h>
#include<string.h>

void conversie_char_int (char numar[])
    {
        int n;
        n=atoi(numar);
        printf("\nNumarul dupa conversie este: %d",n);
    }

void conversie_int_char (int n) // base se seteaza 10 pentru a afisa (-) daca numarul este negativ
    {
        char numar[10];
        itoa(n,numar,10);

    }
int main()
{
    int m;
    char numar[10];
    printf("Introduceti sirul care doriti sa il convertiti:");
    gets(numar);
    conversie_char_int(numar);
    printf("\nIntroduceti numarul care doriti sa il converiti");
    scanf("%d",&m);
    conversie_int_char(m);
    int i;
    for (i=0;i<strlen(numar);i++)
        printf("%d.",numar[i]);
    return 0;
}
