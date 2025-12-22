/*46. Sa se scrie o functie care returneaza cel mai mare patrat perfect, mai mic sau egal
cu parametrul sau (numar natural)*/

#include<stdlib.h>
#include<stdio.h>
#include<math.h>

int patrat(int n)
{
    return (int)sqrt(n)*(int)sqrt(n);
}

main()
{
    int n;
    printf("Introduceti un numar natural n=");
    scanf("%d",&n);
    printf("\nCel mai mare patrat perfect mai mic decat %d este %d",n,patrat(n));
    getch();
    return 0;
}
