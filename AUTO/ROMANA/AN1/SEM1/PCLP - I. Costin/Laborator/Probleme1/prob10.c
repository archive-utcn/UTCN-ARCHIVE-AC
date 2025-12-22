/*Se citesc coordonatele vârfurilor unui triunghi în plan.Sa se scrie un program care stabileste
pozitia fata de triunghi a unui punct oarecare din plan dat prin coordonatele lui.*/
#include <stdio.h>
#include <conio.h>

int main()
{
    int x1,y1,x2,y2,x3,y3,x,y;
    int min_x,max_y,max_x,min_y;
    int ok;
    //*citim coordonatele punctelor care formeaza triunghiul
    printf("\n coordonatele triunghiului sunt:");
    printf("\n x1=");
    scanf("%5d",&x1);
    printf("\n y1=");
    scanf("%5d",&y1);
    printf("\n x2=");
    scanf("%5d",&x2);
    printf("\n y2=");
    scanf("%5d",&y2);
    printf("\n x3=");
    scanf("%5d",&x3);
    printf("\n y3=");
    scanf("%5d",&y3);
    printf("\n coordonatele punctului oarecare");
    printf("\n x=");
    scanf("%5d",&x);
    printf("\n y=");
    scanf("%5d",&y);
    //*aflam valoarea abscisei minime dintre cele 3 puncte ale triunghiului
    min_x=x1;
    if (min_x>x2)
       min_x=x2;
       else
           if (min_x>x3)
              min_x=x3;
     //*aflam valoarea abscisei maxime dintre cele 3 puncte ale triunghiului
     max_x=x1;
     if (max_x<x2)
       max_x=x2;
       else
           if (max_x<x3)
              max_x=x3;
     //*aflam valoarea ordonatei minime dintre cele 3 puncte ale triunghiului
     min_y=y1;
     if (min_y>y2)
       min_y=y2;
       else
           if (min_y>y3)
              min_y=y3;
     //*aflam valoarea ordonatei max dintre cele 3 puncte ale triunghiului
     max_y=y1;
    if (max_y<y2)
       max_y=y2;
       else
           if (max_y<y3)
              min_y=y3;

     ok=1; //*presupunem ca punctul e in interior
     if (x>max_x)
        {
        printf("\n punctul e in dreapta \n");
        ok=0;
        }
     if (x<min_x)
        {
        printf("\n punctul e in stanga \n");
        ok=0;
        }
     if (y>max_y)
        {
        printf("\n punctul e deasupra\n");
        ok=0;
        }
     if (y<min_y)
        {
        printf("\n punctul e sub \n");
        ok=0;
        }
     if (ok==1)
        printf("\n punctul e in interiorul triunghiului \n");
     return 0;
}
