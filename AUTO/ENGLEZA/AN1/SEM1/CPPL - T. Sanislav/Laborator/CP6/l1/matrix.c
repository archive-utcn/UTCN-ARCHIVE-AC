#include "Matrix.h"

int **alloc_matrix(int m, int n) {
    int **matrix = NULL;
    int i = 0;

        matrix = (int **) malloc(m * sizeof(int *));
        if (!matrix) return NULL;
        for (i=0; i<m; i++) {
            *(matrix + i) = (int *) malloc(n * sizeof(int));
            if (!(*(matrix+i))) return NULL;
        }
        return matrix;
}

//-----------

void free_matrix(int **matrix, int m) {
    int i=0;
    for (i=0;i<m;i++) {
    free(*(matrix+i));
    }
    free(matrix);
}

//-------

int read_matrix(int **matrix, int m, int n, const char *name) {
    int i=0, j=0;
    for (i=0;i<m;i++)
    for (j=0;j<n;j++){
        printf("%s[%d][%d] = ", name, i, j);
        if (1!=scanf("%d", *(matrix + i) + j))
                    return 0;

    }
    return 1;
}

//------

void print_matrix(int **matrix, int m, int n, const char *name) {
int i=0, j=0;
printf("Matrix %s is: \n-------------------------------------- \n", name);
    for (i=0;i<m;i++){
    for (j=0;j<n;j++){
            printf("%d", *(*(matrix+i)+j));
    }
    printf("\n");
    }
    printf("------------------------------------ \n");
}

////-----------

int **multiply_matrix(int **matrix1, int **matrix2, int m, int n,  int p) {
    int i=0, j=0, k=0;
    int **result=alloc_matrix(m,p);//allocate result matrix
    for (i=0;i<m;i++)
    for (j=0;j<p;j++)
        *(*(result+i)+j)=0;
    for (i=0;i<m;i++)
    for (j=0;j<n;j++)
    for (k=0;k<p;k++)
        *(*(result+i)+k)+=(*(*(matrix1+i)+j))*(*(*(matrix2+j)+k));
    return result;
}








