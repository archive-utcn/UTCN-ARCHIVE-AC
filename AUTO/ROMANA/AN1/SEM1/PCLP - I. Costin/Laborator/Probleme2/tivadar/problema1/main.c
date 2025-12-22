#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n, s=0;
    scanf("%d",&n);
    while(n!=0)
        {
        if(n&1)
            s++;
        n=n>>1;
        }
    s=sizeof(n)*8-s;
    printf("%d",s);
    return 0;
}
