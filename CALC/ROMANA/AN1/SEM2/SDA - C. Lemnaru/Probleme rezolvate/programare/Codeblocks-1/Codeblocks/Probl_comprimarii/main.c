#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int cif(int m)    //Calculeaza pe cati biti se poate scrie m
{
    int n=0;
    while(m>0)
    {
        n++;
        m=m/2;
    }
    return n;
}


void transformare(int m,int a[100][10],int n)  //Crearea matricei cu secventele generate de m
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
    a[1][0]=1;
}

void afisare(int a[100][10],int m,int n)   //afisarea matricei
{
    int i,j;
    printf("Secventele sunt: \n");
    printf("0) 0\n1) 1\n");
    for(i=2;i<=m;i++)
    {
        printf("%d) ",i);
        for(j=1;j<=n;j++)
            printf("%d",a[i][j]);
        printf("\n");
    }
}

void ap(int a[100][10],int n,int m,char s[100])
{
    int i,x[100],p,k,j,poz,ok;
    p=strlen(s)-1;
    for(i=0;i<=p;i++)
        x[i]=s[i]-'0';
    k=0;
    while(k<=p)
    {
        poz=k;
        ok=0;
        if(p-k>=n) // Daca mai am n pozitii in sir-x
        for(i=2;i<=m;i++)
        {
            k=poz;
            if(a[i][1]==x[k])  //
            {
                ok=1;
                for(j=2;j<=n;j++)
                {
                    k++;
                    if(a[i][j]!=x[k])
                    {
                         ok=0;
                     //    break;
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
    char s[100];
    int m,a[100][10],n;
    FILE *f;
    f=fopen("fis.txt","r");
    fscanf(f,"%d",&m);
    fscanf(f,"%s",s);
    fclose(f);
    n=cif(m);
    printf("m=%d\n\n",m);
    printf("Sirul citit e: %s\n\n",s);
    transformare(m,a,n);
    afisare(a,m,n);
    printf("\nSecventa de lungime minima este:");
    ap(a,n,m,s);
    printf("\n");
    return 0;
}
