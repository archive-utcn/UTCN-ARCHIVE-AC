
/* Program 3.9 */
#include <stdio.h>
#include <stdlib.h>

#define NMAX 30
int s[NMAX*NMAX],l[NMAX],m,n,mm;

void write(int k)
{

    for (int i = 0; i <= k; i++)
        printf("%d ",s[i]);

    printf("\n");
}

int valid(int k)
{
    int i,suma=0;
    for(i = 0; i < k; i++)
    {
        suma+=s[i];
    }
    if(suma + l[k] < mm)
    {
            return 1;
    }
    else
    {
            return 0;
    }
}

int solution(int k)
{
    int i,suma=0;
    for(i = 0; i <=k; i++)
    {
        suma+=s[i];
    }
    return suma==mm;
}
void solve(int k)
{
    int i;
    for(i = 0; i < n; i++)
    {
        s[k]=l[i];
        if(valid(k))
        {
            if(solution(k))
            {
                write(k);
                return;

            }
            else
                solve(k+1);
        }
    }


}
int main()
{
    int suma=0,i;
    printf("The length m of the rod:\n");
    scanf("%d",&m);
    printf("The nr n of the component rods:\n");
    scanf("%d",&n);
    printf("The lengths of all component rods:\n");
    for(i = 0; i < n; i++)
    {
        scanf("%d",&l[i]);
        suma+=l[i];
    }
    mm=m-suma;
    if(mm>=0)
    {
         for(i= 0 ; i < n; i++)
        {
            printf("%d ",l[i]);

        }
        solve(0);
    }
    else
        printf("It's impossible!");







    return 0;
}
