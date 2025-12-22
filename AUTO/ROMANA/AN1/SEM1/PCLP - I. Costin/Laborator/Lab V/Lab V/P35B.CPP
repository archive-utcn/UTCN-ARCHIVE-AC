#include <stdio.h>
#define MAXN 20

typedef int MULTIME[50];

void reunion(MULTIME m[MAXN],int n,MULTIME rez,int& dr)
{
    dr=0;
    int sel[32766];
    for(int i=1;i<=n;i++)
    {
        for(int j=1;j<=m[i][0];j++)
        {
            if(!sel[m[i][j]])
            {
                rez[++dr]=m[i][j];
                sel[m[i][j]]=1;   
            }
        }   
    }
}

void intersect(MULTIME m[MAXN],int n,MULTIME rez,int& dr)
{
    int sel[32766];
    for(int i=1;i<=32766;i++) sel[i]=0;    
    dr=0;
    int max=-1;
    for(int i=1;i<=n;i++)
    {
        for(int j=1;j<=m[i][0];j++)
        {
            sel[m[i][j]]++;
            if(max < sel[m[i][j]]) max=sel[m[i][j]];
        }   
    }    
    for(int i=0;i<=32766;i++) if(sel[i]==max) rez[++dr]=i;
}

void scad(MULTIME m[MAXN],int n,MULTIME rez,int& dr)
{
    int a=0,b=0;
    dr=0;
    printf("\nDatzi numarul de ordine al multimilor care vor fi scazute: ");
    scanf("%i%i",&a,&b);
    for(int i=1;i<=m[a][0];i++)
    {
        int apare=0;
        for(int j=1;j<=m[b][0] && !apare;j++)
        if(m[a][i]==m[b][j]) apare=1;
        if(!apare) rez[++dr]=m[a][i];
    }
}
