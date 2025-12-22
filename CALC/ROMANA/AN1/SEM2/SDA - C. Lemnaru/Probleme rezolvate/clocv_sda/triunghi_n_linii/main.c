/*53. Se considera un triunghi format din n linii, pe fiecare linie i sunt i numere întregi pozitive, ca în exemplul
de mai jos:
7
3 8
8 1 0
2 7 4 4
4 5 2 6 5
Sa se scrie un program care calculeaza cea mai mare suma a numerelor aflate pe un drum care leaga vârful de
sus al triunghiului cu baza. Drumul este astfel construit încât la fiecare pas se coboara pe diagonala, spre
stânga sau spre dreapta.
Exemplu: pentru triunghiul de mai sus, drumul cautat este: 7 - 3 - 8 - 7 – 5*/
#include <stdio.h>
#include <stdlib.h>
#define MAX 100

int triunghi[MAX][MAX], n, sum[MAX][MAX];
void read()
{
    int i, j;
    FILE *in=fopen("triunghi.txt", "r");
    fscanf(in, "%d", &n);
    for(i=0; i<n; ++i)
        for(j=0; j<=i; ++j)
            fscanf(in, "%d", &triunghi[i][j]);
}
void dinamic()
{
    int i, j;
    for(i=0; i<n; ++i)
        sum[n-1][i]=triunghi[n-1][i];
    for(i=n-2; i>=0; --i)
        for(j=0; j<=i; ++j)
            if(sum[i+1][j]>sum[i+1][j+1])
                sum[i][j]=sum[i+1][j]+triunghi[i][j];
            else
                sum[i][j]=sum[i+1][j+1]+triunghi[i][j];
}
void afisare()
{
    int i, j;
    for(i=0; i<n; ++i)
    {
        for(j=0; j<=i; ++j)
            printf("%5d", sum[i][j]);
        printf("\n");
    }
    printf("\n\nSuma maxima care se poate forma este: %d\n", sum[0][0]);
}
int main()
{
    read();
    dinamic();
    afisare();
    return 0;
}
