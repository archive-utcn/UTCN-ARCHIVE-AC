#include<time.h>
#include<stdio.h>
#include <conio.h>
#include <stdlib.h>

int main(void)
{
 time_t timer;//*we declare timer, a variable of time 
 while (1)
 {
  system("cls");//*the system calculates the local time
  timer=time(NULL);
  printf("%s.\n",asctime(localtime(&timer)));//*we display the time
}
getch();
}

