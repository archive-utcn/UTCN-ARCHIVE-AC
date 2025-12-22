#include <stdio.h>
#include <stdlib.h>

int main()
{
    int v[50],n,i,s,j,k;
    printf("n=");
    scanf("%d",&n);
    for(i=0;i<n;i++)
    {
        printf("v[%d]=",i);
        scanf("%d",&v[i]);
    }
    i=0;
    while(i<n)
    {
        s=0;
       j=i+1;
       while(j<n)
            if(v[j]==v[i])
                {
                    s++;
                     k=j;
                while(k<n-1)
                    {
                        v[k]=v[k+1];
                        k++;
                    }
                    n--;
                    }
        printf("Numarul %d apare de %d ori\n",v[i],s+1);
    }
    return 0;
}
