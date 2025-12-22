#include <stdio.h>
#include <stdlib.h>

int main()
{
    double v, min, max;
    int n, i, poz_min, poz_max;
    poz_min = poz_max = 0;
    printf("Secventa de numere este:\n");
    scanf("%d", &n);
    for(i = 0; i < n; i++)
    {
        scanf("%lf", &v);
        if (i == 0)
            min = max = v;
        if(v < min)
        {
            min=v;
            poz_min=i;
        }
        if(v > max)
        {
            max = v;
            poz_max=i;
        }
    }
    printf("Minimul din secventa este min=%f and poz_min=%d\n", min, poz_min+1);
    printf("Maximul din secventa este max=%f and poz_max=%d\n", max, poz_max+1);
    return 0;
}
