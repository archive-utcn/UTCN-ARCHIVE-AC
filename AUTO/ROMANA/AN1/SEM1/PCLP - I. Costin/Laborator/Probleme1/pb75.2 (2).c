/*Cunoscând data de nastere a Dvs. si stiind ca în anul curent va aniversati ziua de nastere în ziua
de x [luni, marti, ..., duminica], scrieti un program pentru a afisa ziua (din saptamâna) în care vati
nascut. */
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

struct date { int zi;int luna ;int an; };
struct date data_curenta;
enum ziua {luni=1,marti,miercuri,joi,vineri,sambata,duminica};
enum ziua zi_sapt;
int main()
{


printf("introduceti ziua:");
scanf("%d",&data_curenta.zi);
printf("introduceti luna:");
scanf("%d",&data_curenta.luna);
printf("introduceti anul:");
scanf("%d",&data_curenta.an);

printf("\n data citita este:");
printf("%d.%d.%d\n",data_curenta.zi,data_curenta.luna,data_curenta.an);

printf("introduceti ziua din saptamana:");
scanf("%d",&zi_sapt);
int n,r;
printf("introduceti anul curent:");
scanf("%d",&n);
r=((n-data_curenta.an)*365)%7;
if (r<zi_sapt)
printf("ziua din saptamana in care s-a nascut persoana este:%d",zi_sapt-r);
else printf("ziua din saptamana in care s-a nascut persoana este:%d",zi_sapt+r);




getch();
return 0;
}
