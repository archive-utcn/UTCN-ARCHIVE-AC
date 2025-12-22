/*Sa se stabileasca pozitia unei drepte fata de un cerc dat. Se citesc: coordonatele centrului cercului,
raza acestuia, precum si coordonatele a doua puncte situate pe dreapta.*/
#include <stdio.h>
#include <conio.h>
#include <math.h>
#include <stdlib.h>

int main()
{
float xc,yc,r,x1,x2,y1,y2;
float a,b,c,d;
//*citim coordonatele centrului cercului
printf("\n abscisa(xc)=");
scanf("%5f",&xc);
printf("\n ordonata(yc)=");
scanf("%5f",&yc);
//*citim raza
printf("\n raza(r)=");
scanf("%5f",&r);
//*citim coordonatele dreptei
printf("\n abscisa primului punct(x1)=");
scanf("%5f",&x1);
printf("\n ordonata primului punct(y1)=");
scanf("%5f",&y1);
printf("\n abscisa celui de-al doilea punct(x2)=");
scanf("%5f",&x2);
printf("\n ordonata celui de-al doilea punct(y2)=");
scanf("%5f",&y2);
a=y2-y1;
b=x1-x2;
c=((y1-y2)*x1+(x2-x1)*y1);
d=abs((a*xc+b*yc+c)/(sqrt(a*a+b*b)));//*formula distantei dintre 2 puncte
if (r>d)//*comparam raza cu distanta
   printf("\n linia intersecteaza cercul in 2 puncte \n");
   else
       if (r<d)
          printf("\n linia nu intersescteaza cercul \n");
          else
              printf("\n linia e tangenta la cerc (intersescteaza cercul intr-un punct) \n");
return 0;
}
