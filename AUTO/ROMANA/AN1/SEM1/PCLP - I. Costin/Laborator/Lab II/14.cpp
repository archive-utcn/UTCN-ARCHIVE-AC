#include <stdio.h>
#include <conio.h>

int main()
{
    int s,h,a;
    float w;
    w=0;//*we initialize w with 0; w represent the variable in which we calculate the weight
    printf("\n Please input the height(cm) \n");//*we read the height of the person
    scanf("%5d/",&h);
    printf("\n Please input the age(years) \n");//*we read the age of the person
    scanf("%5d/",&a);
    w=50+(0.75*(h-150))+((a-20)/4);//*we apply this formula to calculate the weight      
    printf("\n Please input your sex: 1-for female and 0-for male \n");//*we must know if the person is woman or man
    scanf("%5d/",&s);
    if (s==1)//*if the person is woman then the weight is w-10
       printf("\n The weight of female is:%6.3f\n",(w-10));      
       else
           printf("\n The weight of male is:%6.3f \n ",w);//*we dislay the weight after that formula
    getch();      
}
