/* +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
Baltaretu Teodor Stelian, Turtulea Alexandra Georgina
Write a program which reads a real value for n and then computes the value for the
function:
f(n)= {n*n + 4n + 8 if n < −1
       0 if n = −1
       n*n − 5n + 1 if n > −1
      }
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+- */


#include <stdio.h>
#include <stdlib.h>

int main()
{
    float n = 0.0f;

    //read the number n from keyboard
    printf("Enter a real number: ");
    scanf("%f", &n);

    //verify the given conditions for the function f(n) and output the solution
    if (n < -1)
    {
        printf("%1.f", n * n + 4 * n + 8);
    }

        else if (n > -1)
        {
         printf("%1.f", n * n - 5 * n + 1);
        }

            else
            {
                printf("0");
            }

    return 0;
}
