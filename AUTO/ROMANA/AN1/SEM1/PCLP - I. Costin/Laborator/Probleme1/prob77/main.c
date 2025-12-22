/*Sa se scrie doua functii, una care converteste un numar întreg sau real într-un sir de caractere, iar
cealalta face operatia inversa.*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

float sir_in_nr(char s[])
{
    return atof(s);
}

void nr_in_sir(float x,char s[])
{
    sprintf(s,"%f",x);

}

int main()
{
    char s[50], d[50];
    float nr;
    printf("Introduceti sirul pe care doriti sa-l convertiti:\n");
    scanf("%s", s);
    printf("%f", sir_in_nr(s));
    printf("\nIntroduceti numarul pe care doriti sa-l convertiti:\n");
    scanf("%f", &nr);
    nr_in_sir(nr,d);
    printf("%s", d);
    return 0;
}
