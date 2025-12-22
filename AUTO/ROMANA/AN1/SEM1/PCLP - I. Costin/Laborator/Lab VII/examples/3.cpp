#include <stdio.h>
#include <conio.h>

long fibr(long n)
{ 
   if (n==0)
     return 0;
   else
       if (n==1)
          return 1;
       else
          return (fibr(n-1)+fibr(n-2));
}

long fibnr(long n)
{ 
   long i,x,y,z;
   if (n==0)
     return 0;
   else
     if (n==1)
        return 1;
     else
        { 
           x=1;
           y=0;
           for (i=2;i<=n;++i)
             { 
                z=x;
                x=x+y;
                y=z;
             };
           return x;
     }
}

int main()
{ 
  long n;
  char ch='D';
  while ( (ch=='d') || (ch=='D') )
     { 
         printf("\nPlease input the number n\n");
         scanf("%ld",&n);
         printf("\nFibonacci recursiv is %ld, pentru n=%ld\n",fibr(n),n);
         printf("\nFibonacci nerecursiv is %ld, pentru n=%ld\n",fibnr(n),n);
         ch=getch();
     }
}
