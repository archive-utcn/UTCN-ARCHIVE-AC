#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
typedef struct stud{
                    int randament[100];
                    }STUD;
int v[100],n,b[100],suma;
STUD a[100];
int conditie()
{
    int i,j;
    int z=1;
    for (i=0;i<n;i++)
    for (j=0;j<n;j++)
        {
            if ((v[i]==v[j])&&(i!=j)) z=0;
        }
    return z;
}

int back(int t)
{
    int j,i,s;
    for(j=0;j<n;j++)
    {
        v[t]=j;
        if (t<n-1) back(t+1);
        if (conditie())
        {
            s=0;
            for(i=0;i<n;i++)
                s=s+a[i].randament[v[i]];
            if (suma<s)
            {
                for(i=0;i<n;i++) b[i]=v[i];
                suma=s;
            }
        }
    }
}

int main()
{
     int i;
    n=3;
    a[0].randament[0]=4;
    a[0].randament[1]=1;
    a[0].randament[2]=6;

    a[1].randament[0]=3;
    a[1].randament[1]=7;
    a[1].randament[2]=1;

    a[2].randament[0]=0;
    a[2].randament[1]=3;
    a[2].randament[2]=8;
    suma=0;
    back(0);
    for(i=0;i<n;i++)
    printf("%d",b[i]);
    printf("\n%d",suma);
}







