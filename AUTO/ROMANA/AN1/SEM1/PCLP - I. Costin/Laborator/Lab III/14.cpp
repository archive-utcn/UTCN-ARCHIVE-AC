#include <stdio.h>
#include <conio.h>
#include <math.h>
 

int main()
{
    int x[20];
    int n,i,max,poz,m,j;
    printf("\n Please input the number of elements \n");//we read the numbers of elements and the elements
    scanf("%d",&n);
    printf("\n Please input the elements \n");
    for (i=1;i<=n;i++)
        {
         printf("input the element %d \n",i);
         scanf("%d",&x[i]);             
        }
        
    max=0;//we assume that there no exists a maximum sequence
    poz=0;//and the position is 0, of course
    for (i=1;i<=n;i++)
        {
         j=i+1;
         while (x[j]>x[j-1])//if this condition is respected, then we increase j
               j=j+1;
         m=j-i;    
         if (m>max)
            { 
              max=m;
              poz=i; 
            }        
         }
    for (i=poz;i<poz+max;i++)//display the sequence
        printf("%d ",x[i]);                  
    getch();
}
