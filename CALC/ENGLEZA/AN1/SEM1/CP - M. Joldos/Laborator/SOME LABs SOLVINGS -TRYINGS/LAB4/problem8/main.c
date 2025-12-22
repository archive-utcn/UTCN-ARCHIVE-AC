#include <stdio.h>
#include <stdlib.h>
#include<math.h>

int main()
{
   int n,i,a[100],x,y=0;
   double f;
   scanf("%d",&n);
   for(i=0;i<n;i++)
   {
        scanf("%d", &a[i]);
   }
   scanf("%d",&x);
   for(i=0;i<n;i++)
   {
       f=a[i]*pow(x,i);
       y=y+f;
   }
   printf("%d",y);
    return 0;
}
