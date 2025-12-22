#include<stdio.h>

int st[20],v[20],m[20][20],drum[20][20],suma[20],c=0,min;

int verificare(int k,int n)
{
    if(v[st[k]])
        return 0;
    if(k<n-1)
        return(m[st[k-1]][st[k]]);
}

void TSP(int k,int n)
{
    int i,sum;
    for(st[k]=1;st[k]<n;st[k]++)
    {
    if(verificare(k,n))
    {
    v[st[k]]=1;
    if(k==n-1)
    {
        sum=0;
        printf("\n\nDrum posibil %d : ",c+1);
    for(i=0;i<n;i++)
    {
        printf(" %d ",st[i]);
        drum[c][i]=st[i];
        sum=sum+m[st[i]][st[i+1]];
    }
    printf(" : %d",sum);
    suma[c]=sum;
    if(c==0 || sum<min)
        min=sum;
        c++;
        v[st[k]]=0;
        getch();
}
    else
        TSP(k+1,n);
        v[st[k]]=0;
}
}
}


void main()
{
    int i,n,j;
    int cost;
    printf("\nIntroduceti numarul de varfuri : ");
    scanf("%d",&n);
    printf("\n\n Introduceti costul dintre varfuri(0 daca nu e drum) : \n\n");
    printf("\nVarfuri \tCost\n\n");
    for(i=0;i<n;i++)
        for(j=i+1;j<n;j++)
        {
        printf("\n %d--------- %d :",i,j);
        scanf("%d",&cost);
        if(cost)
        m[i][j]=m[j][i]=cost;
        }
    v[0]=1;
    TSP(1,n);
    if(!c)
        printf("\n\nNici o cale care sa acopere toate orasele\n\n");
    else
        {
        printf("\n\nCostul minim este %d si modurile de parcurgere sunt: \n",min);
        for(i=0;i<c;i++)
        if(suma[i]==min)
        {
            printf("\nCale minima : ");
            for(j=0;j<n;j++)
            printf(" %d ",drum[i][j]);
        }
        }
    getch();
}
