
#include <stdio.h>
#include <stdlib.h>
#include <process.h>

typedef struct{
                 int ora;
                 int min;
                 int sec;
                } time;

void citire(time *t1, time *t2)
{
    printf("introduceti timpul 1 (ora,minut,secunda)");
    scanf("%d %d %d",&(t1->ora),&(t1->min),&(t1->sec));
    printf("introduceti timpul 2 (ora,minut,secunda)");
    scanf("%d %d %d",&(t2->ora),&(t2->min),&(t2->sec));
}

void scriere(time t1, time t2)
{
    printf("%d ore, %d minute, %d secunde\n\n",t1.ora,t1.min,t1.sec);
    printf("%d ore, %d minute, %d secunde\n\n",t2.ora,t2.min,t2.sec);

}

void comparare(time t1, time t2)
{
    if (t1.ora>t2.ora) printf("t1>t2");
       else
             if (t1.ora<t2.ora) printf("t1<t2");
                                else if (t1.min>t2.min) printf("t1>t2");
                                         else
                                               if (t1.min<t2.min) printf("t1<t2");
                                                                  else
                                                                         if (t1.sec>t2.sec) printf("t1>t2");
                                                                                             else
                                                                                                   if (t1.sec<t2.sec) printf("t1<t2");
                                                                                                                      else printf("t1=t2");



}

void main()
{
    time t1,t2;
    citire(&t1,&t2);
    scriere(t1,t2);
    comparare(t1,t2);
}
