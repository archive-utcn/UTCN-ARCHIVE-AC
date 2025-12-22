#include <stdio.h>
#include <stdlib.h>
#define inf 22222
int n, s[50], i, j, k, l, c, minim, a[50][50];

void citire()
{   FILE *f;
    int cost;
    f=fopen("fis2.txt", "r");
    fscanf(f,"%d", &n);
    while(!feof(f))
    {
        fscanf(f,"%d", &i);
        fscanf(f,"%d", &j);
        fscanf(f,"%d", &cost);
        a[i][j]=a[j][i]=cost;
    }
    fclose(f);
}

int main()
{
    citire();
    s[1]=1;
    for(k=1;k<n;k++)
    {
        minim=inf;
        for(i=1;i<=n;i++)
        for(j=1;j<=n;j++)
         if(s[i]==1  &&  s[j]==0  &&  minim>a[i][j])
          {
              minim=a[i][j];
              l=i;
              c=j;
          }
         printf("\nAdaugam muchia %d%d  de cost : %d \n", l, c, minim);
         s[c]=1;
    }
    return 0;
}
