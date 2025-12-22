/*Scrieti un program care efectueaza operatii aritmetice asupra a doua date de tip întreg si real.
Executati-l pentru valori care conduc la rezultat în afara limitelor de reprezentare interna. Ce se
întâmpla în acest caz?*/
#include <conio.h>
#include <stdio.h>

int main()
{
int a;
float b;
printf("\n introduceti numarul intreg a \n ");
scanf("%d",&a);
printf("\n introduceti numarul real b\n");
scanf("%f",&b);
a=a*a*a*a*a*a*a*a;
b=b*b*b*b*b*b*b*b;
printf("rezultatul primei operatii %d\n",a);//*pt valori in afara limitelor rezultatul este gresit
printf("rezultatul la a doua operatiei %f",b);
getch();
}
