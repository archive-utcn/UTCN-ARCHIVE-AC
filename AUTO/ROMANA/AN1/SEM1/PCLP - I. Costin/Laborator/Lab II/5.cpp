#include <stdio.h>
#include <conio.h>

int main()
{
int x;
float func;
printf("\n Please input the value of x \n");//*we read the variable x
scanf("%5d",&x);
func==0;//*we initialize func with 0; in func we will calculate the result of the function
if (x>-2)//*we test the condition of the function for x, in order to know what expression we shall do for the x we read
   func=x*x+5*x;
   else
       if (x<-2) 
          func=x*x+4*x+4;
          else
              if (x==0)
                 func=0;
printf("\n The function is: %6.3f\n",func); //*we display the result of the function                                   
getch();
}
