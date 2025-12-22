// program care afiseaza spatiul de memorie ocupat ( in octeti ) de tipurile de date
#include <stdio.h>
#include <stdlib.h>

int main()
{
    printf("tipul INT are %d biti \n",sizeof(int)*8);
	printf("tipul FLOAT are %d biti \n",sizeof(float)*8);
	printf("tipul CHAR are %d biti \n",sizeof(char)*8);
	printf("tipul DOUBLE are %d biti \n",sizeof(double)*8);
	printf("tipul LONG INT are %d biti \n",sizeof(long int)*8);
    return 0;
}
