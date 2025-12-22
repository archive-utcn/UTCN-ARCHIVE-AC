#include <stdio.h>
#include <math.h>
#include <conio.h>

double main()
{
     double d,x0,x1,x2,y0,y1,y2,r,a,b;
     printf("\nx0: "); scanf("%lf",&x0);
     printf("\nx1: "); scanf("%lf",&x1);
     printf("\nx2: "); scanf("%lf",&x2);
     printf("\ny0: "); scanf("%lf",&y0);
     printf("\ny1: "); scanf("%lf",&y1);
     printf("\ny2: "); scanf("%lf",&y2);
     printf("\nr: "); scanf("%lf",&r);
     a=(y2-y1)*(y0-y1)+(x2-x1)*(x1-x0);
     b=sqrt((x1-x2)*(x1-x2)+(y2-y1)*(y2-y1));
     d=abs(a)/b;
     if(d<r)
     printf("\nDreapta intersecteaza cercul");
     if(d>r)
     printf("\nDreapta nu intersecteaza cercul");
     if(d==r)
     printf("\nDreapta tangenta cercului");
     printf("\na=%lf",a);
     printf("\nb=%lf",b);
     printf("\nd=%lf",d);
     getch();
     }
