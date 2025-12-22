#include <conio.h>
#include <stdio.h>

int main()
{
int a;
float b;
printf("\n Please input the integer number a \n ");//*we read 2 numbers a-integer and b-float
scanf("%d",&a);
printf("\n Please input the float number b\n");
scanf("%f",&b);
a=a*a*a*a*a*a*a*a;//*we set up the multiplication operation
b=b*b*b*b*b*b*b*b;
printf("The output of first operation is %d\n",a);//*if limits are overflowed then the result is wrong
printf("The output of operation 2 is %f",b);
getch();
}
