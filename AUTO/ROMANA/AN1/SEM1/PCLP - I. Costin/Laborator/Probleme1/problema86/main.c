 #include <stdio.h>
 #include <string.h>
/*
86. Doua firme îsi pastreaza informatiile referitoare la stocul de marfuri (cod produs, denumire,
cantitate, pret unitar) în fisierele "marfa1.dat" si respectiv "marfa2.dat", ordonate crescator dupa
cod. Prin fuzionarea celor doua firme, rezulta un stoc comun care trebuie memorat în fisierul
"marfa.dat", ordonat dupa cod.
Sa se creeze fisierele initiale, pe baza datelor introduse de la tastatura si apoi sa se creeze fisierul de
stoc comun "marfa.dat" Pentru marfuri cu cod comun, se considera ca denumirea si pretul unitar
corespund.
Fisierul "marfa.dat" se va parcurge secvential, tiparind pentru fiecare componenta denumirea si
cantitatea.
Pentru o componenta dorita data prin numarul de ordine, se va modifica direct pretul sau unitar.
*/

typedef struct{
        int cod;
        float pret,cant;
        char nume[20];

} produs;

int main()
{

    FILE * m1;
    FILE * m2;
    FILE * m;
    produs a[100],b;
    if((m1=fopen("marfa1.txt","r"))==NULL)
        printf("fisierul nu exista\n");
    if((m2=fopen("marfa2.txt","r"))==NULL)
        printf("fisierul nu exista\n");
    if((m=fopen("marfa.txt","w"))==NULL)
        printf("fisierul nu existagjg\n");
    int i=1,j;
    while(!feof(m1))
    {
        fscanf(m1,"%s%d%f%f",&a[i].nume,&a[i].cod,&a[i].pret,&a[i].cant);
       // printf("%3.2f\n",a[i].pret);
       i++;
    }
    int ok=1;
     while(!feof(m2))
    {   ok=1;
       fscanf(m2,"%s%d%f%f",&b.nume,&b.cod,&b.pret,&b.cant);
       for(j=1;j<i;j++)
       if(a[j].cod==b.cod)
       {
           a[j].cant+=b.cant;
           ok=0;
       }
       if(ok)
       {
            strcpy(a[i].nume,b.nume);
            a[i].cod=b.cod;
            a[i].pret=b.pret;
            a[i].cant=b.cant;
            i++;
       }

    }
  //  printf("%d",i);
    do
    {   ok=0;
        for(j=1;j<i-1;j++)
            if(a[j].cod>a[j+1].cod)
                {   b=a[j];
                    a[j]=a[j+1];
                    a[j+1]=b;
                    ok=1;
                }

    }while(ok);


    printf("Pentru a schimba pretul unui produs apasati D/d \n");
    char ch=getch();
    int cd;
    float p;

    while(ch=='d' || ch=='D')
    {
            printf("Introduceti codul produsului: ");
            scanf("%d",&cd);
            printf("Introduceti pretul nou: ");
            scanf("%f",&p);

    for(j=1;j<i;j++)
          if(cd==a[j].cod)  a[j].pret=p;
    printf("Pentru a schimba pretul unui produs apasati D/d \n");
        ch=getch();
    }

    for(j=1;j<i;j++)
    {
        fprintf(m,"%-7s  %d  %.3f  %.3f\n",a[j].nume,a[j].cod,a[j].pret,a[j].cant);
    }
    return 0;
}
