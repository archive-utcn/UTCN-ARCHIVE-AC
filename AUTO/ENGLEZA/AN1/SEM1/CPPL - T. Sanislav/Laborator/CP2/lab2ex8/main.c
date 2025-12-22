/*Write a program to convert a real number, representing a measurement for an angle
in radians, to degrees, minutes, and seconds. The real number is read from the
keyboard and has values between 0 and 2*PI. Use the following: degrees = radians
180/PI and degrees = integer part of degrees + minutes/60 + seconds/3600*/

#include <stdio.h>
#include <stdlib.h>
#define PI 3.14

int main()
{
    float n, degrees, seconds, minutes;
    printf("Write a real no between 0 and 2*PI: \n ");
    scanf("%f", &n); //read a no between 0 and 2PI
if (n>0 && n<2*PI)
{
    degrees = n*180/PI; //transform the radians in degrees
    printf("The degrees of the angle are: %.0f\n", degrees);

    minutes = (degrees-(int)degrees)*60; //calculate the minutes of the angle
    printf("The minutes of the angle are: %.0f\n", minutes);

    seconds = (minutes-(int)minutes)*60; //calculate the seconds of the angle
    printf("The seconds of the angle are: %.0f\n", seconds);

    printf("%.f%c%.f\'%.f\"\n", degrees, 248, minutes, seconds); //print the whole answer with symbols too, using ASCII code
}
else printf("The number doesn't satisfy the given statement");
    return 0;
}
