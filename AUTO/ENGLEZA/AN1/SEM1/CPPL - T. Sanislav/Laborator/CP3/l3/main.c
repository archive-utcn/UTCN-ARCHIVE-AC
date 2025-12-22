#include <stdio.h>
#include <stdlib.h>

int main()
{
    int grade = 0;
    printf("Enter one of the following A, a, B, b, C, c, D, d, E, e, F, f: ");
    grade = getchar();
    switch(grade) {
    case 'a':
    case 'A': printf("Grade between 90 and 100.\n");
        break;
    case 'b':
    case 'B': printf("Grade between 80 and 90.\n");
        break;
    case 'c':
    case 'C': printf("Grade between 70 and 80.\n");
        break;
    case 'd':
    case 'D': printf("Grade between 60 and 70.\n");
        break;
    case 'f':
    case 'F': printf("Grade between 0 and 60.\n");
        break;
    default: printf("You entered an invalid grade!\n");

    }

    return 0;
}
