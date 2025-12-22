#include<stdio.h>
#include<conio.h>

int money(long int x)//we make a sunprogram to calculate the way that the sum can be paid
{
    printf("\nThe sum can be paid this way:\n");
    x=x/100;
    if (x>10000)//we test if the sum is of  milions order
      { 
        printf("\n%d x 1 milion lei",x/10000);
        x=x%10000;
      }
    if (x>1000)//we test if the sum is of the 100.000 order
      { 
        printf("\n%d x 100.000 lei",x/1000);
        x=x%1000;
      }
    if (x>100)//we test if the sum is the 10.000 order
      {
        printf("\n%d x 10.000 lei",x/100);
        x=x%100;
      }
    if (x>10)//we test if the sum is of the 1.000 order
      {
        printf("\n%d x 1.000 lei",x/10);
        x=x%10;
      }
    if (x!=0)//we test if the function is of the 100 order
        printf("\n%d x 100 lei",x);
}

int main()
{
    long int n;
    printf("\nPlease input the sum (multiple of 100)\n");//we read the sum we have to pay
    scanf("%ld",&n);
    money(n);//we calculate the way that the sum can be paid
    getch();
}
