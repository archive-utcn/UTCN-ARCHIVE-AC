#include <stdio.h>
#include <conio.h>
int main()
{
int x;
printf("\n Please input the value of x: \n");//*we read  the variable x
scanf("%d",&x);
printf("\n %d\n",sizeof(x));//*we display, using the predefined function sizeof(), the number of bytes
getch();
}
