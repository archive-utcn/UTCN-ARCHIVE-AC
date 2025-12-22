#include <stdio.h>
#include <stdlib.h>

int main()
{
    char test_char = '\0';
    char test_string[10] = "";
    int test_integer = 0;
    float test_float = 0.0f;

    printf("Enter a character: ");
    scanf("%c", &test_char);
    printf("Character entered = %c\n", test_char);

    printf("Enter a character string: ");
    scanf("%s", test_string);
    printf("Character string entered = %s\n", test_string);

    printf("Enter a integer: ");
    scanf("%d", &test_integer);
    printf("Integer value entered = %d\n", test_integer);
    printf("Octal value = %#o, Hexadecimal value = %#X\n", test_integer, test_integer);


    printf("Enter a float number: ");
    scanf("%f", &test_float);
    printf("Float value entered = %f\n", test_float);

    return 0;


}
