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
            {
                if(v[i]==v[j])
                    {
                        s++;
                        if(j==n)
                            n--;
                            else
                                {
                                    k=j;
                                    while(k<n-1)
                                        {
                                            v[k]=v[k+1];
                                            k++;
                                        }
                                    n--;
                                }
                        j++;
                    }
            }
        printf("Numarul %d apare de %d ori\n",v[i],s+1);
        i++;
    }
    return 0;
}
