#include <stdio.h>
#include <conio.h>
#include <math.h>
#include <stdlib.h>

int search(int x[10],int n,int val)//we make a function to return whether a number is or is not in a vector
{
    int p,ok;
    ok=0;
    for (p=1;p<=n;p++)
        if (x[p]==val)
           {
              ok=1;
              break;
              }
    return ok;
}

int main()
{
    int i,n,k,j,aux;
    int x[20],z[20],v[20],w[20];
    
    printf("\n Please input the number of digits \n");
    scanf("%d",&n);
    printf("\n Please input the number \n");//we read the number in a vector
    for (i=1;i<=n;i++)
        {
         printf("input the digit %d \n",i);
         scanf("%d",&x[i]);             
        }
    
    k=0;//calculate the number formed by the distinct digits of it
    for (i=1;i<=n;i++)
           if (search(z,k,x[i])==0)
           {
             k=k+1;
             z[k]=x[i];                           
                      }
    printf("\n The number obtained by the distinct digits of it is: \n");//display the number
    for (i=1;i<=k;i++)
        printf("%d",z[i]);

    for (i=1;i<=n;i++)//calculate the maximal number obtained from the digits of the number read
        v[i]=x[i];
    aux=0;    
    for (i=1;i<n;i++)
        for (j=i+1;j<=n;j++)
            if (v[i]<=v[j])
               {
                  aux=v[i];
                  v[i]=v[j];
                  v[j]=aux;
               }
    printf("\n The maximal number is: \n");//display the number
    for (i=1;i<=n;i++)
        printf("%d",v[i]);
   
   for (i=1;i<=n;i++)//we calculate the number obtained by switching the digits
        w[i]=x[i];
   for (i=1;i<=n/2;i++)
           {  
             aux=w[i];
             w[i]=w[n+1-i];
             w[n+1-i]=aux;            
                         }
   printf("\n The switching number is: \n");//display the number
    for (i=1;i<=n;i++)
        printf("%d",w[i]); 
   getch();
}
