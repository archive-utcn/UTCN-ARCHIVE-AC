#include <conio.h>
#include <stdio.h>
#define MAXN 100

struct POINT
{
    int x,y;
    int ind;    
};

struct MUCHIE
{
    int a,b;
    float c;
    int sel;   
};

extern void citeste(POINT a[MAXN], int& n);
extern void afisare(POINT a[MAXN],int n,MUCHIE c[MAXN],int dimc,float ct);
extern void cost_muchie(POINT a[MAXN],int n,MUCHIE c[MAXN],int& dimc);
extern void sorteaza(MUCHIE c[MAXN], int dimc);
extern void kruskal(MUCHIE c[MAXN], int dimc, int n, float& ct);

int main(void)
{
    int n=0,dimc=0;
    float costtot=0;
    POINT a[MAXN];
    MUCHIE c[MAXN];
    //citeste datele de intrare n shi coordonatele oraselor
    citeste(a,n);
    //formeaza matricea costurilor
    cost_muchie(a,n,c,dimc);
    sorteaza(c,dimc);
    //gaseste arborele partial de cost minim    
    kruskal(c,dimc,n,costtot);
    //afisare solutie
    afisare(a,n,c,dimc,costtot);
    getch();
    return 0; 
}//main
