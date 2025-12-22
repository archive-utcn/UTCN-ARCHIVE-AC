#include <stdio.h>
#include <conio.h>

main( )
{
int a;
float b,c;
printf("\nPlease input the integer value of a=");
scanf("%5d",&a);
printf("\n Please input the value of the real number b=");
scanf("%5f",&b);
c=a+b;
printf("\nthe value of the sum c=a+b is: %6.3f\n",c);
getch();
return 0;
}
