#include <stdio.h>
#include <stdlib.h>

int main()
{
    int  n,i;
    printf("The number read from the keyboard is:");
    scanf("%d",&n);
    for(i=n;i>=1;i--)
    {
        if(i*i<n)
        {
            printf("The greatest perfect square that is less than or equal to  %d is %d",n,i);
            break;
        }
    }
     for(i=1;i<=n;i++)
    {
        ok=1;
        if(i==0 || i==1)
            ok=0;
        for(j=2;j<=i/2;j++)
            if(i%j==0)
                ok=0;
        if(ok==1)
            printf("%i",i);
    }
    return 0;
}


