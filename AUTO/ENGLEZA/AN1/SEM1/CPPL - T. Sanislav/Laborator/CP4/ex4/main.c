/* +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
Baltaretu Teodor Stelian, Turtulea Alexandra Georgina
Write a program to find the reverse of a string using pointers.
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+- */

#include <stdio.h>
#include <stdlib.h>
#define SIZE 50 //define the maximum SIZE of the string as 50

char *str_rev(char *str, int len) //define a function to revert the string
{
    char *fc = str;              //takes the first character of the string
    char *lc = str + len - 1;    //takes the last character of the string

    while (fc < lc) {            //as long as fc<lc we design a sorting algorithm that switches the letters
        char temp = *fc;         //a temporary variable is used to perfom the sort, while at first tkaes fc's value
        *fc++ = *lc;             //fc takes lc's value and then increments
        *lc-- = temp;            //lc takes temp's value and then decrements
    }

    return str;                  //return the reversed string
}

int main()
{
    char string[SIZE]; //define the char string by SIZE = 50, which was global defined
    printf("Input the desired string: ");
    gets(string); //input the string
    printf("Reversed string is: ");
    printf("%s", str_rev(string, strlen(string))); //output the reverse of the string using the function str_rev
                                                   // and "string", "strlen(string)" as arguments (
                                                   //strlen(string) returns the length pf the string
    return 0;
}
