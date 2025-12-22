#include <stdio.h>
#include <stdlib.h>
/*
92. Sa se creeze un fisier care sa contina produsele unui magazin. Un produs este reprezentat printr-o
structura ce contine codul produsului, denumirea, unitatea de masura, cantitatea, pretul unitar.
Plecând de la acest fisier, sa se obtina un fisier sortat dupa cod.
*/
typedef struct{
        int cod;
        float pret,cant;
        char nume[20],masura[20];

} produs;
int main()
{
   FILE *in;
    if((in=fopen("marfa.txt","r+"))==NULL)
        printf("fisierul nu exista\n");

        printf("Daca doriti sa introduceti produs apasati D \ d\n");
        char ch=getch();
        produs b;
        fseek(in,0L,SEEK_END);
        while(ch=='D' || ch=='d')
        {
            printf("Introduceti numele: ");
            scanf("%s",&b.nume);
            printf("Introduceti cod: ");
            scanf("%d",&b.cod);
            printf("\nIntroduceti pret: ");
            scanf("%f",&b.pret);
            printf("\nIntroduceti cantitate : ");
            scanf("%f",&b.cant);
            printf("\nIntroduceti unitate de masura : ");
            scanf("%s",&b.masura);
            fprintf(in,"%d %s %f %f %s\n",b.cod,b.nume,b.pret,b.cant,b.masura);
            printf("Daca doriti sa introduceti produs apasati D \ d\n");
            ch=getch();
        }
        fseek(in,0L,SEEK_SET);
        int ok,i,n;
        produs a[50],aux;
        i=1;
        while(!feof(in))
        {
            fscanf(in,"%s %d %f %f %s",&a[i].nume,&a[i].cod,&a[i].pret,&a[i].cant,&a[i].masura);
            i++;
        }
        n=i-1;
        do{
            ok=0;
            for(i=1;i<n;i++)
                if(a[i].cod>a[i+1].cod)
                {
                    aux=a[i];
                    a[i]=a[i+1];
                    a[i+1]=aux;
                    ok=1;
                }

        }while(ok);
        fseek(in,0L,SEEK_SET);
        for(i=1;i<n;i++)
        fprintf(in,"%s %d %.2f   %.2f %s\n",a[i].nume,a[i].cod,a[i].pret,a[i].cant,a[i].masura);
    return 0;
}
