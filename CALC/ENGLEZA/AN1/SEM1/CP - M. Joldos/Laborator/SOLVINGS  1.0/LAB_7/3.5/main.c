#include<stdio.h>

#define nmax 10

int n, c[nmax], x[nmax],a[nmax][nmax];

int solution(int k)
{
    return (k==n-1);
}

void write(int k)
{
    int i;
    printf("(");
    for(i = 0; i <= k; i++)
    {
        printf("%d ",x[i]);
    }
    printf(")");
}

void back(int k)
{
    int i;
    for(i = 0; i < c[k]; i++)
    {
        x[k] = a[k][i];
        if( solution(k) )
            write(k);
        else
            back(k+1);
    }
}

int main()
{
    int i,j;
    printf("Input the number of sets: ");
    scanf("%d",&n);
    for(i = 0; i < n ; i++)
    {
        printf("Input the number of elements of set %d and his elements ",i);
        scanf("%d",&c[i]);
        for(j = 0; j < c[i]; j++)
        {
            scanf("%d",&a[i][j]);
        }
    }



    back(0);
    getch();
     return 0;
}
