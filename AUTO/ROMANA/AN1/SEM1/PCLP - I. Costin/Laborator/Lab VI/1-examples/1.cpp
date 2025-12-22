/* Program L6Ex1.cpp */
/* Shows a use of an array as a formal parameter */

#include <stdio.h>
#include <conio.h>

void Max_min1(int n,int a[],int *max,int *min)
{
   int i;
   *max=a[0];
   *min=a[0];
   for (i=1;i<n;i++)
     {
       if (a[i]>*max)
           *max=a[i];
       else 
           if (a[i]<*min) 
              *min=a[i];
     }
}

void Max_min2(int n,int *a,int *max,int *min)
{
   int i;
   *max=a[0];
   *min=a[0];
   for (i=1;i<n;i++)
     {
       if (a[i]>*max) 
          *max=a[i];
       else 
          if (a[i]<*min) 
              *min=a[i];
     }
}

int main(void)
{
   int i,n,maximum,minimum;
   int x[100];
   /* Data input */
   printf("\n Maximum and minimum element of integer array x.\n Array size is:");
   scanf("%d",&n);
   for(i=0;i<n;i++) 
     {
        printf("\n x[%d]=",i);
        scanf("%d",&x[i]);
     }
   /* Call of the first procedure */
   Max_min1(n,x,&maximum,&minimum);
   printf("Max_min1: maximum= %d and minimum= %d\n", maximum, minimum);
   /* Call of the second procedure */
   Max_min2(n,x,&maximum,&minimum);
   printf("Max_min2: maximum= %d and minimum= %d\n", maximum, minimum);
   /*system("PAUSE");*/
   getch();
}
