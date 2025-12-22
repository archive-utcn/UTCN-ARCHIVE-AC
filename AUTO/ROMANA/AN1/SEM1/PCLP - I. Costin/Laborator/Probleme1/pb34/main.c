/* 34. Se citeste de la tastatura ora, minutul si secunda indicate de un ceas.
Sa se calculeze unghiul masurat în sens trigonometric între indicatorul orar si
minutar. */

#include<stdio.h>
#include<stdlib.h>
int main()
{
int h,m,s,gr_m,gr_h,min;
printf("\n Introduceti ora ");
scanf("%d",&h);
printf("\n Introduceti minutul ");
scanf("%d",&m);
printf("\n Introduceti secunda ");
scanf("%d",&s);
if(h>12) h=h-12;
else if(h==12) h=0;
gr_h=h*30;
gr_m=m*6;
if(gr_m>gr_h) printf("%d",gr_m-gr_h);
else printf("%d",gr_h-gr_m);
return 0;
}
