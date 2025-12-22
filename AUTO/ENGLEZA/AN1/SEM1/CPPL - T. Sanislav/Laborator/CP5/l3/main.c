#include <stdio.h>
#include <math.h>
#define SIZE 3
#define ROWS 3
#define COLUMNS 3

void print_element(int element) {
printf("%d\n", element);
}

void print_mult_array(int size, int *ptr, int value){
int i=0;
for (i=0; i<size; i++){
    printf("\t %d", *ptr * value);
    ptr++;

}
}

void print_matrix(int rows, int columns, const int (*ptr)[columns]) {
int i=0, j=0;
for (i=0; i<rows; i++) {
    for (j=0; j<columns; j++)
        printf("\t %d", ptr[i][j]);
    printf("\n");
}
}
int main()
{
    int array[SIZE]={1,2,3};
    int matrix[ROWS][COLUMNS]={1,2,3,4,5,6,7,8,9};

    printf("The last element of the array: ");
    print_element(array[SIZE - 1]);
    printf("The array elements multiplied by 2: \n");
    print_mult_array(SIZE, array, 2);
    printf("\n The matrix elements: \n");
    print_matrix(ROWS, COLUMNS, matrix);

return 0;
}
