/* +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
Baltaretu Teodor Stelian, Turtulea Alexandra Georgina
Write a program to sort an array of integers in ascending order using pointers. Use
the "bubble sort" sorting algorithm (it works by repeatedly swapping the adjacent
elements if they are in the wrong order).
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+- */


#include <stdio.h>
#include <stdlib.h>

int main()
{
   int array [5] = {3, 1, 5, 2, 4}; //define an array with 5 elements written in random order
    int *array_ptr, *array_ptr2;
    int i = 0;
    int step, temp;

    for(step = 0 ; step <4; ++step) //number of needed steps to bubble sort the array
    for(i=0; i<5-step-1; ++i)       //verify at each position if the following number is smaller than the current
    {
        array_ptr = array[i];
        array_ptr2 = array[i+1];
        if( array_ptr > array_ptr2)   /* To sort in descending order, change > to < in this line. */
        {
            temp = array[i];
            array[i] = array[i+1];
            array[i+1] = temp;
        }
    }
    printf("In ascending order: ");
    for(i = 0; i<5; ++i)
         printf("%d", array[i]);


    return 0;
    }
