#include <stdio.h>
#include <stdlib.h>

//Programul face conversia unui nr din baza 10 in baza b, folosind o procedura recursiva

int nr; //nr nou format, in baza b

void conversie(int n,int b)
{
    int c;
    c=n/b; //se face impartirea parametrului n la baza b; variabila c retine catul

    if (c!=0) //verifcarea catului daca este diferit de 0
    { conversie(c,b);} //autoapel
    nr=nr*10 + (n%b); //formare nr in baza b

}

int main()
{
    int n,b; //declarare n-nr in baza 10; b-baza de tranformare

    printf("Numarul in baza 10:");
    scanf("%d", &n); //citire n, b
    printf("Baza in care se face conversia:");
    scanf("%d", &b);

    printf("\nNumarul in baza %d:",b);

    conversie(n,b); //apel fct recursiva

    printf("%d",nr);
    return 0;
}
