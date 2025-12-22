#include <stdio.h>
#include <conio.h>
#include <iostream.h>

struct CAR
{
 char marca[20],prop[30],color[15], nr[10];    
};

CAR cars[100];
int dim=0;
char cul[15];

void scrie()
{
     FILE *f=fopen("cars.dat","w");
         for(int i=1;i<=dim;i++)
     {
             if(strcmp(cul,cars[i].color)==0) printf("%s\n%s\n%s\n%s\n",cars[i].prop,cars[i].marca,cars[i].color,cars[i].nr);        
     }
     for(int i=1;i<=dim;i++)
     {
             if(strcmp(cul,cars[i].color)==0) fprintf(f,"%s\n%s\n%s\n%s\n",cars[i].prop,cars[i].marca,cars[i].color,cars[i].nr);        
     }
     fclose(f);
}

int main(void)
{
    printf("Numarul de masini...");
    scanf("%i",&dim);
    for(int i=1;i<=dim;i++)
    {
            printf("marca masinii...");
            cin>>cars[dim].marca;
            printf("proprietarul masinii...");
            cin>>cars[dim].prop;
            printf("culoarea masinii...");
            cin>>cars[dim].color;
            printf("numarul masinii...");
            cin>>cars[dim].nr;
    }
    for(int i=1;i<dim;i++)
    for(int j=i+1;j<=dim;j++)
    if(strcmp(cars[i].prop,cars[j].prop)>0)
    {
         CAR aux=cars[i];
         cars[i]=cars[j];
         cars[j]=aux;                                       
    }
    printf("dati o culoare...");
    cin>>cul;
    
    scrie();
    getch();  
}
