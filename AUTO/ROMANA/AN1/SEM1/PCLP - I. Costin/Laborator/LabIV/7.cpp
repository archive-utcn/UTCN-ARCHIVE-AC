#include<conio.h>
#include<stdlib.h>
#include<stdio.h>


int nr_of_day(int year,int month,int day)//calculate the numbers of days passed
{  
   int feb,nrday=0;
   if(year%4==0) 
         feb=1;
   else feb=1;
   
    switch(month-1)
     {
       case 0:nrday=day;break;
       case 1:nrday=31+day;break;
       case 2:nrday=59+feb+day;break;
       case 3:nrday=90+feb+day;break;
       case 4:nrday=120+feb+day;break;
       case 5:nrday=151+feb+day;break;
       case 6:nrday=181+feb+day;break;
       case 7:nrday=212+feb+day;break;
       case 8:nrday=243+feb+day;break;
       case 9:nrday=273+feb+day;break;
       case 10:nrday=304+feb+day;break;
       case 11:nrday=334+feb+day;break;
      }
    return nrday;
}

int nr_of_days_left(int year,int month,int day)//calculate the numbers of days left
{ 
    if(year%4==0)  
             return 366-nr_of_day(year,month,day);//is a bisextile year
    else 
             return 365-nr_of_day(year,month,day);//is not a bisectile year
}

int main()
{ 
    int year,month,day;
    int months[12]={31,28,31,30,31,30,31,31,30,31,30,31};
    printf("Input the year");//we read the year
    scanf("%d",&year);
    
    do
     {
        printf("\n Input the month(1<=month<=12)\n");//we read the month
        scanf("%d",&month);
     } 
    while(month<1||month>12);
    
    if(year%4==0) 
       months[1]++;
  
    do
      {
         printf("\n Input the day(1<=day<=28/29/30/31\n");//we read the day
         scanf("%d",&day);
      } 
    while(day<1||day>months[month-1]);
  
    printf("The number of the day is %d.\n",nr_of_day(year,month,day));//display the number of days passed      
    printf("The number of days left is %d.\n",nr_of_days_left(year,month,day));//display the number of days left
    getch();
}
  
