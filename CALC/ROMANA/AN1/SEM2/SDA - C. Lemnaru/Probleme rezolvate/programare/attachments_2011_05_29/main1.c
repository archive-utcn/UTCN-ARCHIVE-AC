//3.1.Să se implemeteze algoritmul lui Dijkstra de găsire a căilor de cost minim dintr-un vârf al unui graf orientat.

#include <stdio.h>
#include <stdlib.h>
#define inf 90
int a[20][20],n,tata[20],dist[20],s[20];


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

void dijkstra(int sursa)
{
    int i,pas,k,min;
    for(i=1;i<=n;i++)
    {
        s[i]=0;
        dist[i]=a[sursa][i];
        if(a[sursa][i]<inf) tata[i]=sursa;
        else tata[i]=0;
    }
    s[sursa]=1;
    tata[sursa]=0;
    dist[sursa]=0;
    for(pas=1;pas<n;pas++)
    {
        min=inf;
        k=0;
        for(i=1;i<=n;i++)
           if(dist[i]<min&&s[i]==0)
                {
                    min=dist[i];
                    k=i;
                }
        if(min!=inf)
        {
            s[k]=1;
            for(i=1;i<=n;i++)
                if(s[i]==0)
                    if(dist[i]>dist[k]+a[k][i])
                    {
                        tata[i]=k;
                        dist[i]=dist[k]+a[k][i];
                    }
        }
    }
}

void af(int sursa,int curent)
{
    if(curent!=0)
    {
        af(sursa,tata[curent]);
        printf("%d ",curent);
    }
}

int main()
{
    int sursa,i;
    citire();
    printf("dati nodu sursa:");
    scanf("%d",&sursa);
    dijkstra(sursa);
    printf("\n\n");
    for(i=1;i<=n;i++)
        if(i!=sursa)
            {
            af(sursa,i);
            printf("\ndist intre %d si %d este %d\n",sursa,i,dist[i]);
            }
    return 0;
}
