/* L04ex5.c 
Computes the arithmetic mean value of n real numbers 
*/
#include <stdio.h>
int main()
{
    float a[100], mean, sum;
    int i, n;
    printf("Computes the arithmetic mean value of n (<100) real numbers\n");
    printf("\nInput the number of terms, n=");
    scanf("%d",&n);
    printf("\nInput the terms\n");
    for ( i=0, sum=0; i<n; ++i)
    {
        printf("a[%2d]=", i);
        scanf( "%f",&a[i]);
        sum+=a[i];
    }
    mean=sum/n;
    printf("\nMEAN=%g\n", mean);
    return 0;
}
