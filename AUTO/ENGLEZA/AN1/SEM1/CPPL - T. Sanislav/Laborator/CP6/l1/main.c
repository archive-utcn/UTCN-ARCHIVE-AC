#include <stdio.h>
#include <stdlib.h>

#include "Matrix.h"

int main()
{
    int m = 0, n = 0, p = 0;
    int **matrix1, **matrix2, **result;

    printf("Please input the number of rows of the FIRST matrix: ");
    scanf("%d",&m);
    printf("Please input the number of column/rows of the FIRST matrix/SECOND matrix: ");
    scanf("%d",&n);
    printf("Please input the number of columns of the SECOND matrix: ");
    scanf("%d",&p);

    matrix1= alloc_matrix(m,n);
    matrix2= alloc_matrix(n,p);

    read_matrix(matrix1,m,n,"First matrix");
    print_matrix(matrix1,m,n,"First matrix");
     read_matrix(matrix2,n,p,"Second matrix");
    print_matrix(matrix2,n,p,"Second matrix");

    result = multiply_matrix(matrix1, matrix2, m ,n, p);
    print_matrix(result,m,p,"Product");

    free_matrix(result,n);
    free_matrix(matrix2,n);
    free_matrix(matrix1,m);

    return 0;
}
