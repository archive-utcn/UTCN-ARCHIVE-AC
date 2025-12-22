/* Program 3.13 */

#include <stdio.h>
#include <stdlib.h>

#define NMAX 30
#define MMAX 30
int n,m,lab[MMAX][NMAX],t[MMAX][NMAX];
int di[]={-1, 0, 1, 0};
int dj[]={0, 1, 0, -1};

void display_solution()
{
    for(int i = 0; i < m; i++)
    {
        for(int j = 0; j < n; j++)
        {
            printf("%d ",t[i][j]);
        }
        printf("\n");
    }
    printf("\n****************\n");
}

int possible(int i,int j)
{
    return (i >= 0 && j >= 0 && i <= m-1 && j <= n-1 && lab[i][j]==1 && t[i][j]==0);
}

int solution(int i,int j)
{
    return (i == m-1 || j == n-1 || i == 0 || j == 0);
}

int solve_maze(int i,int j,int trace)
{
    int k;
    t[i][j]=trace;
    if(solution(i,j))
        display_solution();
    else
    {
        for(k = 0; k < 4; k++)
        {
            if(possible(i+di[k],j+dj[k]))
                solve_maze(i+di[k],j+dj[k],trace+1);
        }
    }
    t[i][j]=0;

}
int main()
{
    int i,j,r,t;

    printf("Introduce m and n, dimensions of the labyrinth: ");
    scanf("%d %d",&m,&n);


    printf("Introduce the labyrinth:\n");
    for(r = 0; r < m; r++)
    {
        for(t = 0; t < n; t++)
        {
            printf("a[%d][%d]=",r,t);
            scanf("%d", &lab[r][t]);

        }

    }
    printf("Introduce i and j, the initial coordinates: ");
    scanf("%d %d",&i,&j);


    solve_maze(i,j,1);


    return 0;
}
