#include <stdio.h>
#include <conio.h>
#include <math.h>
int main()
{
  int x;
  printf("\n Please input the year, x= \n");//*we read the year
  scanf("%5d",&x);
  if (((x%4==0)&(x%100!=0)) or (x%400==0))//*a year is bisextile if it divides 4 and 100, or divides 400
     printf("\n The year x is bissextile \n");//*if the condition is true, display the year as bisextle
     else
     printf("\n The year is not bissextile \n");//*else, display the year as not bisextile
  getch();   
}
