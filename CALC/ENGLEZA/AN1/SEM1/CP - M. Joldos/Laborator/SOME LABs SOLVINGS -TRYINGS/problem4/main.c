#include <stdio.h>
#include <stdlib.h>

int main()
{
    int i,n,v,k;
    printf("Numarul citit de la tastarura este:\n");
    scanf("%d", &n);
    for(i=1;i<=n;i++)
    {
        if (i < 2)
            return -1;
        for (k = 2; k <= i / 2; k++)
            if (i % k == 0)
                return 0;
        return 1;
    }
    return 0;
}
