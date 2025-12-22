/* +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
Baltaretu Teodor Stelian, Turtulea Alexandra Georgina
Write a program to input a year and check whether year is leap year or not using
conditional operator. Use the following: if a year is exactly divisible by 4 and not
divisible by 100 then it is leap year, else if year is exactly divisible by 400 then
it is leap year, else it is a common year.
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+- */


#include <stdio.h>
#include <stdlib.h>

int main()
{
    int year = 0;    //define year variable, initialized with 0, to hold the year inputted by the user

    printf("Write a year: ");
    scanf("%d", &year);
    //read the year variable from the keyboard

    (year % 4 == 0 && year % 100 != 0) ? printf("Leap year") : (year % 400 == 0) ? printf("Leap year") :  printf("Common year");
    /*  this checks is either leap either common by the following conditions:
         if a year is exactly divisible by 4 and not divisible by 100 then it is leap year,
    else if a year is exactly divisible by 400 then it is leap year, else it is a common year
    */

    return 0;
}
