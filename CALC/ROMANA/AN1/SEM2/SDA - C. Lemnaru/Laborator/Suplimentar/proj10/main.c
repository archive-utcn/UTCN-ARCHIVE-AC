#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void fibonacci(int depth, int *x1, int *x2)
{
    // x1 incepe de la 0, are val 1
    // x2 incepe de la 1, are val 1
    if (depth == 0)
    {
        *x1 = *x2 = 1;
    }
    else
    {
        fibonacci(depth - 1, x1, x2);
        int c = *x1;
        *x1 = *x2;
        *x2 = c + *x2;
    }
}

int main()
{

    int x1 = 1, x2 = 1;
    fibonacci(5, &x1, &x2);

    printf("Raspunsul este: %d\n", x1);

    return 0;






    printf("Dati suma: ");
    int suma;
    scanf("%d", &suma);

    int bancnote[6];

    printf("Dati numarul de bancnote de 10 lei: ");
    scanf("%d", bancnote);

    printf("Dati numarul de bancnote de 20 lei: ");
    scanf("%d", bancnote + 1);

    printf("Dati numarul de bancnote de 50 lei: ");
    scanf("%d", bancnote + 2);

    printf("Dati numarul de bancnote de 100 lei: ");
    scanf("%d", bancnote + 3);

    printf("Dati numarul de bancnote de 200 lei: ");
    scanf("%d", bancnote + 4);

    printf("Dati numarul de bancnote de 500 lei: ");
    scanf("%d", bancnote + 5);

    printf("Bancnote: %d %d %d %d %d %d\n",
           bancnote[0],
           bancnote[1],
           bancnote[2],
           bancnote[3],
           bancnote[4],
           bancnote[5]);

    // here comes greedy
    int bancnote_folosite[6];
    memset(bancnote_folosite, 0, 6 * sizeof(int));

    while (suma >= 500 && bancnote[5])
    {
        bancnote[5]--;
        bancnote_folosite[5]++;
        suma -= 500;
    }
    while (suma >= 200 && bancnote[4])
    {
        bancnote[4]--;
        bancnote_folosite[4]++;
        suma -= 200;
    }
    while (suma >= 100 && bancnote[3])
    {
        bancnote[3]--;
        bancnote_folosite[3]++;
        suma -= 100;
    }

    while (suma >= 50 && bancnote[2])
    {
        bancnote[2]--;
        bancnote_folosite[2]++;
        suma -= 50;
    }
    while (suma >= 20 && bancnote[1])
    {
        bancnote[1]--;
        bancnote_folosite[1]++;
        suma -= 20;
    }
    while (suma >= 10 && bancnote[0])
    {
        bancnote[0]--;
        bancnote_folosite[0]++;
        suma -= 10;
    }

    if (suma == 0)
    {
        printf("S-au folosit urmatoarele bancnote:\n10: %d\n20: %d\n50: %d\n100: %d\n200: %d\n500: %d\n",
               bancnote_folosite[0],
               bancnote_folosite[1],
               bancnote_folosite[2],
               bancnote_folosite[3],
               bancnote_folosite[4],
               bancnote_folosite[5]);
    }
    else if (suma < 10)
    {
        printf("nu use poate imparti suma cu aceste bancnote! %d\n", suma);
    }

    return 0;
}
