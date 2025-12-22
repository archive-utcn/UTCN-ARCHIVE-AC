#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "defs.h"

void gcd_poly(float *g, int &gdeg, float *xx, int xxdeg, float *yy, int yydeg);
void scm_poly(float *s, int &sdeg, float *xx, int xxdeg, float *yy, int yydeg);

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
extern int     iszero(float *p, int deg);

void gcd_poly(float *g, int &gdeg, float *xx, int xxdeg, float *yy, int yydeg)
{
    float x[MAX_DEG + 1], y[MAX_DEG + 1], q[MAX_DEG + 1], r[MAX_DEG + 1];
    int xdeg, ydeg, qdeg, rdeg;
    
    copy_poly(x, xdeg, xx, xxdeg),
//    printf("\nx = "); print_poly(x, xdeg), getch();
    copy_poly(y, ydeg, yy, yydeg);
//    printf("\ny = "); print_poly(y, ydeg), getch();
    div_poly(q, qdeg, r, rdeg, x, xdeg, y, ydeg);
//    printf("\nr = "); print_poly(r, rdeg), getch();
    
//    while (!(r[0] == 0 && rdeg == 0)) // !!! WARNING !!! - FIX BUG IN POLYS.CPP -- probably fixed
    while (!iszero(r, rdeg))
    {
        copy_poly(x, xdeg, y, ydeg);
 //       printf("\nx = "); print_poly(x, xdeg), getch();
        copy_poly(y, ydeg, r, rdeg);
 //       printf("\ny = "); print_poly(y, ydeg), getch();
        div_poly(q, qdeg, r, rdeg, x, xdeg, y, ydeg);
 //       printf("\nr = "); print_poly(r, rdeg), getch()
        ;
    }
    
    copy_poly(g, gdeg, y, ydeg);
}

void scm_poly(float *s, int &sdeg, float *xx, int xxdeg, float *yy, int yydeg)
{
    float x[MAX_DEG + 1], y[MAX_DEG + 1], q[MAX_DEG + 1], r[MAX_DEG + 1];
    int xdeg, ydeg, qdeg, rdeg;

    gcd_poly(q, qdeg, xx, xxdeg, yy, yydeg); // q = GCD(xx, yy);
    mul_poly(x, xdeg, xx, xxdeg, yy, yydeg); // x = xx * yy;
    div_poly(s, sdeg, r, rdeg, x, xdeg, q, qdeg); // s = x / q;
}


