#include <stdio.h>
#include <conio.h>
#include <math.h>

int main()
{
  int i,j,min,max,pozmin,pozmax,n;
  int s[20];
  printf("\n Please input the numbers of elements \n");//we read the number of elements
  scanf("%5d",&n);
  for (i=1;i<=n;i++)//we read the numbers in a vector
    {
      printf("\n Please input the value \n",i);
      scanf("%5d",&s[i]);
    }
  max=s[1];//we assume that the first element is maximum
  pozmax=1;//and of course, the position of the maximum element is 1
  for (i=2;i<=n;i++)//we calculate the maximum from the vector
      if (s[i]>max)//when we found an element greater than max, we assign it to max, and the position of it to posmax
        {
        max=s[i];
        pozmax=i;
      }

  min=s[1];//we assume that the first element is minimum
  pozmin=1;//and of course, the position of the minimum element is 1
  for (j=2;j<=n;j++)//we calculate the minimum from the vector
       if (s[j]<min)//when we found an element smaller than min, we assign it to min, and the position of it to posmin
        {
        min=s[j];
        pozmin=j;
         }

  printf("\n The maxim number is:%6d \n",max);//we display the maximum and its position
  printf("\n and the position is:%6d \n",pozmax);
  printf("\n The minimum number is:%6d \n",min);//we display the minimumm and its position
  printf("\n and the position is:%6d \n",pozmin);
  getch();
}

