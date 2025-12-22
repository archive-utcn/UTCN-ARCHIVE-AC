/*Sa se scrie un program care citeste numerele întregi a,b,c,d si determina cea mai mare dintre
fractiile a/b si c/d.*/
#include <stdio.h>
#include <stdlib.h>

int main()
{   int a,b,c,d,nr;
    printf("a=");
    scanf ("%d",&a);
    printf ("b=");
    scanf ("%d",&b);
    printf("c=");
    scanf ("%d",&c);
    printf ("d=");
    scanf ("%d",&d);
    nr=a*d-c*b; /* calculam numaratorul fractie a/b-c/d. daca e mai mic ca 0 prima fractie e mai mare, daca e 0 fractiile sunt egale, daca e mai mare ca 0 prima fractie e mai mica)*/
    if (nr==0)
    printf("fractii egale");
    else if (nr>0)
         printf ("prima fractie e mai mare");
         else
         printf ("a doua fractie e mai mare");
    return 0;
}
