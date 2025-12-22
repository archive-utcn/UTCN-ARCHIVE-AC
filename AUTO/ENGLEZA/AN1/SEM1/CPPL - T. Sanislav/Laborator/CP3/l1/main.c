#include <stdio.h>
#include <stdlib.h>

int main()
{

    int first_integer = 0, second_integer = 0, maximum = 0;
    printf("Enter two integers: ");
    scanf("%d %d", &first_integer, &second_integer);
    maximum = first_integer > second_integer ? first_integer : second_integer;\
    printf("The maximum of %d and %d is %d.\n", first_integer, second_integer, maximum);
    return 0;
}
