#include <stdio.h>

// expression evaluation
double eval(double a, double b, char op)
{
    switch (op)
    {
    case '+':
        return a + b;
    case '-':
        return a - b;
    case '*':
        return a * b;
    case '/':
        return a / b;
    default :
        fprintf(stderr, "Invalid operation %c\n", op);
    }
    return 0;
}

