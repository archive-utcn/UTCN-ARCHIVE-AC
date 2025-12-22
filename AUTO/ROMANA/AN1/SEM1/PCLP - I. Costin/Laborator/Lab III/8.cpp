#include <stdio.h>
#include <conio.h>
#include <math.h>

int main()
{
    int n,a,i,x[100],pol;
    printf("\n Please input the degree of the polinom n: \n");//we read the degree of the polinom
    scanf("%d",&n);
    for (i=n;i>=0;i--)//we read the coefficients of the polinom
        {
        printf("\n Please input the coeficient %d \n ",n-i);
        scanf("%d",&x[i]);
        }
        
    printf("\n Please input the value a \n");//we read the value for which we want to calculate the polinom 
    scanf("%d",&a);
    pol=0;//we initialize the polinom the value 0
    for (i=0;i<=n;i++)
        pol=(pol*a)+x[i];//we calculate the polinom
    printf("The value of the polinom is %d",pol);//we display the result
    getch();
}
