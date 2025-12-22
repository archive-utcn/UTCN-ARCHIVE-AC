#include <stdio.h>
#include<conio.h>
#include<stdlib.h>
#include<math.h>
typedef struct
{float x,y;
}Punct;
Punct p[2];
void citire()
{ int i;
for(i=0;i<=2;i++)
{
    printf("Dati valoarea lui p[%d]:",i);
    scanf("%f %f",&p[i].x ,&p[i].y);
} return;
}
float calcul(float *arie,float *per)
{ float a,b,c;
a=sqrt(((p[0].x-p[1].x)*(p[0].x-p[1].x))+((p[0].y-p[1].y)*(p[0].y-p[1].y)));
b=sqrt(((p[1].x-p[2].x)*(p[1].x-p[2].x))+((p[1].y-p[2].y)*(p[1].y-p[2].y)));
c=sqrt(((p[2].x-p[0].x)*(p[2].x-p[0].x))+((p[2].y-p[0].y)*(p[2].y-p[0].y)));
printf("%f %f %f",a,b,c);
if ((a+b>c) || (a+c)>b || (b+c)>a)
{
    *per=a+b+c;
    *arie=(*per)*((*per)/2-a)*((*per)/2-b)*((*per)/2-c);

}else printf("punctele nu corespund conditiei");
return 0;
}
int afisare(float arie,float per)
{
    printf("aria este: %f si perimetrul este: %f",arie,per);
    return;
}
int main()
{
    float arie,per;
    int op=10;
    do
    {
        printf("\n1.Citire\n2.Calcul\n3.Afisare\n0.Iesire\n");
        scanf("%d",&op);
        switch(op)
        { case 0:return 0;
        case 1:citire();
        break;
        case 2:calcul(&arie,&per);
        break;
        case 3:afisare(arie,per); break;
        default:printf("\n Optiune inexistenta");}
        getch();
        } while(op!=0);

    return 0;
}
