
/* Program l2.9 */

#include <stdio.h>
#include <conio.h>
#include <math.h>

int res[100];

void convert(int x)
{
     int k, i;
     for (k = 1, i = 0; i <= 31; ++i, k = k << 1)
         res[i] = ((x & k) );
}

int main()
{
    int year = 1986, crt = 2005, i;

    printf("%-20s", "Birth year representation in memory : ");
    convert(year);
    for (i = 31; i >= 0; --i)
        printf("%d", res[i]);
    printf("\n");

    printf("%-20s", "Birth year left shifted by 4 : ");
    convert(year << 4);
    for (i = 31; i >= 0; --i)
        printf("%d", res[i]);
    printf("\n");

    printf("%-20s", "Birth year right shifted by 2 : ");
    convert(year >> 2);
    for (i = 31; i >= 0; --i)
        printf("%d", res[i]);
    printf("\n");

    printf("%-20s", "Birth & crt : ");
    convert(year & crt);
    for (i = 31; i >= 0; --i)
        printf("%d", res[i]);
    printf("\n");

    printf("%-40s", "Birth ^ crt : ");
    convert(year ^ crt);
    for (i = 31; i >= 0; --i)
        printf("%d", res[i]);
    printf("\n");

    printf("%-40s", "Birth | crt : ");
    convert(year | crt);
    for (i = 31; i >= 0; --i)
        printf("%d", res[i]);
    printf("\n");


    getch();
    return 0;
}
