#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int prime_test(int x)
{
    int prime=(x==2)||(x%2==1),d=3,r=sqrt(x);
    while (prime==1 && d<=r)
    {
        if(x%d==0)
        {
            x=x/d;
            prime=0;
        }
        d++;
    }
    return prime;
}

int perfect_square_test(int x)
{
    if(sqrt(x)==(int)sqrt(x))
        return 1;
    else
        return 0;
}
int main()
{
    int n,perfsq,primenr;
    scanf("%d",&n);
    perfsq=n;
    primenr=n;
    while(perfect_square_test(perfsq)==0)
    {
        perfsq--;
    }
    while(prime_test(primenr)==0)
    {
        primenr++;
    }
    printf(" perf square %d\n",perfsq);
    printf(" prime %d\n",primenr);
    return 0;
}
