#include <stdio.h>
#include <conio.h>
#include <math.h>
#include <string.h>

int p[10],q[10],r[10];
int i,j,n,m,k;

void sum(int p[10], int q[10])//calculate the sum of 2 polinoms
{
     for (i=0;i<=m;i++)//we assume that m < n, and we add the coefficients on the same position in the 2 polinoms
      r[i]=p[i]+q[i];
     for (i=m+1;i<=n;i++)
       r[i]=p[i];    
}

void difference(int p[10], int q[10])//calculate the difference of 2 polinoms 
{
     for (i=0;i<=m;i++)//we assume that m<n
         r[i]=p[i]-q[i];
     for (i=m+1;i<=n;i++)
         r[i]=p[i];
}

void product(int p[10], int q[10])//calculate the product between 2 polinoms
{
     for (i=1;i<=n+m;i++)//we initialize the product polinom(the vector of coefficients)
         r[i]=0;
     for (i=0;i<=n;i++)//we make the product; the degree of the new polynom is n+m
         {
          for (j=0;j<=m;j++)
              r[i+j]=r[i+j]+p[i]*q[j];             
          }
}

void division(int p[10],int q[10])
{ 
   int i,j,k,z[10],r[10];
   if(n<m)
      {
        printf("\nA(x)/B(x)=0 and the remainder ");
        for(i=0;i<=n-1;i++)
            printf("%d*x^%d + ",p[i],i);
        printf("%d*x^%d",p[n],n);
      }
    else
      { 
        for(i=n-m,j=n;i>=0;i--,j--)
           {
              z[i]=p[j]/q[m];
              for(k=m;k>=0;k--)
                  p[i+k]=p[i+k]-z[i]*q[k];
              p[j]=0;
           }
         for(i=0;i<=m-1;i++)
             r[i]=p[i];
         printf("\nP(x)/Q(x)=");
         for(i=0;i<=n-m-1;i++)    
            printf("%d*x^%d + ",z[i],i);
         printf("%d*x^%d",z[n-m],n-m);
         printf(" and the remainder ");
         for(i=0;i<=m-2;i++)
            printf("%d*x^%d + ",r[i],i);
         printf("%d*x^%d",r[m-1],m-1);
     }
}

    
void display(int p[10], int n)//display a polinom
{
     for (i=0;i<=n;i++)
         printf("%d *x^ %d + ",p[i],i);
 }
 
int main()//principal program
{
    printf("\nPlease input the degree of p: \n)");//we read the polinoms p and q
    scanf("%d",&n);
    printf("\n Please input the degree of q: \n");
    scanf("%d",&m);
    printf("\n Please input the coefficients of the polinom p: \n");
    for (i=0;i<=n;i++)
    {
        printf("\n %d \n",i);
        scanf("%d",&p[i]);
    }
    printf("\n Please input the coefficients of the polinom q: \n");
    for (i=0;i<=m;i++)
    {
        printf("\n %d \n",i);
        scanf("%d",&q[i]);
    }
    printf("\n The polinomial sum is: \n");//we display the sum polinom
    sum(p,q);
    display(r,n);
    printf("\n The polinomial difference is: \n");//we display the difference polinom
    difference(p,q);
    display(r,n);
    printf("\n The polinomial product is: \n");//we display the product polinom
    product(p,q);
    display(r,n+m);
    printf("\n The polinomial rate is: \n");//we display the product polinom
    division(p,q);
    getch();
}
