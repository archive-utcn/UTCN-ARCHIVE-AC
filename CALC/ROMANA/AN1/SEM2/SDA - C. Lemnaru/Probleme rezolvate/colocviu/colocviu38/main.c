#include <stdio.h>
#include <stdlib.h>
#include<conio.h>
/*La un concurs de tir, tinta este alcatuita din cercuri concentrice,
 numerotate din exterior spre interior.Fiecarui sector determinat de
 doua cercuri concentrice succesive ii este atasata o valoare strict pozitiva,
reprezentand punctajul primit de concurent in cazul lovirii acestui sector.
Sa se determine numarul minim de lovituri pe care trebuie sa le execute un
 concurent pentru a obtine exact k puncte.

Am uitilizat metoda programarii dinamice.*/
void main()
{

    {
        int i,j,s,min[1000];
        int n,a[1000];//a este vectorul de valori;
        printf("Introduceti nr de cercuri n= ");
        scanf("%d",&n);
        printf("Introduceti valorile tintei!\n");
        for (i=1;i<=n;i++)
        {
            printf("a[%d]= ",i);
            scanf("%d",&a[i]);
        }
        printf("Introduceti punctajul: ");
        scanf("%d",&s);

        for (i=1;i<=s;i++)
            min[i]=0xfff7;
        min[0]=0;
        for (i=1;i<=s;i++)
            for (j=1;j<=n;j++)
                if ((a[j]<=i)&&(min[i-a[j]]+1<min[i]))
                    min[i]=min[i-a[j]]+1;
        if (min[s]==0xfff7)
            printf("Acest punctaj nu se poate obtine!\n");
        else
            printf("Numarul minim de lovituri pentru a obtine %d puncte este %d.",s,min[s]);

    }
    getch();
    return 0;
}

