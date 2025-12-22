#include<stdio.h>
#include<stdlib.h>
#include<conio.h>

int st[50],p=0;

void adancime (int x,int a[50][50],int n)
{
    int sc[50],viz[50],i,k,v,y;
    for (i=1;i<=n;i++)
    viz[i]=0;
    sc[1]=x;
    viz[x]=1;
    k=1;
    st[1]=x;
    while (k>0)
        {
        v=sc[k];y=0;
        for (i=1;i<=n;i++)
            if((a[v][i]==1) && (viz[i]==0) )
                    {
                        y=i; break;
                    }
            if (y==0) k=k-1;
            else { push(y);
                    viz[y]=1;
                    sc[++k]=y;
                    }
        }
}

void push(int b)
{   int i;
    p=p+1;
    for(i=p;i>=0;i--)
    st[i+1]=st[i];
    st[1]=b;
}

int main()
{   int n,i,j;
    FILE *f;
    int a[50][50],b[20][20];
    f=fopen("fis.txt","r");
    fscanf(f,"%d",&n);
    for(i=1;i<=n;i++)
       for(j=1;j<=n;j++)
        fscanf(f,"%d",&a[i][j]);
    while(n>p)
    {adancime(1,a,n);}
    printf("Afisare matrice:\n\n");
    for(i=1;i<=n;i++){
    for(j=1;j<=n;j++)
    printf("%d ",a[i][j]);
    printf("\n");
}
for(i=1;i<=n;i++)
{
    for(j=1;j<=n;j++)
    b[i][j]=a[i][j];
}

for(i=1;i<=n;i++)
{
    for(j=1;j<=n;j++)
    a[i][j]=b[j][i];
}
printf("\n");
printf("Afisare matrice transpusa:\n\n");
for(i=1;i<=n;i++)
{
    for(j=1;j<=n;j++)
    printf("%d ",a[i][j]);
    printf("\n");
}
    printf("\nAfisare componente:");
    adancime(1,a,n);
    for(i=1;i<=n;i++)
    printf(" %d ",st[i]);
    printf("\n");
    return(0);

}
