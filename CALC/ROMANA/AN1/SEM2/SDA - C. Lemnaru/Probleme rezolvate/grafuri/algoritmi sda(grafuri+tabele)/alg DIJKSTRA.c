#include <stdio.h>
#include <conio.h>
#define infinit 999

void dijkstra(int n,int v,int cost[10][10],int dist[])
{
 int i,u,nr,w,flag[10],min;
 for(i=1;i<=n;i++)
  flag[i]=0,dist[i]=cost[v][i];
  nr=2;
 while(nr<=n)
 {
  min=99;
  for(w=1;w<=n;w++)
   if(dist[w]<min && !flag[w])
    min=dist[w],u=w;
  flag[u]=1;
  nr++;
  for(w=1;w<=n;w++)
   if((dist[u]+cost[u][w]<dist[w]) && !flag[w])
    dist[w]=dist[u]+cost[u][w];
 }
}

void main()
{
 int n,v,i,j,cost[10][10],dist[10];
  printf("Introduceti numarul de noduri: ");
 scanf("%d",&n);
 printf("\nIntroduceti matricea de costuri: \n");
 for(i=1;i<=n;i++)
  for(j=1;j<=n;j++)
  {
   scanf("%d",&cost[i][j]);
   if(cost[i][j]==0)
    cost[i][j]=infinit;
  }
 printf("\nIntroduceti nodul de start: ");
 scanf("%d",&v);
 dijkstra(n,v,cost,dist);
 printf("\nCaile de cost minim sunt: \n");
 for(i=1;i<=n;i++)
  if(i!=v)
   printf("%d->%d,cost=%d\n",v,i,dist[i]);
 getch();
}
