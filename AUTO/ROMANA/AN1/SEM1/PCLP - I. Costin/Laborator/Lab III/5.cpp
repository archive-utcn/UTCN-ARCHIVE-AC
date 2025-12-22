#include <stdio.h>
#include <conio.h>
#include <math.h>

int prim(int a)//we make a function which return if a number is prime or not prime
{
    int i,ok;
    ok=1;//we suppose that the number a is prime
    for (i=2;i<=a/2;i++)
        if (a%i==0)//if we found a number which divide a
           {
           ok=0;//so, the number is not prime 
           break;//we exit from for, because is not neccesary to test more, because we already found a number which divide a
                   };
    return ok;//the function return 1 if the number is prime, and 0 if the number is not prime
}

int main()//principal program
{
    int n,nr,ok,nr1,nr2;
    printf("\n Please imput the value for n: \n") ;//we read the number n
    scanf("%d",&n);
    nr1=sqrt(n);//in the variable nr1 we put the sqrt of n, which is an integer number 
    nr2=nr1*nr1;//in the variable nr2 we put the square of nr1, which represent the perfect square less or equal to n
    printf("\n The perfect square no is %d \n",nr2) ;//we display the perfect square
    ok=0;//we assume that the number nr is not prime
    nr=n;//we initialixe nr with n, because we need to know the smaller orime numbre greater or equal to n
    while (ok==0)//we do these operation until ok==1(we found a prime number)
    {
          if (prim(nr)==1)//if prime
             {
                ok=1;//we make ok=1, because we found a prime number
                printf("\n The prime number is %d \n",nr);//and we display it
                }
         nr=nr+1;//if we didn't find, we increse nr with 1, because we need an integer number
    };
    getch();
}
                                    
