#include <stdio.h>
#include <conio.h>
#include <math.h>

int prim(int a)//we make a function to return if a number is or is not prime
{
    int i,ok;
    ok=1;//we suppose that the number a is prime 
    for (i=2;i<=a/2;i++)
        if (a%i==0)//if we found a number which divide a
           {
           ok=0;//so, the number is not prime 
           break;//we exit from for, because is not neccesary to test more, because we already found a number which divide a
                   };
    return ok;//teh function return 1 if a prime, and 0 if a is not prime
}

int main()//principal program
{
    int i,n,ok;
    printf("\n Please input the value of n \n");//we read the number n
    scanf("%d",&n);
    printf("The prime numbers are: \n");//we display the prime numbers smaller or equal to n
    for (i=2;i<=n;i++)//we test every number smaller or equal to n
        {
         ok=prim(i);//if prim condition is respected then display the number
         if (ok==1)
            printf("\n %d \n",i);             
                      };
    getch();
}
