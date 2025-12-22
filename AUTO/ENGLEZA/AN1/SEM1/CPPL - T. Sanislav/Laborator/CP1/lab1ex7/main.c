#include <stdio.h>
#include <stdlib.h>

int main()
{
    int a=10;
    int b=12;
    int c=123;
    int d=1234;
    int e=12345;

    printf("%5d %d\n",a,a);
    printf("%5d %d\n",b,b);
    printf("%5d %d\n",c,c);
    printf("%5d %d\n",d,d);
    printf("%5d %d\n",e,e);

    printf("%u",a<<2); //left shift for 1010
return 0;
}
