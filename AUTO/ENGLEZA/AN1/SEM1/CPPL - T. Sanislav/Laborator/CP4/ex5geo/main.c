#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n = 0, i = 0, j = 0, num = 0, array[n], aux;
  //  int *array_ptr = array;

    printf("How many numbers will be in the string?\n");
    scanf("%d",&n);
    printf("Input the string: \n");
    for (i = 0; i < n; i++) {
        scanf("%d", &num);
        *(array + i) = num;
    }

    for (j = 0; j < n - 1; j++)
    for (i = 0; i < n - j - 1; i++) {
        if ( *(array + i) > *(array + i + 1)) {
            aux = *(array + i + 1);
            *(array + i + 1) = *(array + i);
            *(array + i) = aux;
        }
    }

    printf("In ascending order\n");

    for ( i = 0; i < n; i++) {
        printf("%d", *(array + i));
    }
    return 0;
}
