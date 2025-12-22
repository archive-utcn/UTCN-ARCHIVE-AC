#include <stdio.h>
#include <stdlib.h>

int a[100][100],c[100][100],i,j,n,m,x,y,k,cost;
int main()
{
  printf("dati numarul de orase:\n");
  scanf("%d",&n);
  printf("dati numarul de drumuri:\n");
  scanf("%d",&m);
  for (i=1;i<=n;i++)
    for(j=1;j<=n;j++)
        c[i][j]=0;
  for (i=1;i<=m;i++)
    {
        printf("dati coordonatele strazii:\n");
        scanf("%d %d",&x,&y);
        printf("dati lungimea drumului:\n");
        scanf("%d",&cost);
        c[x][y]=cost;
        c[y][x]=cost;
        a[x][y]=c[x][y];
        a[y][x]=c[y][x];
    }
  for (k=1;k<=n;k++)
    for (i=1;i<=n;i++)
        for (j=1;j<=n;j++)
                    if (a[i][k]+a[k][j]<a[i][j])
                            a[i][j]=a[i][k]+a[k][j];
  printf("matricea costurilor minime\n");

  {
        for (j=1;j<=n;j++)
            printf("%d ",a[i][j]);
        printf("\n");
    }
    return 0;
}
