#include <stdio.h>
#include <conio.h>
#include <math.h>
 
int search(int x[10], int n, int v)//we make a function to returnh whether a value is or is not in a vector
{
    int i,ok;
    ok=0;
    for (i=1;i<=n;i++)
        if (x[i]==v)
           {
              ok=1;
              break;
              }
    return ok;
}

int main()
{
    int x[20];
    int y[20],z[20];
    int i,m,n,j,k;
    
    printf("\n Please input the numbers of elements of x\n");//we read the 2 strings x and y
    scanf("%d",&n);
    
    printf("\n Please input the numbers of elements of y\n");
    scanf("%d",&m);
    
    printf("\n Please input the elements of x: \n");
    for (i=1;i<=n;i++)
        {
          scanf("%d",&x[i]);
                      }
    
    printf("\n Please input the elements of y: \n");
    for (i=1;i<=m;i++)
        {
          scanf("%d",&y[i]);
                      }
    
    k=0;//we calculate the common elements
    
    for (i=1;i<=n;i++)
         {
        for (j=1;j<=m;j++)
            if (x[i]==y[j])
                 if (search(z,k,x[i])==0)
                      {
                      k=k+1;                  
                      z[k]=x[i];
                      }         
          } 
     printf("\n The common elements are: \n");
     for (i=1;i<=k;i++) 
         printf("%d ",z[i]); 
    
    
    k=0;//we calculate the distinct element of both strings
    for (i=1;i<=n;i++)
        if (search(z,k,x[i])==0)
           {
             k=k+1;
             z[k]=x[i];                  
            }
    for (j=1;j<=m;j++)
        if (search(z,n,y[j])==0)
           {
             k=k+1;
             z[k]=y[j];                  
            } 
    printf("\n The distinct elements of both strings are: \n");
     for (i=1;i<=k;i++) 
         printf("%d ",z[i]); 
   
    k=0;//we calculate the elements which belong only to the first string
    for (i=1;i<=n;i++)       
        {
        for (j=1;j<=m;j++)
            if (search(y,m,x[i])==0)
                 if (search(z,k,x[i])==0)
                 {
                    k=k+1;          
                    z[k]=x[i];         
                 }             
        } 
    printf("\n The elements belonging to first strings are: \n");
     for (i=1;i<=k;i++) 
         printf("%d ",z[i]);         
    getch();
    return 0;
}
