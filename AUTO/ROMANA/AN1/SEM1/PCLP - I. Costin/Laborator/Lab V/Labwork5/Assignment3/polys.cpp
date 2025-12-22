#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

// evaluate
float   value_poly(float *p, int deg, float x);
// r/w
void    read_poly(float *p, int &deg);
void    print_poly(float *p, int deg);
// filling / moving
void    clear_poly(float *p, int Degree);
void    copy_poly(float *dest, int &ddest, float *src, int dsrc);
// operations
void    add_poly(float *r, int &deg3, float *a, int deg1, float *b, int deg2);
void    sub_poly(float *r, int &deg3, float *a, int deg1, float *b, int deg2);
void    mul_poly(float *r, int &deg, float *a, int deg1, float *b, int deg2);
void    div_poly(float *q, int &qdeg, float *r, int &rdeg, float *a, int deg1, float *b, int deg2);
// comparison
int     iszero(float *p, int deg);

void read_poly(float *p, int &deg)
{
    printf("Degree = ");
    scanf("%d", &deg);
    
    for (int i = deg; i >= 0; --i)
        printf("coef[%d] = ", i),
        scanf("%f", p + i);
}

float value_poly(float *p, int deg, float x)
{
    float ret = 0;
    
    for (int i = deg; i >= 0; --i)
        ret = ret*x + p[i];
    
    return ret;
}

void print_poly(float *p, int deg)
{
     char s[10];
     strcpy(s, "");
     
     for (int i = deg; i >= 0; i--)
         printf("%s%g*x^%d", s, p[i], i), strcpy(s, " + ");
     
     printf("\n");
}

int min(int x, int y) { return x < y ? x : y; };
int max(int x, int y) { return x > y ? x : y; };

void clear_poly(float *p, int Degree)
{
    for (; Degree >= 0 ; --Degree)
        p[Degree] = 0;
}

void copy_poly(float *dest, int &ddest, float *src, int dsrc)
{
    ddest = dsrc;
    memmove(dest, src, (dsrc + 1) * sizeof(src[0]));
}

void add_poly(float *r, int &deg3, float *a, int deg1, float *b, int deg2)
{
     int i, d;
     
     d = min(deg1, deg2);
     
     for (i = 0; i <= d; ++i)
         r[i] = a[i] + b[i];
     
     if (deg1 < deg2)
        for (; i <= deg2; ++i)
            r[i] = b[i];
     else
         for (; i <= deg1; ++i)
             r[i] = a[i];
             
     deg3 = max(deg1, deg2);
}

void sub_poly(float *r, int &deg3, float *a, int deg1, float *b, int deg2)
{
     int i, d;
     
     d = min(deg1, deg2);
     
     for (i = 0; i <= d; ++i)
         r[i] = a[i] - b[i];
     
     if (deg1 < deg2)
        for (; i <= deg2; ++i)
            r[i] = -b[i];
     else
         for (; i <= deg1; ++i)
             r[i] = a[i];
        
     deg3 = max(deg1, deg2);
     for (; deg3; --deg3)
          if (r[deg3]) break;
}

void mul_poly(float *r, int &deg, float *a, int deg1, float *b, int deg2)
{
     int i, j;
     
     clear_poly(r, deg1 + deg2);
     
     for (i = 0; i <= deg1; ++i)
         for (j = 0; j <= deg2; ++j)
             r[i + j] += a[i] * b[j];
     
     deg = deg1 + deg2;
}

void div_poly(float *q, int &qdeg, float *r, int &rdeg, float *a, int deg1, float *b, int deg2)
{
     int i, j;
     float rap;
     
     copy_poly(r, rdeg, a, deg1);
//     printf("poly_r : "), print_poly(r, rdeg);
//     printf("poly_b : "), print_poly(b, deg2);
     
     for (i = deg1; i >= deg2; --i)
     {
         if (b[deg2] == 0) { printf("Warning !!! Division by 0\n"); getch(); return ; };
         rap = r[i] / b[deg2];
         
         for (j = deg2; j >= 0; --j)
             r[i - (deg2 - j)] -= b[j] * rap;
         
         q[i - deg2]  = rap;
     }
     
     if (deg1 < deg2) { qdeg = 0; clear_poly(q, 0); };
     qdeg = deg1 - deg2;
     for (rdeg = max(deg2 - 1, 0); rdeg > 0; --rdeg) 
         if (r[rdeg]) break;
     

}

int     iszero(float *p, int deg)
{
//    printf("iszero : %d\n");
    for (deg; deg >= 0; --deg)
        if (p[deg]) return 0;
    
    return 1;
}

