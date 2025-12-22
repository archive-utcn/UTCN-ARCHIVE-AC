#include <stdio.h>
#include <stdlib.h>

int main()
{
    int ok,a[100][100],n,i,j;
    scanf("%d",&n);
    for(i = 0; i < n; i++)
    {
        for(j = 0; j < n; j++)
        {
            scanf("%d",&a[i][j]);
        }
    }

    ok=1;
     for(i = 0; i < n; i++)
    {
        for(j = 0; j < n; j++)
        {
            if(a[i][j] != a[j][i])
                ok=0;

        }
    }
    printf(ok?"Yes":"No");

    return 0;
}
