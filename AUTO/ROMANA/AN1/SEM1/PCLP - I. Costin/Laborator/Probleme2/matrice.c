#include<stdio.h>
int suma_linie(int m[][100],int n,int l)
{
    int j,s=0;
    for(j=0; j<n; j++)
        s=s+m[l][j];
    return s;

}
int suma_coloana(int m[][100],int n,int c)
{
    int i,s=0;
    for(i=0; i<n; i++)
        s=s+m[i][c];
    return s;

}
int suma_d_principala(int m[][100],int n)
{
    int i,j,s=0;
    for(i=0; i<n; i++)
        for(j=0; j<n; j++)
            if(i==j)
                s=s+m[i][j];
    return s;

}
int suma_d_secundara(int m[][100],int n)
{
    int i,j,s=0;
    for(i=0; i<n; i++)
        for(j=0; j<n; j++)
            if((i+j)==n-1)
                s=s+m[i][j];
    return s;

}
int verificare(int a[][100],int n)
{
    int i,ok=0;
    for(i=0; i<n; i++)
    {if(suma_linie(a,n,i)!=suma_coloana(a,n,i))
            ok++;
    }
    if(suma_d_principala(a,n)!=suma_d_secundara(a,n))
        ok++;
   if(ok==0)
    return 1;
    else return 0;
}
void main()
{
    int ok,i,j,n,a[100][100];
    do
    {
        printf("\n\n1. citirea matricei\n");
        printf("2. afisarea matricei\n");
        printf("3. verificare daca este matrice magica\n");
        printf("0. iesire\n");
        scanf("%d",&ok);
        switch(ok)
        {

        case 1:
        {
            printf("\ndati ordinul matricei\n");
            scanf("%d",&n);
            for(i=0; i<n; i++)
                for(j=0; j<n; j++)
                {
                    printf("a[%d][%d]= ",i,j);
                    scanf("%d",&a[i][j]);
                }
        }
        break;
        case 2:
        {
            for(i=0; i<n; i++)
            {
                printf("\n");
                for(j=0; j<n; j++)
                    printf("%3d",a[i][j]);
            }
        }
        break;
        case 3:
        {
            if(verificare(a,n))printf("\nmatricea este magica.\n");
            else printf("\nmatricea nu este magica\n");
        }
        break;
        case 0:return 0;
        default :
            printf("\noptiunea aleasa nu exista\n");
        }
       } while(ok);

}
