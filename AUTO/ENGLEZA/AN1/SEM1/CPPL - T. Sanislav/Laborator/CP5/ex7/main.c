#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

int perfect_square(int);
//varianta comentata e gresit sau  incompleta
/*
int main()
{
    int a;
    scanf("%d",&a);
    printf("%d",perfect_square(a));
    return 0;
}

int perfect_square(int a)
{
    int s=0;
    int i=0;
    for (i=1;i<a;i++)
    {
        if(i * i == a)
        {
            s=1;
        }
    }
    return s;
}
*/

int main () {
    int i, string[10] = {10, 9, 8, 4, 16, 12, 64, 100, 2, 3}, news[10], count=0, max;
    for (i = 0; i < 10; i++) {
        if (perfect_square(string[i]) == 1)
           { printf("%d is a perfect square\n", string[i]); news[count] = string[i]; count++; } else
        printf("%d is not a perfect square\n", string[i]);
        }
    max = count; // holds the strlen of news[]array - the array with the perfect square elements

    for (count = 0; count < max; count++) printf("\n %d \t", news[count]);
}

int perfect_square(int ptr) {
    int x = sqrt(ptr);
    if (sqrt(ptr) == x ) return 1; else return 0;



}
