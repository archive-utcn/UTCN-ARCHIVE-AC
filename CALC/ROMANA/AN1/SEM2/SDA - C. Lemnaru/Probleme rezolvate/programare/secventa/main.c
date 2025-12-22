#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int cif(int m)
{
    int n=0;
    while(m>0)
    {
        n++;
        m=m/2;
    }
    return n;
}


void transformare(int m,int a[100][10],int n)
{
    int i,j,cp,poz;
    for(i=0;i<=m;i++)
        for(j=0;j<=n;j++)
            a[i][j]=0;
    for(i=2;i<=m;i++)
    {
        cp=i;
        poz=n;
        while(cp>0)
        {
            a[i][poz]=cp%2;
            cp=cp/2;
            poz--;
        }
    }
    a[1][1]=1;
}

void af(int a[100][10],int m,int n)
{
    int i,j;
    printf("0:0\n1:1\n");
    for(i=2;i<=m;i++)
    {
        printf("%d:",i);
        for(j=1;j<=n;j++)
            printf("%d",a[i][j]);
        printf("\n");
    }
}

void ap(int a[100][10],int n,int m,char s[1000])
{
    int i,x[1000],p,k,j,poz,ok;
    p=strlen(s)-1;
    for(i=0;i<=p;i++)
        x[i]=s[i]-'0';
    k=0;
    //for(i=0;i<=p;i++)
      //  printf("%d ",x[i]);
    //printf("\n");
    while(k<=p)
    {
        poz=k;
        ok=0;
        if(p-k>=n)
        for(i=2;i<=m;i++)
        {
            k=poz;
            if(a[i][1]==x[k])
            {
                ok=1;
                for(j=2;j<=n;j++)
                {
                    k++;
                    if(a[i][j]!=x[k])
                    {
                         ok=0;
                         break;
                    }

                }
                if(ok==1)
                {
                    printf("%d",i);
                    k++;
                    break;

                }
            }
        }
        if(ok==0)
        {
            printf("%d",x[poz]);
            k=poz+1;
        }
    }
}

int main()
{
    char s[1000];
    int m,a[100][10],n;
    FILE *f;
    f=fopen("fis.txt","r");
    fscanf(f,"%d",&m);
    fscanf(f,"%s",s);
    n=cif(m);
    transformare(m,a,n);
    af(a,m,n);
    ap(a,n,m,s);
    return 0;
}
