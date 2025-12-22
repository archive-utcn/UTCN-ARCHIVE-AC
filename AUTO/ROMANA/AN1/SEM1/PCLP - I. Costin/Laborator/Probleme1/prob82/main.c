/*Se numeste polinom rar, un polinom a carui numar de monoame nule este mai mare decât
numarul celor nenule. Sa se scrie un program care memoreaza un polinom rar de ordinul m, îl
afiseaza si îi calculeaza valoarea pentru un x dat.*/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main()
{
    int pol[50], m, i=1, cont=0,x, s=0;
    printf("Introduceti gradul polinomului: \n");
    scanf("%d", &m);
    printf("\nIntroduceti polinomul:\n");
    for(i=1;i<=m;i++)
    {
        scanf("%d", &pol[i]);
        if(pol[i]==0) cont++;
    }

    if(cont<=m/2) { printf("Polinomul nu este rar");
                    exit(1);}
     else { printf("\nPolinomul este : ");
            for(i=1;i<=m;i++)
            if(pol[i]) printf("%d*x^%d+ ", pol[i], i);
            printf("\nIntroduceti un numar pt a calcula valoarea polinomului\n");
            scanf("%d", &x);
            for(i=1;i<=m;i++)
            if(pol[i]) s=s+pol[i]*pow(x,i);
            printf("\nVAloare polinomului in %d este %d", x,s);
           }


     return 0;
}


