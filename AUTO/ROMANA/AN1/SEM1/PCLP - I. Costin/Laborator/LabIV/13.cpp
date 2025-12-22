#include <stdio.h>
#include <conio.h>
#include <math.h>

int square(int n)//we make a function to determine whether a number is a perfect square or not
{
    int aux,val,ok;
    ok=0;//we assume that the number is not a perfect square
    aux=floor(sqrt(n));
    val=aux*aux;
    if (val==n)//if this condition is respected , than the number is a perfect square
       ok=1;
    return ok;
}

int main()
{
    int n,i,k;
    int x[10],y[10];
    printf("\n Please input the number of elements \n");//we read the number of elements and the elements of the vector
    scanf("%d",&n);
    printf("\n Please input the elements of the vector: \n");
    for (i=1;i<=n;i++)
        {
            printf("\n Please input the element %d \n",i);
            scanf("%d",&x[i]);
        }
    k=0;//we memorize the perfect square numbers in another vector y; we assume that the vector y not contains elements
    for (i=1;i<=n;i++)
        if (square(x[i])==1)//we apply the function square, which is 1 if the number is a perfect square, and o else
        { 
             k=k+1;//when we found such a number we add it in vector
             y[k]=x[i];
        } 
    printf("\n The square numbers from the vector are: \n");//we display the vector y with perfect square numbers
    for (i=1;i<=k;i++)
        printf("%d ",y[i]);

    getch();
}
