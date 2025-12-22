#include <stdio.h>
#include <stdlib.h>

//Programul citeste toate randurile unui fisier si le afiseaza, in ordine inversa, intr-un alt fisier

FILE *f,*g; //declarare fisiere


void afisare(int rand)
{
    int c;
    char s[50];  //declarare vector de caractere; va retine fiecare rand
    c=fgets(s,50,f); //citire rand curent
    if (c!=0)   //conditie care verifica daca nu s-a ajuns la finalul fisierului
     afisare(rand+1); //se trece la randul urmator
    if (c!=0)
     fputs(s,g);   //afisare rand curent, in functie de nivelul atins in stiva
}

int main()
{
    f=fopen("fisier.in","r");   //deschidere pt citire
    g=fopen("fisier.out","w");  //deschidere pt scriere
    afisare(1);   //apel procedura de afisare, incepand cu randul 1
    fclose(f);
    fclose(g);    //inchidere fisiere
    return 0;
}
