/* Program L04Ex4.c */
/* Computes of the greatest common divisor (gcd) and
the smallest commom multiple (scm) of two natural numbers, a and b */
#include <stdio.h>
int main()
{
    int a, b, a1, b1, gcd, scm, remainder;
    printf("Computes of the greatest common divisor (gcd) and\n");
    printf( "the smallest commom multiple (scm) of two natural numbers, a and b");
    printf("Input value for a=");
    scanf("%d", &a);
    printf("Input value for b=");
    scanf("%d", &b);
    /* Computation of gcd */
    a1=a;
    b1=b;
    while ((remainder=a1%b1)!=0)
    {
        a1=b1;
        b1=remainder;
    }
    gcd=b1;
    scm=a*b/gcd;

    printf("a=%d b=%d gcd(a,b)=%d scm=%d", a, b, gcd, scm);
    return 0;
}
