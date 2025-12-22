/* +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
Baltaretu Teodor Stelian, Turtulea Alexandra Georgina
Write a program that shows a menu offering the choice of addition (+), subtraction
(-), multiplication (*) or division (/). After getting a choice, the program asks for
two real numbers, and then performs the requested operation. The program should
allow the user to repeat the operation until the 'q' key is pressed.
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+- */



#include <stdio.h>
#include <stdlib.h>

int main()
{
    //declare variables as requested
    float a = 0.0f, b = 0.0f;
    char c;

    //output the menu "+,- ,* ,/" for the user and read one of the options from keyboard
    printf("Enter one of the following : +,- ,* ,/ \n");
    scanf(" %c", &c);

    while ( c!= 'q') //codition stated in
    {
    printf("Enter two numbers: \n");
    scanf(" %f", &a);
    scanf(" %f", &b);

    switch(c)
    {
    case '+':
    printf("%.0f", a + b);
    break;
    case '-':
    printf("%1.f", a - b);
    break;
    case '*':
    printf("%1.f", a * b);
    break;
    case '/':
    printf("%f" , a / b);
    break;
    }

    printf("\nEnter one of the following : +,- ,* ,/ \n");
    scanf(" %c", &c);
    }
    return 0;

}
