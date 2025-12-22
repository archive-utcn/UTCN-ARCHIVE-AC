#include <stdio.h>
#include <stdlib.h>

int main()
{
    unsigned int year;
    printf("Year=");
    scanf("%u", &year);
    if ( year > 1900 && year < 4900 )
    {
        if (year % 4 == 0)
            printf("The year is a leap year");
        else
            printf("The year is not a leap year");
    }
    else printf("The year does not belong to the range");
    return 0;
}


P4
#include <stdio.h>
#include <stdlib.h>

int main()
{
    unsigned int year;
    printf("Year=");
    scanf("%u", &year);
    if ( year > 1900 && year < 4900 )
    {
        if (year % 4 == 0)
            printf("The year is a leap year");
        else
            printf("The year is not a leap year");
    }
    else printf("The year does not belong to the range");
    return 0;
}


P42
#include <stdio.h>
#include <stdlib.h>

int main()
{
    unsigned int year;
    printf("Year=");
    scanf("%u", &year);
    printf("Year %u is %s leap year\n", year,
        ((year % 4 ==0 && (year % 100 != 0 || year % 400 == 0))? "a": "not a"));
    return 0;
}


P5
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


P6
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define M_PI 3.14159265358979323846264338327
int main()
{
    double angleDeg, angleRad, mins, deg, secs;

    printf("angle[in  radians]=");
    scanf("%lf", &angleRad);
    angleDeg=angleRad *180.0/M_PI;
    deg= (int) angleDeg;
    mins= (int)angleRad * 60;
    secs=angleRad / 60 * 3600;
    printf("%lf radians is &f degrees,%f minutes, %f seconds", angleRad, mins, secs);
    return 0;
}
