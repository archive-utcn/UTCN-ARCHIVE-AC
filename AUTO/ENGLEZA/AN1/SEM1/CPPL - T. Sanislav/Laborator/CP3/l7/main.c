#include <stdio.h>
#define MAX_DIGIT 9

int main()
{
    int sum = 0, digit = 0;

    printf("Computes the sum of the digits from 0 to %d. \n", MAX_DIGIT);
    while (1) {
        if (digit>MAX_DIGIT)
            break;
        sum += digit;
        digit++;
    }
    printf("The sum of the digits is %d.", sum);
    return 0;
}
