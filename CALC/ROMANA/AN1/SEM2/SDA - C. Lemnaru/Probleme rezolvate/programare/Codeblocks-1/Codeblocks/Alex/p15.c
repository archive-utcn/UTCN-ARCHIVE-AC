#include <stdio.h>
#include <conio.h>

int prim(int n)
{
    int i,p,prim;
    for(p=2;p<=n;p++)
    {
    prim=1;
    for(i=2;i<=p;i++)
    {
        if(p%i==0)
        prim=0;}
        if(prim==1)
        printf("prim= %d\n",p);
}}
int main()
{
    int n;
    printf("n= ");
    scanf("%d",&n);
    printf("Nr prime:",prim(n));
}
