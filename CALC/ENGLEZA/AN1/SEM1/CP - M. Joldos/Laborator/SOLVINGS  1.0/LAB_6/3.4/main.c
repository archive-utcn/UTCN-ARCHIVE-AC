#include <stdio.h>
#include <stdlib.h>

//reading data
double *read_vector(int n)
{
    double *vec = malloc(n * sizeof(double));
    int i;

    for (i = 0; i < n; i++) {
        printf("Enter number %i of %i: ", i + 1, n);
        scanf("%lf", &vec[i]);
    }
    return vec;
}
//display data


//merging two vectors

int main()
{

    return 0;
}
