#include <stdio.h>
#include <stdlib.h>
#define lv 3
#define elco 9

int start;
int finish;
int a[20][20], selectat[20], node, init, min, cost;
int v[3],matrad[20][20],n,m;


void citire()
{
    int g,h,c;
    FILE *f;
    f=fopen("fis1.txt","r");
    int z;
    fscanf(f,"%d",&n);
    fscanf(f,"%d",&m);


    for (z=0;z<m;z++)
    {

    fscanf(f,"%d %d %d", &g, &h, &c);
        a[g][h]=a[h][g]=c;
    }

}

 void greedy()
{
  int i, j;
    selectat[start]=1;
    init=start;
    for(i=1;i<n-3;i++)
    {
        min=22222;
        for(j=1;j<=n;j++)
        if((a[start][j] != 0) && (selectat[j]==0) && (min>a[start][j]))
        {
            min=a[start][j];
            node=j;
        }
        cost=cost+a[start][node];
        printf("%d ,", node);
        selectat[node]=1;
        start=node;
    }
    cost=cost+a[init][start];


}
int main()
{
    citire();
    printf("Nodul de inceput:\n");
    scanf("%d",&start);
    greedy();

    return 0;
}

