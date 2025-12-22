#include <stdio.h>
#include <stdlib.h>

int main()
{
    int integer_no = 0;

    printf("Enter an integer: ");
    scanf("%d", &integer_no);
    if (integer_no & 1) {
        printf("%d is odd.", integer_no);
    }
    else {
        printf("%d is even.", integer_no);
    }

    return 0;
}
