#include <stdio.h>
#include <stdlib.h>

#define nmax 100

int main()
{
    char a[nmax][nmax];
    int i,j,ok=1;

    int n=3;

    printf("%d",n);

    for(i=1;i<=n;++i)
        for(j=1;j<=n;++j)
            scanf("%d",&a[i][j]);

    for(i=1;i<=n;++i)
        for(j=1;j<i;++j)
            if(a[i][j]!=a[j][i]) ok=0;

    if(ok) printf("e simetrica");
    else printf("nu e simetrica");
    return 0;
}
