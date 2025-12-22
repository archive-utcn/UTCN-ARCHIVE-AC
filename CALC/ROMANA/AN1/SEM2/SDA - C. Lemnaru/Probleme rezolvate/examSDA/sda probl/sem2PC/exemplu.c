#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#define nmax 10
int solPartial(int y[],int m,int suma_totala)
{
    int i=0,s=0;
    for (i=0; i<m; i++)
    {
        s+=y[i];
    }
    if (s<=suma_totala)
    {
        return 1;
    }
    return 0;
}
int sol_completa(int y[],int m,int suma_totala)
{
    int i=0,s=0;
    for (i=0; i<m; i++)
    {
        s+=y[i];
    }
    if (s==suma_totala)
    {
        return 1;
    }
    return 0;
}

void back(int x[],int k,int S[],int n,int s)
{
    int j=0;
    for (j=k; j<n; j++)
    {
        x[k]=S[j];
        if (solPartial(x,k,s)==1)
        {
            if (sol_completa(x,k,s)==1)
            {
                int i=0;
                printf("Solutie:");
                for(i=0; i<n; i++)
                {
                    printf("%d ",x[i]);
                }
                printf("\n");
            }
            else if(k<n-1) back(x,k+1,S,n,s);
        }
    }
}
int main()
{
    int s=5;
    int k=0;
    int x[100];
    int S[5]={2,4,1,3,2};;
    int n=5;
    back(x,k,S,n,s);
    printf("Sfarsit\n");
}
