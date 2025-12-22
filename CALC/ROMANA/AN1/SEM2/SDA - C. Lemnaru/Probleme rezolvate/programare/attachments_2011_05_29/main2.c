//3.3..Să se implementeze algoritmul lui Prim de găsire a arborelui de acoperire a unui graf neorientat.

#include <stdio.h>
#include <stdlib.h>
#define inf 90
int a[20][20],n,t[20][3],w[20],v[20];

void citire()
{
    int i,j;
    FILE *f;
    f=fopen("fis.txt","r");
    fscanf(f,"%d",&n);
    for(i=1;i<=n;i++)
        for(j=1;j<=n;j++)
            fscanf(f,"%d",&a[i][j]);
    fclose(f);
}

void af ()
{
    int i;
    for(i=1;i<n;i++)
    {
        printf("muchie de la %d la %d de cost %d\n",t[i][1],t[i][2],t[i][3]);

    }

}
void prim()
{
    int m=1,min,nodi,nodf,i,j;
    w[m]=1;
    v[1]=1;
    while(m<n)
    {
        min=90;
        for(i=1;i<=m;i++)
        {
            for(j=1;j<=n;j++)
                if(a[w[i]][j]<=min&&v[j]==0)
                {
                    min=a[w[i]][j];
                    nodi=w[i];
                    nodf=j;
                }
        }
        m++;
        w[m]=nodf;
        v[nodf]=1;
        t[m-1][1]=nodi;
        t[m-1][2]=nodf;
        t[m-1][3]=min;
      }
}


int main()
{

    citire();
    prim();
    af();
    return 0;
}
