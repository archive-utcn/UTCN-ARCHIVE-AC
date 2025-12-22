#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main()
{  /* int var1 = 5;
    int *int_ptr = &var1;

    printf("Adress of var1: %d\n" , &var1);
    printf("Adress of int_ptr: %d\n" , int_ptr);
    printf("Adress of int_ptr: %d\n" , &int_ptr);
    printf("Value of var1: %d\n" , *int_ptr);
    printf("Value of *int_ptr: %d\n" , *int_ptr);
    printf("Value of &*int_ptr: %d and *&int_ptr: %d\n" , &*int_ptr);
    return 0;
    */

    /*
    int array[5] = {1, 2, 3, 4, 5};
    int *array_ptr = array;
    int i = 0;
    int offset = 0;
    printf("Array printed with : \n Array subscript notation \n");
    for(i=1; i<=5; i++)
        printf("array[%d] = %d", i , array[i]);
        printf("\nArray offset notation\n");
        for(offset = 0; offset < 5; offset++)
            printf ("*(array + %d) = %d\n", offset, *(array + offset));
        printf("\n Pointer subscript notation\n");
        for (i = 0; i < 5; i++)
        printf("array_ptr[%d] = %d\n", i, array_ptr[i]);
        printf("\nPointer offset notation\n");
        for (offset = 0; offset < 5; offset++)
            printf("*(array_ptr + %d ) = %d\n", offset, *(array_ptr + offset));


       char *string[3] = {"computer", "programming", "C language"};
       int i = 0;
       for(i=0; i < 3; i++) printf("Value of string[%d] is %s \n", i, string[i]);
*/

    /*
    int num = 45, *ptr =  NULL, **ptr2ptr = NULL;
    ptr = &num;
    ptr2ptr = &ptr;

    printf("%d", **ptr2ptr);

    */
    //3
    /*double value1 = 50.0;
    double value2 = 0.0;

    double *double_ptr;
    *double_ptr = value1;
    printf("%f", *double_ptr);
    value2 = *double_ptr;
    printf("%f", value2);
    printf("&p", &value1);
    printf("%p", &double_ptr); */

    //4
    char s[30];
    int length = 0;
    char *reverse_ptr[30];
    int i = 0, j = 0;

    printf("enter the string ");
    gets(s);
    length = strlen(s);

   j = 0;

    for(i = length; i >= 0; i--)
    {
        *reverse_ptr[j] = s[i];

    }





}
