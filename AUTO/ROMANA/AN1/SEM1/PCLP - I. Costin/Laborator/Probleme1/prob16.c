/* 16. Se citeste un numar natural n. Sa se gaseasca cel mai mare patrat perfect mai mic sau egal cu n.
Aceeasi problema, dar sa se indice numarul prim cel mai mic, dar mai mare sau egal cu numarul
citit.*/
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int prim(int n)
{
    int i,x=0;
    for(i=2;i<=n/2;i++)
    if(n%i==0)
    x=1;
    if(x==0)
    return(1);
    else
    return(0);
}
int main()
{
    int n,x;
    printf("n=");
    scanf("%d",&n);
    x=sqrt(n);
    printf("%d \n",x*x);
    do
    {
        x=prim(n);
        n++;
    }
    while(x!=1);
    printf("%d",n-1);
    return(0);
}
