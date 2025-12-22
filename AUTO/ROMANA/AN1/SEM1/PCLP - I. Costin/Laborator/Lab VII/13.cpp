#include <stdio.h>
#include <stdlib.h>
#include <conio.h> 

int n, m;
int ii, ji;
int a[30][30],u[30][30];
int wi[30][30],wj[30][30]; //from whichi i,j did we arrive at
                             //the current position
 
const int di[]={-1,0,1,0};
const int dj[]={0,-1,0,1};
 
void back (int i,int j)
{
   if (wi[i][j]!=-1 && wj[i][j]!=-1)
      {
        back(wi[i][j],wj[i][j]);
        printf("(%d,%d) ",i,j);
      }
}
 
void generate(int i,int j)
{
  int k;
  if (i==1 || j==1 || i==n || j==m) // we are on an exit
    {
      printf("path : (%d,%d) ",ii, ji);
      back(i,j);
      printf("\n");
    }
  for (k=0;k<4;k++)
    {
      int ni,nj;
      ni=i+di[k];
      nj=j+dj[k];
      if (ni>=1 && ni<=n && nj>=1 && nj<=m && //are we inside the labirynth?
          a[ni][nj]==1 &&//are we on a passage ?
          u[ni][nj]==0) //were we here before ?)
                     {
                       wi[ni][nj]=i;
                       wj[ni][nj]=j;
                       u[ni][nj]=1;
                       generate(ni,nj);
                       u[ni][nj]=0;
                       wi[ni][nj]=0;
                       wj[ni][nj]=0;
                     }
      }
}
 
int main ()
{
    int i,j;
    printf("\n Please input the dimensions : \n");
    scanf("%d%d",&n,&m);
    printf("\n Please input the labyrinth (0 for wall 1 for passage : \n");
    for (i=1;i<=n;i++)
       for (j=1;j<=m;j++)
            scanf("%d", a[i] + j);
    printf("\n Please input the inital position : \n");
    scanf("%d%d",&ii,&ji);
    wi[ii][ji]=-1;
    wj[ii][ji]=-1;
    u[ii][ji]=1;
    generate(ii,ji);
    getch();
}
