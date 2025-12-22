/* Program L04Ex3.c */
/* Operations on integers of the form OPERAND1 operator OPERAND2 */
#include <stdio.h>
#include <stdlib.h>
#define INFINITY 0x7fff
int main()
{
    int operand1, operand2, result;
    char operation;

    printf("\nInput an infix expression without spaces\n");
    scanf("%d%c%d", &operand1, &operation, &operand2);
    switch (operation)
    {
    case '+':
        result=operand1+operand2;
        break;
    case '-':
        result=operand1-operand2;
        break;
    case '*':
        result=operand1*operand2;
        break;
    case '/':
        if (operand2!=0) result = operand1/operand2;
        else if (operand1 >0) result=INFINITY;
        else result=-INFINITY;
        break;
    default:
        exit(1);
    }
    printf("\n%d %c %d = %d\n", operand1, operation, operand2, result);
    return 0;
}
