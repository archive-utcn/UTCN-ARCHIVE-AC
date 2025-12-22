#include <stdio.h>
#include <conio.h>
#include <iostream.h>

typedef char sirc[12];

sirc p[100];

float sir[200];
int dim=0;
int n=0;

void citeste(char x[])
{

}

void scrie()
{
 
}

int  main(void)
{
     printf("Numarul de fisiere: ");
     scanf("%i",&n);
     for(int i=1;i<=n;i++)
     {
             printf("fisieru %i...",i);
             scanf("%s",p[i]);        
     }
     for(int i=1;i<=n;i++) citeste(p[i]);
     scrie();
     getch();     
}
