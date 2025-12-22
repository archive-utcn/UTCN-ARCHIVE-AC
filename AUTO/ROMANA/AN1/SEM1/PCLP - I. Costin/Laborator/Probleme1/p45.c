/*45. Sa se scrie o functie care determina daca parametrul sau (numar natural) este sau nu
patrat perfect. Aplicând functia asupra elementelor unui vector de numere naturale, sa se 
extraga din vectorul respectiv toate patratele perfecte într-un alt vector.*/

#include<stdlib.h>
#include<stdio.h>
#include<math.h>

int patrat(int n)
{
    if(sqrt(n)==(int)(sqrt(n)))
        return 1;
    return 0;
}

main()
{
    int a[100],b[100],i,la,lb=0;
    printf("Introduceti lungimea sirului n=");
    scanf("%d",&la);
    for(i=0;i<la;i++)
    {
        printf("a[%d]=",i);
        scanf("%d",&a[i]);
        if(patrat(a[i])==1)
            b[lb++]=a[i];
    }
    printf("\nPatratele perfecte din sir sunt:");
    for(i=0;i<lb;i++)
        printf("\nb[%d]=%d",i,b[i]);
    getch();
    return 0;
}
