
#include <stdio.h>
#include <stdlib.h>
#include <process.h>
#include <math.h>


typedef struct
{
    float raza;
} cerc;

typedef struct
{
    float l1,l2;
} drept;

typedef struct{
   float l;
}patrat;

typedef struct
{
    float l1,l2,l3;
}tri;


typedef union {
                  cerc c;
                  drept d;
                  patrat p;
                  tri t;
                } figura;


FILE *f;

void main()
{
    int i;
    figura fi;
    float s,sp;
 /*   f=fopen("pb3.txt","r");
    if (f==NULL)
    {
        perror("Eroare la deschidere");
        exit(1);
    };  */
    printf("introduceti tipul figurii: 1.C 2.D 3.P 4.T ");
    scanf("%d",&i);
    switch(i)
     {
         case 1: printf("introduceti raza ");
                scanf("%f",&(fi.c.raza));
                s=3.14159*fi.c.raza*fi.c.raza;
                printf("aria cercului: %f",s);
                break;
         case 2: printf("introduceti laturile ");
                 scanf("%f %f",&(fi.d.l1),&(fi.d.l2));
                 s=fi.d.l1*fi.d.l2;

                 printf("aria dreptunghiului: %7.2f",s);
                 break;
         case 3: printf("introduceti latura ");
                 scanf("%f",&(fi.p.l));
                 s=fi.p.l*fi.p.l;
                 printf("aria patratului: %7.2f",s);
                 break;
         case 4: printf("introduceti laturile ");
                 scanf("%f %f %f",&(fi.t.l1),&(fi.t.l2),&(fi.t.l3));
                 sp=fi.t.l1+fi.t.l2+fi.t.l3;
                 sp=sp/2;
                 s=sp*(sp-fi.t.l1)*(sp-fi.t.l2)*(sp-fi.t.l3);
                 s=sqrt(s);
                 printf("aria triunghiului: %f",s);
                 break;



     }




}





