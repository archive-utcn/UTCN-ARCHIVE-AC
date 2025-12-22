#include <stdio.h>
#include <conio.h>
#define MAXN 20

typedef int MULTIME[50];

extern void citeste(MULTIME m[MAXN],int& n);
extern void afisare(MULTIME m,int n);
extern void reunion(MULTIME m[MAXN],int n,MULTIME rez,int& dr);
extern void intersect(MULTIME m[MAXN],int n,MULTIME rez,int& dr);
extern void scad(MULTIME m[MAXN],int n,MULTIME rez,int& dr);

int main(void)
{
    int n=0,dr=0;
    MULTIME m[MAXN];
    int rez[200]; 
    //citire multimi
    citeste(m,n);
    //reuniune
    reunion(m,n,rez,dr);
    printf("Reuniunea:\n");
    afisare(rez,dr);
    //intersectie
    intersect(m,n,rez,dr);
    printf("Intersectia:\n");
    afisare(rez,dr);
    //scadere : ce are prima shi nu are a doua
    scad(m,n,rez,dr);
    afisare(rez,dr);
    getch();
    return 0;    
}
