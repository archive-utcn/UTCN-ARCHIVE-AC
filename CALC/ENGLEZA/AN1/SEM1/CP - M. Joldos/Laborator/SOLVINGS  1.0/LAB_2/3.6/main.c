/* Program 3.6 */
#include<conio.h>
#include<stdio.h>

#define pi 3.14159265

main()
{    float a,b;
     int grade, minute, secunde;
     printf("Input a real number representing the measurement of an angle in radians:");
     scanf("%f", &a);
     b=a*180/pi;
     grade=(int)b;
     b=(b-(int)b)*60;
     minute=(int)b;
     b=(b-(int)b)*60;
     secunde=(int)b;
     printf("\n%6.3f=%d hours %d minutes %d seconds", a, grade , minute, secunde);
     getch();
     return 0;
}
