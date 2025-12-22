#include <stdio.h>
#include <conio.h>

int main()
{
    double x,y;
    int i,n;
    printf("Numar de valori");
    scanf("%d",&n);
    for(i=0;i<n;i++){
    scanf("%lf %lf",&x,&y);
    printf("   x   ");
    printf("y    ");
    printf("x+y   ");
    printf("x-y   ");
    printf("x*y  ");
    printf("x/y\n");

    printf(" %3.0lf %3.0lf  %3.2lf  %3.2lf  %3.2lf  %3.2lf\n",x,y,x+y,x-y,x*y,x/y);
}}
