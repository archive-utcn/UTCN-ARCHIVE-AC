#include <stdio.h>
#include <string.h>
#include <stdlib.h>
typedef struct student
{
    char nume[20];
    struct dn
        { int zi, luna, an;}dn;
        char adresa[30];
}student;
void citire(student )
{
        while((fgets(s[i].nume,20,f))!=NULL)
        {
            s[i].nume[strlen(s[i].nume)]='\0';
            fscanf(f,"%d.%d.%d\n",&(s[i].dn.zi),&(s[i].dn.luna),&(s[i].dn.an));
            fgets(s[i].adresa,30,f);
            s[i].adresa[strlen(s[i].adresa)]='\0';
            fwrite(&s[i],sizeof(s[i]),1,g);

           // puts(s[i].nume);
            //printf("%d.%d.%d\n",s[i].dn.zi,s[i].dn.luna,s[i].dn.an);
            //printf("%s\n",s[i].adresa);
            i++;
        }
}
/*void cautare(student *s)
{
    int i,ok=0;
    char x[20];
    printf("Introduceti numele studentului cautat");
    gets(x);
    while(i<=30)
    {
        if(strcmp(x,s[i].nume)==0)
            {
                ok=1;
                puts(x);
                printf("%d.%d.%d\n",s[i].zi,s[i].luna,s[i].an);
                puts(s[i].adresa);
            }
            i++;
    }
    if(ok==0)
        printf("Studentul cautat nu a fost gasit");
}*/
int main()
{
    FILE *f,*g,*k;
    int i=0,opt;
    char sursa[10],destinatie[10],x[256];
    student s[30];
    while(opt!=0)
        {
            printf("1-Citirea conţinutului unui fişier text în structuri de tipul student care se vor scrie într-un fişier binar");
            printf("2-Citirea şi afişarea pe ecran a conţinutului unui fişier binar care conţine structuri de tip student");
            printf("3-Copierea unui fişier binar sursă într-un fişier binar destinaţie");
            printf("4-Căutarea unui student cu numele citit de la tastatura în fişierul binar");
            printf("5-Afişarea conţinutului unui fişier binar în ordine inversă");
            printf("6-sortarea dupa data nasterii a studentilor din fişierul binar");
            printf("0-Exit");
            printf("Introduceti optiunea dorita:");
            scanf("%d",&opt);
            switch(opt)
            {
                case '1': citire();
                case '2': citire_afisare();
                case '3': copiere();
                case '4': cautare();
                case '5': afisare_inversa();
                case '6': sortare();
            }
    printf("Introduceti numele fisierului sursa:");
    gets(sursa);
    printf("Introduceti numele fisierului destinatie:");
    gets(destinatie);
    k=fopen(destinatie,"wb");
    f=fopen(sursa,"rb");
    g=fopen("iesire.txt","wb");
    if(f==NULL)
    {
        perror("Eroare");
        exit(1);
    }
     if(g==NULL)
    {
        perror("Eroare");
        exit(1);
    }
         if(k==NULL)
    {
        perror("Eroare");
        exit(1);
    }

    while(fgets(x,256,f)!=NULL)
    {
        puts(x);
        fwrite(&x,sizeof(x),1,k);
    }

        fclose(f);
        fclose(g);
}
