#include <stdio.h>
#include <conio.h>
#include <iostream.h>

int main(void)
{
    int cod,nrbuc,pret;
    char name[30],um[5];
    
    printf("Dati numarul de articole:");
    int n=0;
    scanf("%i",&n);
    
    FILE *f=fopen("shop.dat","w");
    fprintf(f,"%i\n",n);
    for(int i=1;i<=n;i++)
    {    
         printf("codul produsului...");
         scanf("%i",&cod);
         printf("numele produsului...");
         cin>>name;
         printf("unitatea de masura a produsului...");
         cin>>um;
         printf("nr de bucati ale produsului...");
         scanf("%i",&nrbuc);
         printf("pretul  produsului...");
         scanf("%i",&pret);
         fprintf(f,"%i\n%s\n%s\n%i\n%i\n",cod,name,um,nrbuc,pret);
    }
    fclose(f);
    getch();
    return 0;    
}
