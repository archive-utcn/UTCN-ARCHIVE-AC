#include <stdio.h>
#include <stdlib.h>

int main()
{
    int grade = 0;

    printf("Enter the number of points obtained at the exam: ");
    scanf("%d", &grade);
    if((grade >= 0) && (grade <= 100))
    {
        if (grade >= 90)
            printf("Passed with A.\n");
        else if (grade >= 80)
            printf("Passed with B.\n");
        else if (grade >= 70)
            printf("Passed with C.\n");
        else if (grade >= 60)
            printf("Passed with D.\n");
        else
            printf("Failed.\n");
    }
    else
    {
        printf("You entered an invalid grade!");
    }
    return 0;
}
