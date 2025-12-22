#include <stdio.h>
#include <stdlib.h>

//Programul afiseaza elementele unui tablou in ordine inversa, folosind o procedura recursiva care se autoapeleaza

int v[50];
int n;

void afisare(int i)
{
    if (i!=n-1) afisare(i+1); //daca nu s-a ajuns la final, se inainteaza in vector; autoapel pentru elementul urmator
    printf("\n%d",v[i]); //afisare element curent

}

int main()
{
    int i;

    printf("Nr. elemente:");
    scanf("%d",&n); //citire nr de elemente
    printf("Elementele:");
    for (i=0;i<n;i++)
        scanf("%d",&v[i]); //citire elemente
    printf("Ordinea inversa:");
    afisare(0); //apel procedura recursiva de afisare, incepand cu elementul de pe prima pozitie a vectorului
    return 0;
}
