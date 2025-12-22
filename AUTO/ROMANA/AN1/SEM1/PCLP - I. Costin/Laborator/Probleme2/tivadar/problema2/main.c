#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n;
    printf("Introduceti un an");
    scanf("%d",&n);
    if(((n%4==0)&&(n%100!=0))||(n%400==0))
        printf("An bisect");
        else printf("Nu e an bisect");
    return 0;
}
