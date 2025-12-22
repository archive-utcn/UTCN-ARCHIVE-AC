#ifndef MATRIX_H_INCLUDED
#define MATRIX_H_INCLUDED



#include <stdlib.h>

extern int **alloc_matrix(int, int);
extern void free_matrix(int**, int);
extern int read_matrix (int**, int, int, const char*);
extern void print_matrix(int**,int,int,const char*);
extern int **multiply_matrix(int**,int**,int, int, int);

#endif // MATRIX_H_INCLUDED

