/* Program L7Ex2.c */

#include <stdio.h>
#include <limits.h>

/* The program computes the minimum of a array of integer numbers*/

#define NMAX 100
#define MAXIMUM INT_MAX
int array[NMAX];
int minim(int x, int y)
{
    if (x <= y) return x;
    else return y;
}

int term_min(int arraySize)
{
    if (arraySize  >= 0) return minim(array[arraySize], term_min(arraySize - 1));
    else return MAXIMUM;
}

int main(void)
{
    int i, n;
    printf("\nInput the number of the elements of the array n=");
    scanf("%d",&n);
    printf("\nInput the values of the elements\n");
    for (i=0; i<n; ++i)
    {
        printf("array[%d]=", i);
        scanf("%d", &array[i]);
    }
    printf("\nInput array:\n");
    for (i=0; i<n; ++i)
    {
        printf("%6d", array[i]);
        if ((i+1) % 10 == 0) printf("\n");
    }
    printf("\nThe minimum is %d\n", term_min(n-1));
    printf("\nPress a key!");
    return 0;
}
