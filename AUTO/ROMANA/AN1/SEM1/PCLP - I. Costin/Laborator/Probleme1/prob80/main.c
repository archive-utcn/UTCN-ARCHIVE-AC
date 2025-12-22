/*Folosind tipul enumerare, sa se introduca tipul boolean. Sa se scrie o functie de ordonare
crescatoare a unui sir folosind metoda bulelor si un semafor de tipul boolean.*/

#include <conio.h>
#include <stdlib.h>
#include <stdio.h>

enum boolean{false,true} ;

void ordonare(int n, int a[])
{
    int aux,i;
    enum boolean gata;
    do{
        gata=true;
        for(i=1;i<n;i++)
        if(a[i]>a[i+1]) {aux=a[i];
                         a[i]=a[i+1];
                         a[i+1]=aux;
                         gata=false;
                         }
      }while(gata==false);
}

int semafor(int p)
{
    enum boolean s;
    int i;
    s=true;
    if(p==0||p==1) s=false;
     else if(p==2||p==3) s=true;
           else if(p%2==0) s=false;
                  else for(i=3;i*i<=p;i+=2)
                         if(p%i==0) s=false;
   return s;
}

int main()
{
    int n, a[20], i,x;
    scanf("%d", &n);

    for(i=1;i<=n;i++)
    scanf("%d", &a[i]);

    ordonare(n,a);

    for(i=1;i<=n;i++)
    printf("%d ", a[i]);

    printf("\nIntroduceti un numar\n");
    scanf("%d", &x);
    if(semafor(x)==true) printf("\nNumarul e prim");
     else printf("Numarul nu e prim");

    return 0;

}
