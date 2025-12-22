/* +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
Baltaretu Teodor Stelian, Turtulea Alexandra Georgina
Write a program to set the n th bit of an unsigned integer number read from the
keyboard. Use the following: left shift 1, n times, and then perform bitwise OR with
the unsigned integer number.
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+- */


#include <stdio.h>

int main()
{
    int num = 0, n = 0, newNum = 0;
    //define 3 variables - initialized with 0, num is for the input number, n is for the bit we want to change and newNum is the output variable

    /* Input number from user */
    printf("Enter any number: ");

    scanf("%d", &num);

    /* Input bit position you want to set */
    printf("Enter nth bit to set (0-31): ");
    scanf("%d", &n);

    /* Left shift 1, n times and perform bitwise OR with num */
    newNum = (1 << n) | num;

    /* Output of the program */
    printf("Bit set successfully.\n\n");
    printf("Number before setting %d bit: %d (in decimal)\n", n, num);
    printf("Number after setting %d bit: %d (in decimal)\n", n, newNum);

    return 0;
}
