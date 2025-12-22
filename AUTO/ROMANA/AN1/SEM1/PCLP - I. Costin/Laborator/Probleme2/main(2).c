#include <stdio.h>
#include <stdlib.h>

int main()
{
    int a[100][100],c,n;

    while (c!=9)
      {
          printf("\n1.Citire matrice:\n");
          printf("2.Afisare matrice:\n");
          printf("3.Parcurgere in spirala:\n");
          printf("4.Elementul minim si maxim\n");
          printf("5.Produsul elementelor de pe diagonala principala\n");
          printf("6.Suma elementelor de pe diagonala secundara\n");
          printf("7.Extragerea intr-un vector a liniei cu cea mai mare suma a elementelor\n");
          printf("8.Verificare daca matricea e simetrica fata de diagonala principala\n");
          printf("9.Exit\n");
          scanf("%d",&c);
          system("cls");

          switch(c)
              {
            case 1: citire(a,&n); break;
            case 2: afisare(a,n); break;
            case 3: spirala(a,n); break;
            case 4: min_max(a,n); break;
            case 5: printf("%d\n",prod(a,n)); break;
            case 6: printf("%d\n",suma(a,n)); break;
            case 7: vector(a,n); break;
            case 8: verif(a,n); break;
              }



      }

    return 0;
}



void citire(int a[100][100], int *n)
{
    int i,j;
    printf("introduceti dimensiunea matricei:\n");
    scanf("%d",n);

    for(i=1;i<=*n;i++)
     for(j=1;j<=*n;j++)
       {
           printf("a[%d][%d]=",i,j);
           scanf("%d",&a[i][j]);
       }
    system("cls");
}


void afisare(int a[100][100], int n)
{
    int i,j;
    printf("elementele matricei sunt:\n");

    for(i=1;i<=n;i++)
     for(j=1;j<=n;j++)
       printf("%d ",a[i][j]);
    printf("\n");
}


void spirala(int a[100][100], int n)
{
    int i,nv,ne,se,sv;
    nv=1;
    ne=n;
    se=n;
    sv=1;


   do
   {
       for (i=nv;i<=ne;i++)
         printf(" %d ",a[nv][i]);
       nv=nv+1;
       for (i=nv;i<=se;i++)
         printf(" %d ",a[i][se]);
       se=se-1;
       for (i=se;i>=sv;i--)
         printf(" %d ",a[se+1][i]);
       for (i=se;i>=nv;i--)
         printf(" %d ",a[i][nv-1]);
       ne=ne-1;
       sv=sv+1;

   }
   while (se>n/2);
}


void min_max(int a[100][100], int n)
{
    int m1,m2,i,j;
    m1=a[1][1];
    m2=a[1][1];
    for(i=1;i<=n;i++)
      for(j=1;j<=n;j++)
        {
            if (a[i][j]<m1) m1=a[i][j];
            if (a[i][j]>m2) m2=a[i][j];
        }
    printf("elementul minim: %d\n",m1);
    printf("elementul maxim: %d\n",m2);
}


int prod(int a[100][100], int n)
{
    int p=1,i;
    for(i=1;i<=n;i++)
      p=p*a[i][i];
    return p;

}

int suma(int a[100][100], int n)
{
    int i,s=0;
    for(i=1;i<=n;i++)
      s=s+a[i][n-i+1];
    return s;
}

void vector(int a[100][100], int n)
{
    int s,i,j,k,t;
    k=1;
    t=~0+1;
    for(i=1;i<=n;i++)
     {
         s=0;
         for(j=1;j<=n;j++)
           s=s+a[i][j];
         if (s>t)
                {
                    t=s;
                    k=i;
                }
     }

    for (i=1;i<=n;i++)
     printf("%d ",a[k][i]);
}

void verif(int a[100][100], int n)
{
    int i,j,t=0;
    for(i=1;i<=n;i++)
      for(j=1;j<=n;j++)
        {
            if (a[i][j]!=a[j][i]) t=1;
        }
    if (t==0) printf("matricea e simetrica");
       else printf("matricea nu e simetrica");

}
