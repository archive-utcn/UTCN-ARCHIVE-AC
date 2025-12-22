#include <stdio.h>
#include <limits.h>
#include <float.h>

int main()
{
    printf("__________________________________________________________\n");
    printf("|Data type\t\t Bytes\t| Range \t\t\t|\n");
    printf("__________________________________________________________\n");

    printf("|char\t\t\t| %u\t| %d to %d\t\t\t|\n", sizeof(char), SCHAR_MIN, SCHAR_MAX);
    printf("|unsigned char\t\t| %u\t| %d to %d\t\t\t|\n", sizeof(unsigned char), 0, UCHAR_MAX);
    printf("__________________________________________________________\n");

    printf("|short int\t\t| %u\t| %d to %d\t\t|\n", sizeof(short int), SHRT_MIN, SHRT_MAX);
    printf("|unsigned short int\t| %u\t| %d to %d\t\t\t|\n", sizeof(unsigned short int), 0, USHRT_MAX);
    printf("__________________________________________________________\n");

    printf("|int\t\t\t| %u\t| %d to %d\t|\n", sizeof(int), INT_MIN, INT_MAX);
    printf("|unsigned int\t\t| %u\t| %d to %u\t\t|\n", sizeof(unsigned int), 0, UINT_MAX);
    printf("__________________________________________________________\n");

    printf("|long int\t\t| %u\t| %d to %d\t|\n", sizeof(long int), LONG_MIN, LONG_MAX);
    printf("|unsigned long int\t| %u\t| %d to %u\t\t|\n", sizeof(unsigned long int), 0, LONG_MAX);
    printf("__________________________________________________________\n");

    printf("|float\t\t\t| %u\t| %.3e to %.3e\t|\n", sizeof(float), FLT_MIN, FLT_MAX);
    printf("|double\t\t\t| %u\t| %.3e to %.3e\t|\n", sizeof(double), DBL_MIN, DBL_MAX);
    printf("|long double\t\t| %u\t| %.3Le to %.3Le\t|\n", sizeof(long double), LDBL_MIN, LDBL_MAX);
    printf("__________________________________________________________\n");

    printf("Precision of float: %u digits.\n",FLT_DIG);
    printf("Precision of double: %u digits.\n",DBL_DIG);
    printf("Precision of long double: %u digits.\n",LDBL_DIG);
    return 0;
}
