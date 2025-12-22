#include <stdio.h>
#include <stdlib.h>
FILE *df;
int c[50];

int varf(int n)
{   int s=0,i;
    for(i=1;i<=n;i++)
    s=s+c[i];
    if(s==(n*2))
    return(1);
    else
    return(0);
}
void BF (int a[50][50],int n)
{
    int viz[10],p,x,v,i,u;
    for( i=1;i<=n;i++)
        c[i]=viz[i]=0;
    printf("\nVarf de pornire pentru BF: ");
    scanf("%d",&x);
    c[1]=x;
    viz[x]=1;
    p=1;
    u=1;
    while(p<=u)
    {
        v=c[p];
        for(i=1; i<=n; i++)
            if(a[v][i]==1 && viz[i]==0)
            {
                u++;
                c[u]=i;
                viz[i]=1;
            }
        p++;
    }
    for (i=1; i<=u; i++)
        printf("%d ",c[i]);
}

void DF (int x,int a[50][50],int n)
{
    int st[50],viz[50],i,k,v,y;
    for (i=1;i<=n;i++) viz[i]=0;
    st[1]=x;viz[x]=1;
    printf("%d " ,x);
    k=1;
    while (k>0)
        {
            v=st[k];y=0;
            for (i=1;i<=n;i++)
                if((a[v][i]==1) && (viz[i]==0) )
                        {
                            y=i; break;
                        }
                if (y==0) k--;
                else { printf("%d ",y);
                       viz[y]=1;
                       st[++k]=y;
                     }
        }
}
int main()
{
    int a[50][50],i,j,n,x,y;
    df=fopen("graf.txt","r");
    fscanf(df,"%d",&n);
    for(i=1;i<=n;i++)
        for(j=1;j<=n;j++)
            a[i][j]=0;
    do
    {
        fscanf(df,"%d %d",&i,&j);
        a[i][j]=1;
    }
    while(i!=0 && j!=0);

printf("Varful de inceput pentru DF: ");
scanf("%d",&x);

DF(x,a,n);
BF(a,n);
fclose(df);
return(0);
}
