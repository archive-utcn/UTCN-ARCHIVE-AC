#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "defs.h"

// evaluate
extern float   value_poly(float *p, int deg, float x);
// r/w
extern void    read_poly(float *p, int &deg);
extern void    print_poly(float *p, int deg);
// filling / moving
extern void    clear_poly(float *p, int Degree);
extern void    copy_poly(float *dest, int &ddest, float *src, int dsrc);
// operations
extern void    add_poly(float *r, int &deg3, float *a, int deg1, float *b, int deg2);
extern void    sub_poly(float *r, int &deg3, float *a, int deg1, float *b, int deg2);
extern void    mul_poly(float *r, int &deg, float *a, int deg1, float *b, int deg2);
extern void    div_poly(float *q, int &qdeg, float *r, int &rdeg, float *a, int deg1, float *b, int deg2);
// more complex functions
extern void gcd_poly(float *g, int &gdeg, float *xx, int xxdeg, float *yy, int yydeg);
extern void scm_poly(float *s, int &sdeg, float *xx, int xxdeg, float *yy, int yydeg);

int main()
{
    float A[100], B[100], GCD[100], SCM[100];
    int DegA, DegB, DegGCD, DegSCM;
    
    printf("Enter polynomial A : \n");
    read_poly(A, DegA);
      
    printf("Enter polynomial B : \n");
    read_poly(B, DegB);

    gcd_poly(GCD, DegGCD, A, DegA, B, DegB);
    printf("GCD(A, B) = "), print_poly(GCD, DegGCD);
    
    scm_poly(SCM, DegSCM, A, DegA, B, DegB);
    printf("SCM(A, B) = "), print_poly(SCM, DegSCM);

    getch();
    return 0;
}

