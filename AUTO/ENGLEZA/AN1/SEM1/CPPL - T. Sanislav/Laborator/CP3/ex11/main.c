#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n = 50, i = 0, j = 0, array[100] = {0}, num = 0, swap = 0;

    printf("Cate numere vrei sa sortezi? ");
    scanf("%d",&n);

    for (i = 0; i < n; i++)
    {
        printf("array[%d] = ", i);
        scanf("%d", &num);
        array[i] = num;
    }

     for (j = 0; j < n-1; j++)
     for (i = 0; i < n-j-1; i++)
     {
         if(array[i] > array[i+1]) { //for descending order change with <
            swap = array[i+1];
            array[i+1] = array[i];
            array[i] = swap;
         }
     }

        printf("In ascending order: ");
        for (i = 0; i < n; i++)
            printf("%d  ", array[i]);

    return 0;
}
