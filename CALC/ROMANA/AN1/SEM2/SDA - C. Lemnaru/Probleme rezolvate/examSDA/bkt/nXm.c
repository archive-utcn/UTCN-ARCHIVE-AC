#include<conio.h>
#include<stdio.h>
#include<stdlib.h>
typedef struct stud
{
    int randam[100];
}STUD;
int v[100],n,b[100],sum;
STUD a[100];
int conditie()
{
    int i,j;
    int z=1;
    for(i=0;i<n;i++)
        for(j=0;j<n;j++)
        {
            if((v[i]==v[j])&&(i!=j))
            z=0;

        }
    return z;

}

int bkt(int t)
{
    int i,j,s;
    for(j=0;j<n;j++)
    {
        v[t]=j;
        if(t<n-1) bkt(t+1);
        {
            if(conditie())
            {
                s=0;
                for(i=0;i<=n;i++)
                    s=s+a[i].randam[v[i]];
                    if(s>sum)
                    {
                    for(i=0;i<n;i++)
                        b[i]=v[i];
                    sum=s;
                    }
                }
            }
        }
    }

int main()
{
    int i;
    n=3;
    a[0].randam[0]=4;
    a[0].randam[1]=1;
    a[0].randam[2]=6;

    a[1].randam[0]=3;
    a[1].randam[1]=7;
    a[1].randam[2]=1;

    a[2].randam[0]=0;
    a[2].randam[1]=3;
    a[2].randam[2]=8;
    sum=0;
    bkt(0);
    for(i=0;i<n;i++)
    printf("%d",b[i]);
    printf("\n%d",sum);
}
