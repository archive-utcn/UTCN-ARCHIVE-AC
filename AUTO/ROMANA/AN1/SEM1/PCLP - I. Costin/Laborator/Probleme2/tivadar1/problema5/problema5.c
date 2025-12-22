#include <stdio.h>
#include <stdlib.h>

int main()
{
    int x;
    printf("x=");
    scanf("%d",&x);
    if(x<-2)
        printf("f(%d)=%d",x,x*x+4*x+4);
        else if((x>-2)&&(x!=0))
                printf("f(%d)=%d",x,x*x+5*x);
                else if(x==0)
                        printf("f(%d)=0",x);
                        else printf("Functia nu e definita in -2");
    return 0;
}
