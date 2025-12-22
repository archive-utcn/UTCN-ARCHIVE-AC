#include <stdio.h>


#define maxn 50010
#define maxm 250010
#define inf 1000000000

struct muchie
{
long a, b, c;
}l[maxm];

long n, m, i, j, k, cost[maxn];

void init()
{

long i;
cost[1]=0;
for(i=2; i<=n; i++)
cost[i]=inf;

}

void solve()

{
long i, j;
for(i=1; i<=n; i++)
for(j=1; j<=m; j++)
if(cost[l[j].a]+l[j].c<cost[l[j].b])
cost[l[j].b]=cost[l[j].a]+l[j].c;
}

long negativ()

{
long i;
for(i=1; i<=m; i++)
if(cost[l[i].a]+l[i].c<cost[l[i].b])
return 1;
return 0;
}

int main()
{ FILE *f;
    f=fopen("bell.txt","r");
    fscanf(f,"%d%d", &n, &m);
    for(i=1; i<=m; i++)
    fscanf(f,"%d %d %d", &l[i].a, &l[i].b, &l[i].c);
    init();
solve();
if(negativ())
{
printf("Ciclu negativ!\n");
return 0;

}
printf("Distanta de la vf 1 la celelalte vf \n");
for(i=2; i<=n; i++)
printf("\n%d: %d ",i,cost[i]);
return 0;

}
