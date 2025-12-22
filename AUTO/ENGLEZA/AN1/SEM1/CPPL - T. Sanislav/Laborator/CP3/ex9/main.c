/* +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
Baltaretu Teodor Stelian, Turtulea Alexandra Georgina
Write a program that reads integers until 0 is entered. After input terminates, the
program reports the total number of even integers (excluding the 0) entered, the
average value of the even integers, the total number of odd integers entered, and the
average value of the odd integers.
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+- */


#include <stdio.h>
#include <stdlib.h>

int main()
{
    //declare variables: n - input integers from keyboard, odd - count odd numbers, even - count even numbers;
    //                   me - average of even numbers, mo - average of off numbers;
    int n = 1, odd = 0, even = 0;
    float me = 0.0f, mo = 0.0f;

    //read integers until 0 is entered
    printf("Input integer numbers from keyboard. When you finish enter 0.");\

    while(n) //condition that verifies whether the input is 0 or not
    {
        scanf("%u",&n);
        if (n % 2 == 0) //verify the parity of each input
        {
            even++; //count even numbers
            me+=n; //sum of even numbers
        }
        else
        {
            odd++; //count odd numbers
            mo+=n; //sum of odd numbers
        }
    }
    //calculate the average of even and odd numbers by dividing the sum of o/e numbers at the counter of o/e numbers
    me/=(even-1);
    mo/=odd;

    printf("The number of even numbers is: %d \n", even-1);
    printf("The number of odd numbers is: %d \n", odd);
    printf("The average of even numbers is: %1.f \n", me);
    printf("The average of odd numbers is: %1.f\n", mo);

    return 0;
}
