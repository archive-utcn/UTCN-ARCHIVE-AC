#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 
int n, l[40], lung_tot;
int s; //the sum of the rods in a step of the sollution
int x[200]; //the solltion -> the rods chosen
int bx[40]; //the best solltion found
int best=60000; //the min lost length
 
void back (int k)//k represent each step
{
  int i;
  if (lung_tot-s>=0 && lung_tot-s<best)
     {
       best=lung_tot-s;
       memset(bx,0,sizeof(bx));
       bx[0]=k-1;
       for (i=1;i<k;i++)
       bx[x[i]]++;
     }
  if (s<lung_tot)
    {
      for (i=1;i<=n;i++)
         {
          x[k]=i;
          s+=l[i];
          back (k+1);
          s-=l[i];
         }
    }
}
 
int main ()
{
   int sum=0,i; 
   printf("\n Please input the number of rods : \n");
   scanf("%d", &n);
   printf("\n Please input the lengths of the rods : \n");
   for (i=1;i<=n;i++)
     {
       scanf("%d", &l[i]);
       sum+=l[i];
     }
    printf("\n Please input the length of the rod : \n");
    scanf("%d", &lung_tot);
    if (lung_tot<sum)
      {
        printf("\n The conditions of the problem are not met!\n");
        system("PAUSE");
        exit(0);
      }
    lung_tot-=sum;
    back (1);
    printf("\n Total length lost %d \n", best);
    for (i=1;i<=n;i++)
       printf("\n The rod nr %d with length %d was chosen %d times\n", i, l[i], bx[i]+1);
    system("PAUSE");
}
