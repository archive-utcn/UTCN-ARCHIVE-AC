#include <conio.h>
#include <stdio.h>
#include <math.h>

int main()

{
float a,x;
printf("Introduceti nr de radiani ");//*we read the angle in radians
scanf("%f",&a);
x=a*180/M_PI;//*we calculate the degrees of the angle after that formula
printf("Degreez: %d",int(x));//*we display the degrees
x=(x-int(x))*60;//*we calculate the minutes of the angle after that formula
printf(" : %d",int(x));//*we display the minutes
x=(x-int(x))*60;//*we calculate the seconds of the angle after that formula
printf(" : %d",int(x));//*we display the seconds
getch();
}

