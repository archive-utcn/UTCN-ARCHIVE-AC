#include <stdio.h>
#include <stdlib.h>

int main()
{
    int year;
    printf("Write a year: ");
    scanf("%d", &year);

    //((year%4==0 && year%100!=0)) ? printf("Leap year.") : ((year%400==0) ? printf("Leap year.") : printf("Common year."));

    ((year%4==0 && year%100!=0) || (year%400==0)) ? printf("Leap year.") : printf("Common year.");

    return 0;
}
