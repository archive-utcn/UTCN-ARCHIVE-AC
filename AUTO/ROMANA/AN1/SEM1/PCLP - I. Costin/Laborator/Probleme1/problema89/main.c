 #include <stdio.h>
 #include <conio.h>
 #include <io.h>
 #include <fcntl.h>
 #include <sys\stat.h>
 #include <process.h>
 #include <stdlib.h>
/*
89. Sa se scrie un program pentru a realiza urmatoarele actiuni:
a) creeaza un fisier care contine date despre autoturismele dintr-un garaj. Un autoturism este
reprezentat printr-o structura ce contine marca, numele proprietarului, culoarea si numarul de
înmatriculare.
b) afiseaza pe ecran o lista alfabetica dupa numele proprietarului a tuturor autoturismelor având o
culoare precizata.
*/
 typedef struct{
			 char nume[20],marca[20],culoare[20],nrmat[20];
			} masina;
masina a[50];
void sort(char cul[20],FILE * in)
{
    int i=1;
    fseek(in,0L,SEEK_SET);
    while(!feof(in))
    {
        fscanf(in,"%s%s%s%s",&a[i].nume,&a[i].marca,&a[i].culoare,&a[i].nrmat);
       // printf("%3.2f\n",a[i].pret);
       if(strcmp(a[i].culoare,cul)==0) i++;
    }
    //printf("%d",i);
    masina aux;
    int ok=0,j;
    do{
        ok=0;
        for(j=1;j<i-1;j++)
            if(strcmp(a[j].nume,a[j+1].nume)>0)
            {
                aux=a[j];
                a[j]=a[j+1];
                a[j+1]=aux;
                ok=1;
            }

    }while(ok);
    for(j=1;j<i;j++)
        printf("%-10s %-10s %-10s %s\n",a[j].nume,a[j].marca,a[j].nrmat,a[j].culoare);
}
int main()
{
    FILE * in;

    char cul[20],ch;
    if((in=fopen("garaj.txt","r+"))==NULL)
        printf("fisierul nu exista\n");

        printf("Daca doriti sa introduceti masini apasati D \ d\n");
        ch=getch();
        masina b;
        fseek(in,0L,SEEK_END);
        while(ch=='D' || ch=='d')
        {
            printf("Introduceti numele: ");
            scanf("%s",&b.nume);
            printf("\nIntroduceti marca: ");
            scanf("%s",&b.marca);
            printf("\nIntroduceti culoare : ");
            scanf("%s",&b.culoare);
            printf("\nIntroduceti nrmatricol : ");
            scanf("%s",&b.nrmat);
            fprintf(in,"\n%s %s %s %s",b.nume,b.marca,b.culoare,b.nrmat);

        printf("Daca doriti sa introduceti masini apasati D \ d\n");
            ch=getch();
        }
    printf("\n Introduceti culoarea dupa care vreti sa vedeti masinile sortate:");
    scanf("%s",&cul);
    sort(cul,in);
    return 0;
}
