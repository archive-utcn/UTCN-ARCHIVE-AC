/*Scrieti un program care transforma coordonatele carteziene ale unui punct din plan în coordonate
polare.*/
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int main()
{float a,b,r,u;
printf("\n Introduceti coordonatele \n");
    scanf("%f%f",&a,&b);
    r=sqrt(a*a+b*b);
    u=atan(b/a);
    printf("\n raza: %f",r);
    printf("\n unghiul: %5f",u);
    return 0;
}
