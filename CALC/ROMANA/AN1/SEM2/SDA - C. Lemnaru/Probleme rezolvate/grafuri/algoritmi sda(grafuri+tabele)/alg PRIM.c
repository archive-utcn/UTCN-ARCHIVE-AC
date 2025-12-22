#include<stdio.h>
#include<conio.h>

#define inf 999

int u,v,n,i,j,nr=1;
int vizitat[10]={0}, min, cost_min=0,cost[10][10];

int main()
{

 printf("Introduceti numarul de varfuri: ");
 scanf("%d",&n);
 printf("\nIntroduceti matricea costurilor: \n");
 for(i=1;i<=n;i++)
  for(j=1;j<=n;j++)
  {
   scanf("%d",&cost[i][j]);
   if(cost[i][j]==0)
    cost[i][j]=inf;
  }
 vizitat[1]=1;
 printf("\n");
 while(nr<n)
 {
  for(i=1,min=inf;i<=n;i++)
   for(j=1;j<=n;j++)
    if(cost[i][j]<min)
     if(vizitat[i]!=0)
     {
      min=cost[i][j];
      u=i;
      v=j;
     }
  if(vizitat[u]==0 || vizitat[v]==0)
  {
   printf("\nMuchia %d:(%d %d) cost:%d",nr++,u,v,min);
   cost_min+=min;
   vizitat[v]=1;
  }
  cost[u][v]=cost[v][u]=inf;
 }
  printf("\n\nCostul minim este: %d",cost_min);
  getch();
}
