/* Program 3.7 */

#include <stdio.h>
#include <stdlib.h>

/*Read year, month,day */
void nr_of_days(int y,int m,int d,int *dpast,int *dleft)
{
    int total_d;
    if( (y%100==0 && y%4==0) || (y%400==0))
        total_d=366;
    else
        total_d=365;

    if(m%2==0)
        *dpast=31*(m/2) + 30*(m/2-1)+d;
    else
        *dpast=30*(m/2)+31*(m/2)+d;

    if((m>2)&&(total_d==366)) *dpast-=1;
    if((m>2)&&(total_d==365)) *dpast-=2;

    *dleft=total_d-*dpast;
}
int main()
{
    int y,m,d,dpast,dleft;
    printf("year=");
    scanf("%d",&y);
    do
    {   printf("\nmonth=");
        scanf("%d",&m);
    }
    while ((m<1) && (m>12));
    do
    {    printf("\nday=");
         scanf("%d",&d);
    }
    while ((((d<1) || (d>31)) && (m % 2 != 0)) || (((d<1) || (d>30)) && (m % 2 == 0)));
    nr_of_days(y,m,d,&dpast,&dleft);
    printf("\ndays past=%d\n",dpast);
    printf("days left=%d",dleft);

    return 0;
}
