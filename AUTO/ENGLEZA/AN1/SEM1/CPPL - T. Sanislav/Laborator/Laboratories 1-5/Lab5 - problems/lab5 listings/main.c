#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define SIZE 3
#define ROWS 3
#define COLUMNS 3

/*void print_element(int);
void print_mult_arra(int, int*, int);
void print_matrix(int, int, const int (*)[COLUMNS]);
void function1(int a);
void function2(int b);
void function3(int c);
/*//square function deffinition return a square of a paramiter
    int square(int y)
        {
            return y * y; //return the square of a no y
        }
    //the same thing but with a cube
    void cube_refference(double *number_ptr)
    {
        *number_ptr = pow(*number_ptr, 3);
    }
    //print_mult_array_function deffinition does not return a value
    void print_mult_array(int size, int*ptr, int value)
    {
        int i = 0;
        for(i = 0; i < size; i++0)
            printf("\t %d", *ptr * value);
            ptr++;
    }
    //print matrix function definition does not return a value
    void print_matrix(int rows, int columns, const int (*ptr[columns]))
    {   int i = 0, j = 0;
        for(i = 0; i < rows; i++)
        {
            for(j = 0; j< columns; j++)
            printf("\t %d", ptr[i][j]);
            printf("\n");
        }
    } */
   /* double cube_value(double);
    void cube_refference(double*);

int main()
{
    /* double number = 5.0;

     printf("the original value of number is %.2f.\n", number);
     number = cube_value(number);
     printf("the new value of nmber is %.2f.\n", number);
     return 0; */


    /* double number = 5.0;

     printf("the original value of number is %.2f.\n", number);
     cube_refference(&number);
     printf("the new value of nmber is %.2f.\n", number);
     return 0;
     */
  int main()
     {

     void(*f_ptr[3])(int) ={function1, function2, function3}
     int choice = 0;

     printf("Enter a value between 1 and 3, 4 to the end: ")
     scanf("%d", &choice);
     while(choice >= 1 && choice < 4)
     {  (&f_ptr|choixe - 1|)(choice);
     printf("Enter a number between 0 and 2 and 3 to the end: ");
     scanf("%d" , &choice);
    }1

    }

double cube_value(double number)
{
    return pow(number, 3);
}
void cube_refference(double *number_ptr)
{
    *number_ptr = pow(*number_ptr, 3);
}*/

void print_int(int);
int main()
{
   /* int array[SIZE] = {1, 2, 3};
    int matrix[ROWS][COLUMNS] = {1, 2, 3, 4, 5, 6,7, 8, 9};

    printf("the last element of the array: ");
    print_element(array[SIZE - 1]);
    printf("the array elements multiplied by 2:\n");
    print_mult_array(SIZE, array, 2);
    printf("\nThe matrix elements: \n");
    print_matrix(ROWS, COLUMNS, matrix);
    return 0;
    */
    void(*f_ptr)(int);
    f_ptr = &print_int;
    f_ptr(2);
    (*f_ptr)(2);
}

void print_element(int element)
{
    printf("%d\n", element);

}

void print_mult_array(int size, int*ptr, int value)
{
    int i = 0;
     for (i = 0; i< size; i++)
     {
         printf("\t %d", *ptr * value);
         ptr++;

     }
}
void print_int(int x)
{
    printf("%d\n", x);
}
