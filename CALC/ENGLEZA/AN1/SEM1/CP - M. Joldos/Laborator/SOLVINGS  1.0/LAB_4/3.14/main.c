#include <stdio.h>
#include <stdlib.h>

int perf_square(int x)
{
    return sqrt(x)==(int)sqrt(x);
}

int high_perf_square(int x)
{
    int temp;
    temp=x;
    while(perf_square(temp)!=1)
    {
        temp--;
    }
    return temp;
}
int main()
{
    int x;
    scanf("%d",&x);
    printf("%d",high_perf_square(x));
    return 0;
}
