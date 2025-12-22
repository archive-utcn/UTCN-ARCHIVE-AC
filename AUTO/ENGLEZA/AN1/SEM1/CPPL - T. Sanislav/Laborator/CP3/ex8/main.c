/* +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
Baltaretu Teodor Stelian, Turtulea Alexandra Georgina
Write a program to print an unsigned integer in bits using bitwise operators. Use
the bitwise AND operator to combine the value of the unsigned integer with the
1 << 31 mask, and also a shift operator to modify the value of the mask.
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+- */

#include <stdio.h>
#include <stdlib.h>

void main()
{

    unsigned int num = 0;
    printf("Enter Decimal Number : ");
    scanf("%u",&num);
    binary(num);   //function call

}

void binary(unsigned int num)
{

    unsigned int mask = 32768;   //biggest mask in base 2 : [1000 0000 0000 0000]
    printf("Binary Equivalent : ");

    while(mask > 0)
    {
        if((num & mask) == 0 )
            printf("0");
        else
            printf("1");
        mask = mask >> 1 ;  //right shift
   }
}
