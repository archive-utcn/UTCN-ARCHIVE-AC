#include<stdlib.h>
#include<stdio.h>
#include<pthread.h>
int rows, cols;
int *mat;
int *vec;

void *calculate(void *line) {
	int l = *(int *)line;
	int j, sum = 0;
	for( j = 0; j < cols; j++) {
		int offset = l * cols + j;
		sum += mat[offset];
	}
	vec[l] = sum;	
	return NULL;
}

int main() {
	int finalsum = 0;
	int value;
	printf("Rows: ");
	scanf("%d", &rows);
	printf("Cols: ");
	scanf("%d", &cols);
	vec = (int*)malloc(rows * sizeof(int));
	mat = (int*)malloc(rows * cols * sizeof(int));
	int i, j;
	for( i = 0; i < rows; i++) {
                for( j = 0; j < cols; j++){
			printf("Matrice[%d][%d]= ", i, j);
			scanf("%d", &value);
                        int offset = i * rows + j;
                        mat[offset] = value;
                }
        }
	for(i=0;i<rows;i++) {
		for(j=0;j<cols;j++) {
			printf("%d ", mat[i * rows + j]);		
                }
	printf("\n");
        }
	pthread_t t1[rows];
        for( i = 0; i < rows; i++) {
                pthread_create(&t1[i], NULL, calculate, &i);
                pthread_join(t1[i], NULL);
        }
	for( i = 0; i < rows; i++) {
		printf("%d\n", vec[i]);
                finalsum += vec[i];
	}
	printf("Suma matricei este: %d\n", finalsum);
	free(vec);
	free(mat);
	return 0;
}








