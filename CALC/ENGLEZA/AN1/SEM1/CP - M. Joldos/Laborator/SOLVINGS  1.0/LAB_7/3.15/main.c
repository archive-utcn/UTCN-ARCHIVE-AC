#include <stdio.h>
#include <stdlib.h>

#define NMAX 30
#define MMAX 30

int n,m,t[NMAX][MMAX],x[NMAX][MMAX],count;
int di[]= {-1, 0, 1, 0};
int dj[]= {0, 1, 0, -1};


int possible(int i, int j, int color)
{
    return (i >= 0 && j >= 0 && i < n && j < m && x[i][j]==color && t[i][j]==0);
}

int solve(int i,int j,int color)
{
    //printf("i=%d j=%d c=%d ", i, j, color);
    //getchar();
    t[i][j]=1;
    for(int k = 0; k < 4; k++)
    {
        if(possible(di[k]+i,dj[k]+j,color))
        {
            count++;
             //*nr=*nr+1;
               // printf()
             solve(di[k]+i,dj[k]+j,color);
        }
    }
    // t[i][j]=0;
}
int main()
{
    int i,j,nr,maxim,size[10];

//memset()
    //printf("Introduce the dimensions n and m: ");
    scanf("%d%d",&n,&m);
    //printf("\nIntroduce the matrix with the colors:");
    for(i = 0; i < n; i++)
    {
        for(j = 0; j < m; j++)
        {
            //printf("x[%d][%d]=",i,j);
            scanf("%d",&x[i][j]);
        }
    }

    for(i = 1; i <= 9; i++)
    {
        size[i]=0;
    }

    for(i = 0; i < n; i++)
    {
        for(j = 0; j < m; j++)
        {
            if(t[i][j]==0)
            {
                //nr=1;
                count=1;
                solve(i,j,x[i][j]);
                if(count > size[x[i][j]])
                {
                    size[x[i][j]]=count;
                }

            }
        }
    }
    maxim=size[1];
    for(i = 1; i <= 9; i++)
    {
        if(maxim<size[i])
            maxim=size[i];
    }

    for(i = 1; i <= 9; i++)
    {
        if(maxim==size[i])
            printf("The color of the biggest connected set is %d and its size is %d.\n",i,size[i]);
    }


    return 0;
}
