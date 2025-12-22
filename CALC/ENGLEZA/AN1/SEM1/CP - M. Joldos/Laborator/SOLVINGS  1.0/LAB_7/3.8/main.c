/* Program 3.8 */

#include <stdio.h>
#include <stdlib.h>

#define NMAX 30

int x[NMAX],A[NMAX],n;

void show(int k)
{
    int i;
    printf("(");
    for(i = 0; i < n; i++)
    {
        printf("%d ", x[i]);
    }
    printf(")\n");
}

int valid(int k)
{
    int i;
    for(i = 0; i < k; i++)
    {
        if(x[i]==x[k])
            return 0;

    }
    return 1;
}

int check_if_solution(int k)
{
    return (k==n-1);
}

void solve(int k)
{
    int i;

    for(i = 0; i < n; i++)
    {
        x[k]=A[i];
        if(valid(k))
        {
            if(check_if_solution(k))
            {
                show(k);
            }

            else
            {
                solve(k+1);
            }

        }
    }
}
int main()
{
    int i;
    printf("Introduce a value for n: ");
    scanf("%d",&n);
    for(i = 0; i < n; i++)
    {
        scanf("%d", &A[i]);

    }
    solve(0);

    return 0;
}
