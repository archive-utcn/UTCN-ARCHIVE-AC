#include <stdio.h>
#include <stdlib.h>

int main()
{
    //convertirea unui numar real ce reprezinta masura unui unghi in radiani, grade, minute si secunde
    //nr. real se va citi de la tastatura si va lua valori de la 0 la 2*PI

        float n;
        float pi = 3.14;
        float degrees = 0, minutes = 0, seconds = 0;
        unsigned degree_symbol = 248;
        printf("N=");
        scanf("%f", &n);
        if(n>0 && n<2*pi){
        degrees=n*180/pi;
        printf("%f\n",degrees);
        minutes=degrees/60;
        seconds=degrees/3600;
        degrees=(int)degrees+minutes+seconds;

        printf("%f%c", degrees, degree_symbol);
        }
        else {
        printf("Numarul ales este mai mare decat 2*PI!");
        }
        //= radians*180/pi;


    return 0;
}
