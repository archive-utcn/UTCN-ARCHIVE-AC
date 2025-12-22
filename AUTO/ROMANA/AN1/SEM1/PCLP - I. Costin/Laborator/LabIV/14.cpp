#include <stdio.h>
#include <conio.h>
#include <math.h>

int square(int n)//we make a function to return the perfect square less or equal to number n 
{
    int aux,val;
    aux=floor(sqrt(n));
    val=aux*aux;
    return val;
}

int main()
{
    int n;
    printf("\n Please input the number \n");//we read the number
    scanf("%d",&n);
    printf("The perfect square is: %d", square(n));//we display the perfecr square
    getch();
}
