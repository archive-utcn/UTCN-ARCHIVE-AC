#include<stdio.h>

int st[20],v[20],m[20][20],drum[20][20],suma[20],c=0,min;

int verificare(int k)
{
    if(v[st[k]])
        return 0;
    else
        return 1;
}

void TSP(int k,int n)
{
    int i,sum;
    for(st[k]=1;st[k]<n;st[k]++)
    {
    if(verificare(k))
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
    FILE *f;
    int i,n,j,z,mm,g,h;
    int cost;
    f=fopen("fis1.txt","r");
    fscanf(f,"%d",&n);
    while(!feof(f))
    {
        fscanf(f,"%d", &i);
        fscanf(f,"%d", &j);
        fscanf(f,"%d", &cost);
        m[i][j]=m[j][i]=cost;
    }
    fclose(f);

    v[0]=1;
    TSP(1,n);
    if(c==0)
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
    fclose(f);
}
