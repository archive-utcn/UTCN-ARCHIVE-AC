#include <stdio.h>
#include <stdlib.h>

int main()
{
    int m=10,cap=2;
    m -= cap/2;//m=m-cap/2
    printf("m=%d\n",m);
    if(m -= cap/2) printf("da");
    else printf("nu");
    return 0;
}
