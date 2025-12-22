#include <stdio.h>
#include <conio.h>
#include <math.h>

int main()
{
    int x[10][10];
    int n,i,j,ok;
    printf("\n Please input the number of columns and rows :\n");//we read the matrix
    scanf("%d",&n);
    printf("Please input the elements of the matrix :\n");
    
            
    for (i=1;i<=n;i++)
        {
          for (j=1;j<=n;j++)
              {
                 printf("\n input the element [%d,%d]\n",i,j);
                 scanf("%d",&x[i][j]);          
              }
        }
    for (i=1;i<=n;i++)//we display the matrix
        {
          for (j=1;j<=n;j++)
              printf("%d ",x[i][j]);
          printf("\n");              
        }
    
    ok=1;//we assume that the matrix is symmetric
    for (i=1;i<=n;i++)
         {
         for (j=1;j<=n;j++)
            if (x[i][j]!=x[j][i])//if this condition is respected than the matrix is not symmmetric
            {
             ok=0;
             break;
            }
}
    if (ok==1)//display the status of matrix
       printf("\n The matrix is symmetric \n");
       else
       printf("\n The matrix is not symmetric \n");
    getch();     
}
