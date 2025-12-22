#include<stdio>
int n,a[20][20];
void citire()
{
    FILE *f,*g;
    f=fopen("floyd2.txt","r");
    int i,j;
    fscanf(f,"%d",&n);
    for(i=1;i<n;i++)
        for(j=1;j<n;j++)
                fscanf(f," %d ",&a[i][j]);
}
void floyd()
{
    int i,j,k;
    for(k=1;k<n;k++)
        for(i=1;i<n;i++)
            for(j=1;j<n;j++)
                if((a[i][j] > a[i][k]+ a[k][j]) || (!a[i][j] && i!=j))
                   a[i][j]= a[i][k]+a[k][j];
        }

void afisare()
{
    int i,j;
    for(i=1;i<n;i++)
       {    for(j=1;j<n;j++)
            printf(" %d ",a[i][j]);
            printf("\n");
       }
}

int main()
{
    citire();
    floyd();
    afisare();
    return 0;
}
