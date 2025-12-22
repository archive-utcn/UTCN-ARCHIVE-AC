#include <stdio.h>
#include <stdlib.h>
#include<conio.h>
#define nmax 10

int n;
int nr_sol;
int x[nmax];

int conditie(int k)
{
    int p;
    for(p=0;p<=k-1;p++)
    {
        if ((x[k]==x[p])||abs(k-p)==abs(x[k]-x[p])) return 0;
    }
    return 1;
}

void back(int k)
{
    int i,j,p;
    for(j=0;j<=n;j++)
    {
        x[k]=j;
        if (conditie(k)==1) back(k+1);
        else
        {
            nr_sol++;
            printf("Solutia nr %d\n",nr_sol);
            for(i=0;i<=n;i++)
            {
                for(p=1;p<=n;p++)
                    if (x[i]==p) printf("1");
                    else printf("0");
                    printf("\n");
            };
            getch();
        }
    }

}

void main(void)
{
    printf("dati ordinul tablei de sah:\n");
    scanf ("%d",&n);
    nr_sol=0;
    back(1);
}

