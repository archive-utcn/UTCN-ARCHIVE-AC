 #include <stdio.h>
 #include <conio.h>
 #include <io.h>
 #include <fcntl.h>
 #include <sys\stat.h>
 #include <process.h>
 #include <stdlib.h>
/*94.Se va scrie un program pentru admiterea la facultate în anul I. Programul va cuprinde crearea
fisierului cu candidatii înscrisi. În final trebuie sa se obtina fisierele cu candidatii admisi pe sectii
si cei respinsi pe baza mediei obtinute ((bacalaureat + 4 * test_matem) / 5.0).*/
typedef struct{
			 char nume[32];
			 float bac,mate,medie;
			 } elevi;
typedef union {
			 elevi a;
			 char st[sizeof(elevi)];
		} BUF;
 typedef struct {
			int nr;
			float med;
		 } ELEMENT;
int n,df1,m;

void sortare(char nume_fis[],char nume_fis_sortat[])
  {
		 ELEMENT el,t[100];
		 int k,j,n,i,df1,df2;
		 BUF e;
		 j=0;
		 df1=open(nume_fis,O_RDONLY);
		 while (read(df1,e.st,sizeof(elevi))>0)
			 {
			  t[j].nr=j;
			  t[j].med=e.a.medie;
			  j=j+1;
			 };
		 /* Sortarea tabloului t după medie */
			n=j-1;/* Elementele tabloului t sunt 0,1,2,...,n */
			j=0;
            do
				{
				  k=1;j=j+1; /*k=TRUE*/
				  for(i=0;i< n;i++)
					 if (t[i].med < t[i+1].med)
					 {
						el=t[i];t[i]=t[i+1];t[i+1]=el;
						 k=0;/*k=FALSE */
					  };
				 }
			  while(k==0);
		  close(df1);
		 /*Crearea fişierului sortat */
		 df2=creat(nume_fis_sortat,S_IWRITE|S_IREAD);
		 df1=open(nume_fis,O_RDONLY);
		 for(i=0;i<=n;i++)
			{
			  lseek(df1,(long)(t[i].nr * sizeof(elevi)),0);
			  read(df1,e.st,sizeof(elevi));
			  write(df2,e.st,sizeof(elevi));

			 };
		  close(df1);
		  close(df2);
}
 void afisare( char nume_fis[])
 {
	BUF e;
	int j,df1;
	j=1;
	df1=open(nume_fis,O_RDONLY);

	while (read(df1,e.st,sizeof(elevi))>0)
	  {
                  printf("\n%d  %-32s %7.2f", j, e.a.nume,
                                  e.a.medie);
	      j=j+1;
	  };
	close(df1);
 }

 void afisare2( char nume_fis[])
 {
	BUF e;
	int j,df1;
	j=1;
	df1=open(nume_fis,O_RDONLY);

	while (read(df1,e.st,sizeof(elevi))>0)
	  {
              if(j<=m)    printf("\n%d  %-32s %7.2f  ADMIS", j, e.a.nume,
                                  e.a.medie);
                else printf("\n%d  %-32s %7.2f  RESPINS", j, e.a.nume,
                                  e.a.medie);
	      j=j+1;
	  };
	close(df1);
 }


int main()
{
    printf("Introduceti numarul de elevi n=");
    scanf("%d",&n);
    printf("Introduceti numarul de locuri disponibile m=");
    scanf("%d",&m);
    BUF e;
    // SCHIMBATI calea fisierelor in functie de calculator
    char nume_fis[50]="d:\\pc\\problema94\\elevi.txt";
    char nume_fis_sortat[50]="d:\\pc\\problema94\\elevisort.txt";
    if ((df1=creat(nume_fis,S_IWRITE|S_IREAD))==-1)
	{
	  printf("Nu se poate crea fişierul\n");
	  exit(1);
	}
	int i;
  // Introduceti elvii ,media la bac si nota de la examenul de mate
	for(i=1;i<=n;i++)
    {

		printf("\nNumele studentului: ");
		scanf("%*c");
		gets(e.a.nume);
		printf("\Bac=");
		scanf("%f",&e.a.bac);
        printf("\Mate=");
		scanf("%f",&e.a.mate);
		e.a.medie=(e.a.bac+4*e.a.mate)/5.0;
		write(df1,e.st,sizeof(elevi));

    }
    close(df1);
    sortare(nume_fis,nume_fis_sortat);
    printf("FISIER NESORTAT\n");
    afisare(nume_fis);
    printf("\nFISIER SORTAT\n");
    afisare2(nume_fis_sortat);

    return 0;
}
