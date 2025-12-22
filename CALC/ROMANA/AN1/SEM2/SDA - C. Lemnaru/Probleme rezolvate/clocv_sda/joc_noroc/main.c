#include <stdio.h>
#include <stdlib.h>

/*
23. Un participant la un joc de noroc porneste avand la start o suma de bani A. La fiecare tura a jocului,
    jucatorul poate pierde sau castiga o suma in valoare fixa B. Sa se gaseasca toate posibilele variante de
    desfasure a jocului (secvente pierdere - castig), astfel incat dupa N runde, jucatorul aceeasi suma
    de bani, A, ca la start.

    Algoritm:
       -> N impar : Nu exista solutie
       -> N par : trebuie sa castigam/pierdem de N/2 ca sa ajungem inapoi la suma A;
                  1. generam toate variantele de desfasurare a jocului
                  2. afisam...

*/

int c[61];
int A,B,n;
int nr_sol = 0;

void write() {                                      //afisare solutie
    nr_sol++;
    int i;
    int total = A;
     printf("\n---+");
    for (i = 1; i<=n; i++) printf("-------+");
    printf("\n%2d |",nr_sol);
    for (i = 1; i<=n; i++)
        if (c[i] == 0) {
            printf( "-%4d  |",B);
        }
        else {
            printf( "+%4d  |",B);
        }

    printf("\n   |");
    for (i = 1; i<=n; i++)
        if (c[i] == 0) {
            total -= B;
            printf( " %5d |", total);
        }
        else {
            total += B;
            printf( " %5d |", total);
        }


}

void calc(int x, int p) {                   //Calculaza cand castigam din cele N pasi
    if ( x == n / 2) {
        write();                            //Afisare
        return;
    }
    int i;
    for (i = p + 1; i <= n/2 + x+1; i++)    //Generam toate variante de castig/pierdere
       if (A + (2*x - i + 1)*B >=0)         //Verificare daca mai avem bani
    {
        c[i] = x + 1;
        calc(x+1, i);                       //Calcurarea urmatorului castig
        c[i] = 0;
    }
}

int main()
{
    //Citire:
    printf("          Suma de start:   A= ");
    scanf("%d", &A);
    printf("Suma de castig/pierdere:   B= ");
    scanf("%d", &B);
    printf("       Numarul de runde:   N= ");
    scanf("%d", &n);

    if ( n % 2 == 1) printf(" Nu exista solutie");     // N impar: nu exista solutie
    else {
        printf("\nNr.|");
        int i;
        for (i = 1; i<=n; i++)
            printf(" %2d.   |", i);
        calc(0,0);                                    // Generare solutii
        printf("\n\n Nr. total de solutii:  %d", nr_sol);
    }
    getchar(); getchar(); getchar();
    return 0;
}
