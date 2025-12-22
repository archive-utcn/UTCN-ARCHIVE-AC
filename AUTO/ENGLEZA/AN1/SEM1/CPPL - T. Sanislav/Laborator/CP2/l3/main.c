#include <stdio.h>
#include <stdlib.h>

int main()
{
    int integer_no = 0;

    printf("Enter an integer: ");
    scanf("%d", &integer_no);
    (integer_no%2 == 0) ? printf("Even integer"): printf("Odd integer");

    return 0;

}
