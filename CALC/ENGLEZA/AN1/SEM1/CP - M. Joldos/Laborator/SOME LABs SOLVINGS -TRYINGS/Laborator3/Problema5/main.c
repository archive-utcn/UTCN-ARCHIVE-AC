#include <stdio.h>
#include <stdlib.h>

int main()
{
    float x;
    printf("Valoarea lui x este: ");
    scanf("%f",&x);
    if ( x < -2)
    {
       printf("Valoarea functiei este %f", x*x-7*x+4);
    }
    else
    {
        if (x==-2)
        {
           printf("Valoarea functiei este %f", 0);
        }
        else
            printf("Valoarea functiei este %f", x*x+5*x-2);
    }

    return 0;
}
