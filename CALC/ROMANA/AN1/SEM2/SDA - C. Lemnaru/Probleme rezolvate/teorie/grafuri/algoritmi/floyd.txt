#include<stdio.h>
#include<conio.h>

void main()
{
    int i,j,k,n,a[10][10],d[10][10];
    printf("Introduceti numarul de varfuri: ");
    scanf("%d",&n);
    printf("\nIntroduceti matricea costurilor(0 pentru bucla si 999 daca nu exista muchie)\n");
    for(i=1;i<=n;i++)
    for(j=1;j<=n;j++)
    {
        scanf("%d",&a[i][j]);
        d[i][j]=a[i][j];
    }



    for(k=1;k<=n;k++)
    for(i=1;i<=n;i++)
    for(j=1;j<=n;j++)
    if((d[i][k]+d[k][j])<d[i][j])
    d[i][j]=d[i][k]+d[k][j];
    printf("\nToate caile de cost minim:\n");
    for(i=1;i<=n;i++)
    {
       for(j=1;j<=n;j++)
       //printf("%5d",d[i][j]);
       // printf("\n");
    if(i!=j)
    printf("%d->%d,cost=%d\n",i,j,d[i][j]);
    }
    getch();
}
