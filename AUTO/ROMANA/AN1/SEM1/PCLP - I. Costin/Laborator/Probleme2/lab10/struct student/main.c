/*Sa se scrie un program care citeste datele legate de studentii unei grupe:
 nume, data nasterii, adresa si îi afiseaza în ordine crescatoare lexicografica.*/
#include<stdlib.h>

struct student
{
	char nume[20], data_n[11],adresa[20];
};

struct student st1[50],aux[50];

int main ()
{
	int n,i,j;

	printf("numarul de studenti care v-a fi citit : ");
	scanf("%d",&n);
	for( i=0; i<n; i++ )
	{
		printf("\nnumele studentului %d: ",i+1);
		scanf("%s",st1[i].nume);
		printf("data nasterii studentului %d (DD/MM/YYYY): ",i+1 );
		scanf("%s",st1[i].data_n);
		printf("adresa stundetului %d: ",i+1);
		scanf("%s",st1[i].adresa);
	}
	for( i=0; i<n-1; i++ )
		for( j=i+1; j<n; j++ )
			if( strcmp(st1[i].nume,st1[j].nume) > 0 )
			{
				aux[i]=st1[i];
				st1[i]=st1[j];
				st1[j]=aux[i];
			}

	printf("\n\nstudentii :\n");
	for( i=0; i<n; i++ )
		printf("%s,%s,%s \n ",st1[i].nume,st1[i].data_n,st1[i].adresa);
	return 0;
}
