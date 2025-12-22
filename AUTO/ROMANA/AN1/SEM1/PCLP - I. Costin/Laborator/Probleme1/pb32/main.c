//Se citeste de la tastatura o data calendaristica an, luna, zi. Sa se scrie un program care calculeaza
//numarul de zile care au mai ramas pâna la sfârsitul anului respectiv.
#include <stdio.h>
#include <stdlib.h>
#include <process.h>

struct data
{
    int zi,an;
    int luna;
}d;


int bis( int an){
if(( an % 4 == 0 && an % 100 != 0 ) || an % 400 == 0 ) return 1;
return 0;
}

int main()
{int zile=0,i,rest=0;
   printf("dati ziua:");
    scanf("%d", &d.zi);
   printf("dati luna:");
    scanf("%d",&d.luna);
   printf("dati an:");
    scanf("%d", &d.an);
   static int tabzin[]={31,28,31,30,31,30,31,31,30,31,30,31}; //zilele lunilor in an normal
   static int tabzib[]={31,29,31,30,31,30,31,31,30,31,30,31}; //zilele lunilor in an bisect
    if(bis(d.an))
     rest=tabzib[d.luna-1]-d.zi;
      else rest=tabzin[d.luna-1]-d.zi;
    for(i=d.luna;i<=11;i++)
      {if(bis(d.an))
       zile=zile+tabzib[i];
        else zile=zile+tabzin[i];
        printf("%d ", zile+rest);
      }
    return 0;
}
