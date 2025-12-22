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
