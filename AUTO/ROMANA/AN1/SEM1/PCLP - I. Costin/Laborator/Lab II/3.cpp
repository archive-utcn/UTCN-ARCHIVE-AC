#include <stdio.h>
#include <conio.h>
#include <math.h>
int main()
{
    int x;
    float y,s,c,t;
    s=0;//*we initialize the variables in which we calculate sinus,cosinus and tangente 
    t=0;
    c=0;
    printf("\n Please input the value of x (degrees)\n");//*we read the angle in degreed in variable x
    scanf("%5d",&x);
    y=((x*3.14)/180);//*we apply the transforming fromula from degrees to radians
    s=sin(y);//*we calculate sin
    c=cos(y);//*we calculate cos
    t=tan(y);//*we calculate tan
    printf("\n The value of sin(y) is :%6.3f\n",s);//*we display the results
    printf("\n The value of cos(y) is :%6.3f\n",c);
    printf("\n The value of tan(y) is :%6.3f\n",t);
    getch();
}
