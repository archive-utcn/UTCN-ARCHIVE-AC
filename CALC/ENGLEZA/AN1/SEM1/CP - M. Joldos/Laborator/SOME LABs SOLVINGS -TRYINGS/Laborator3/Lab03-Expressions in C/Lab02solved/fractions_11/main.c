#include <stdio.h>
#include <stdlib.h>

int main()
{
    int a, b, c, d;
    char aOverB[1024], cOverD[1024];

    printf("Input 4 integers separated by a space: ");
    scanf("%d%d%d%d", &a, &b, &c, &d);
    sprintf(aOverB, "%d/%d", a, b);
    sprintf(cOverD, "%d/%d", c, d);
    printf("%s is the highest\n",
       ((double)a/(double)b >= (double)c/(double)d)? aOverB: cOverD);
     return 0;
}
