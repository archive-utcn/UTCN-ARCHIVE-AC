#include <stdio.h>
#include <stdlib.h>

int main()
{
    double x;
    scanf("%lf",&x);
    printf("%f",(x<-2)?(x*x-7*x+4):((x>-2)?(x*x+5*x-2):0));


    return 0;
}
