/* Program 3.3 */
#include<stdio.h>
#include<conio.h>

void read_pairs(int *n, int x[], int y[])
{
     int i;
     printf("Input n=");
     scanf("%d",n);
     for (i=0; i<*n; i++)
         {
          printf("x[%d]=",i);
          scanf("%d",&x[i]);
          printf("y[%d]=",i);
          scanf("%d",&y[i]);
          }
     printf("\n");
}
void set(int n,int x[],int y[],int *m, int z[])
{
     int i,j,k,lx,ly;
     k=0;
     z[0]=x[0];
     if (x[0]!=y[0])
        {k++;
         z[k]=y[0];
        }
     for (i=1; i<n; i++)
         {
          lx=0; ly=0;
          for (j=0; j<=k; j++)
               {
                    if (x[i]==z[j]) lx=1;
                    if (y[i]==z[j]) ly=1;
                }
          if (lx==0) {k++; z[k]=x[i];}
          if ((ly==0) && (x[i]!=y[i])) {k++; z[k]=y[i];}
         }
      *m=k;
      printf("\nThe set M is:");
      for (i=0; i<=k; i++) printf("%d ",z[i]);
      printf("\n");
}
int reflexive(int n,int x[],int y[],int m, int z[])
{
    int i,j,e1,e2;
    e2=1;
    for (i=0; i<=m; i++)
        {
         e1=0;
         for (j=0; j<n; j++)
             if ((z[i]==x[j]) && (z[i]==y[j])) e1=1;
         if (e1==0) e2=0;
         }
    return e2;
}
int symmetric(int n,int x[],int y[])
{
    int i,j,e1,e2;
    e2=1;
    for (i=0; i<n; i++)
        {
         e1=0;
         for (j=0; j<n; j++)
              if ((x[i]==y[j]) && (y[i]==x[j])) e1=1;
         if (e1==0) e2=0;
         }
     return e2;
}
int transitive(int n, int x[],int y[])
{
    int i,j,e1,e2,k;
    e2=1;
    for (i=0; i<n; i++)
        {
         for (j=0; j<n; j++)
             if (y[i]==x[j])
                {
                 e1=0;
                 for (k=0; k<n; k++)
                     if ((x[k]==x[i]) && (y[k]==y[j])) e1=1;
                 if (e1==0) e2=0;
                 }
         }
    return e2;
}

main()
{
    int n,x[100],y[100],z[100],m,r,s,t;

    read_pairs(&n,x,y);
    set(n,x,y,&m,z);
    r=reflexive(n,x,y,m,z);
    s=symmetric(n,x,y);
    t=transitive(n,x,y);
    printf("%d %d %d",r,s,t,"\n");
    if ((r==1) && (s==1) && (t==1)) printf("\nR is an equivalence relation");
    else printf("\nR isn't an equivalence relation");

    getch();
    return 0;
}

