/* Program 3.10 */

#include <stdio.h>
#include <stdlib.h>

void Ack(int m,int n)
{
    if(m==0)
        return n+1;
    else
    {
        if(n==0)
            Ack(m-1,1);
        else
            Ack(m-1,Ack(m,n-1));
    }
}
int main()
{
    printf("Hello world!\n");
    return 0;
}
