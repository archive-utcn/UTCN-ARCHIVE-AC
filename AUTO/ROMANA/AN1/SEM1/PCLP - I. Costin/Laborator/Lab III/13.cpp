#include <stdio.h>
#include <conio.h>
#include <math.h>

int main()
{
  int n,i,v,ok;
  int x[20];
  printf("\n Please input the value of number n \n");//we read the number of elements from the vector
  scanf("%5d",&n);
  for (i=1;i<=n;i++)//we read the elements from the vector
    {
      printf("\n Please input the number from the vector on position%d \n",i);
      scanf("%5d",&x[i]);
    }
    
  printf("\n Please input the number you want to look for \n");
  scanf("%5d",&v);
  ok=0;//we assume that the number is not in vector
  for (i=1;i<=n;i++)
    if (x[i]==v)//we found the number
      {
        ok=1;//so, ok becomes 1(because we found the value)
        printf("\n Yes!The number exists on pozition:%6d\n",i);//we display the position
      }
  if (ok==0)//if ok does not change it state    
    printf("\n The number doesn't exists \n");//we display the fact that the number does not exists
  getch();
}

