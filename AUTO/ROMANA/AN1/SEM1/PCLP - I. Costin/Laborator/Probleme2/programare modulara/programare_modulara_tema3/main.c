#include <stdio.h>
#include "programe.h"

int main()
{
    int n,s=0,opt=1,x;
    while(opt!=0)
    {
        printf("1-numarul de aparitii a lui 0 in reprezentarea binara a unui numar\n");
        printf("2-an bisect\n");
        printf("3-frecventa de aparitie a unui numar");
        printf("4-intersectia, reuniunea si diferenta a doua multimi citite");
        printf("5-valoare functiei f definita astfel\n");
        printf("6-spatiul de memorie ocupat ( in octeti ) de tipurile de date\n");
        printf("7-minimul, respectiv maximul dintr-un sir citit\n");
        printf("8-umerele prime, mai mici sau egale cu un X citit de la tastatura\n");
        printf("9-daca un numar este perfect ( adica daca este egal cu suma divizorilor sai strict mai mici decat el )\n");
        printf("10-daca un numar este palindrom\n");
        printf("0-Exit\n");
        printf("Introduceti optiunea");
        scanf("%d",&opt);
        switch(opt)
        {
            case 1: {printf("Introduceti numarul:");
                     scanf("%d",&n);
                     printf("%d",ex1(n,s));
                     break;}
            case 2: {printf("Introduceti un an");
                     scanf("%d",&n);
                     ex2(n);
                     break;}
            case 3: {printf("introduceti lungimea matricei:");
                     scanf("%d",&n);
                     ex3(n);
                     break;}
            case 4: {printf("n=");
                     scanf("%d",&n);
                     ex4(n);
                     break;}
            case 5: {printf("x=");
                     scanf("%d",&x);
                     ex5(n);
                     break;}
            case 6: {ex6();
                     break;}
            case 7: {printf("n=");
                     scanf("%d",&n);
                     ex7(n);
                     break;
                    }
            case 8: {printf("n=");
                     scanf("%d",&n);
                     ex8(n);
                     break;}
            case 9: {printf("n=");
                     scanf("%d",&n);
                     ex9(n);
                     break;}
            case 10: {printf("n=");
                      scanf("%d",&n);
                      ex10(n);
                      break;}
        }
    }

    return 0;
}
