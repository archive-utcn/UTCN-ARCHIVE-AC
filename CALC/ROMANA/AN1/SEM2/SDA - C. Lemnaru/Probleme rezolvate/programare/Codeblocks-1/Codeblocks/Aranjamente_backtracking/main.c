#include <stdio.h>
#include <stdlib.h>

int st[100];
int n=5,m=4;

int valid(int k)
{
    int i;
    for (i=0;i<k;i++)
        if (st[i]==st[k]) return 0;
    return 1;
}
void aranjamente (int k)
{
    int j;
    for (j=1;j<=n;j++)
    {
           st[k]=j;
           if (valid(k))
                if (k<m-1)
                {
                        aranjamente(k+1);
                }
                else
                {
                    int h;
                    printf("\n");
                    for (h=0;h<m;h++)
                        printf(" %d ",st[h]);
                }
    }
}
int main()
{
    aranjamente(0);
    return 0;
}
