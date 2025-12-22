#include <conio.h>
#include <stdio.h>

int main()

{
int a,i,j;
int s[20]; 
printf("\n Please input your birth year \n");//*we read the birth year
scanf("%d",&a);
i=0;//*we initialize i with 0; i represent the length of the string in which we memorize the binary representation of the year 
do {
i=++i;//*we increse the position i with 1
s[i]=a%2;//*we take the rest from the division of year with 2  in order to convert the year in base 2
a=a/2;}//*we assign to a the value a/2 
while (a!=0);//*we do this operation until a==0
for (j=i;j>0;j=j-1) printf("%d",s[j]);//*we diplay the string
getch();
}
