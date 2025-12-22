#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>
#include <errno.h>

/*
	Sa se scrie un program care avand definit un vector de numere,creeaza 3 threaduri care:

	- primul thread calculeaza suma numerelor din vector de pe pozitii de forma 3*k (multiplu de 3), ex v[0],v[3],...

	- al doilea thread calculeaza suma numerelor din vector de pe pozitii de forma 3*k+1 (multiplu de 3 +1), ex v[1],v[4],...

	- al treilea thread calculeaza suma numerelor din vector de pe pozitii de forma 3*k+2 (multiplu de 3 +2)	

	*(cine a terminat prima parte) Threadurile sa adauge la sfarsit suma calculata la o suma globala. Programul pincipal afiseaza suma totala a vectorului.

*/

pthread_mutex_t m = PTHREAD_MUTEX_INITIALIZER;
int s = 0;
int v[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };

void *sum1(void *);
void *sum2(void *);
void *sum3(void *);

int main()
{
	void *value;
	int i;
	pthread_t t[3];

	/* if(pthread_create(&t[0],NULL,sum1,&v)<0)
	   {
	   perror("Eroare la suma 1!");
	   exit(1);
	   } */
	//pthread_join(t[0],&value);
	/* s=s+(long)value;
	   printf("Prima suma este:%lu \n",(long)value); */

	/* if(pthread_create(&t[1],NULL,sum2,&v)<0)
	   {
	   perror("Eroare la suma 2!");
	   exit(2);
	   } */
	//pthread_join(t[1],&value);
	//s=s+(long)value;
	//printf("A doua suma este:%lu \n",(long)value);

	/*if(pthread_create(&t[2],NULL,sum3,&v)<0)
	   {
	   perror("Eroare la suma 3!");
	   exit(3);
	   } */
	for (i = 1; i <= 3; i++) {
		if (i == 1) {
			if (pthread_create(&t[i], NULL, sum1, &v) < 0) {
				perror("Eroare la suma 2!");
				exit(2);
			}
		}
		if (i == 2) {
			if (pthread_create(&t[i], NULL, sum2, &v) < 0) {
				perror("Eroare la suma 2!");
				exit(2);
			}

		}
		if (i == 3) {
			if (pthread_create(&t[i], NULL, sum3, &v) < 0) {
				perror("Eroare la suma 2!");
				exit(2);
			}
		}
	}
	for (i = 1; i <= 3; i++) {
		pthread_join(t[i], &value);

	}

	printf("Suma totala este:%d \n", s);
	return 0;
}

void *sum1(void *p)
{
	int s1 = 0, i;
	int *c = (int *)p;
	for (i = 0; i < 9; i++) {

		if (i % 3 == 0)
			s1 = s1 + *(c + i);

	}

	printf(" suma este:%d \n", s1);
	pthread_mutex_lock(&m);
	s = s + s1;
	pthread_mutex_unlock(&m);
	return NULL;
}

void *sum2(void *p)
{
	int s2 = 0, i;
	int *c = (int *)p;
	for (i = 0; i < 9; i++) {

		if (i % 3 == 1)
			s2 = s2 + *(c + i);

	}
	printf(" suma este:%d \n", s2);
	pthread_mutex_lock(&m);
	s = s + s2;
	pthread_mutex_unlock(&m);
	return NULL;
}

void *sum3(void *p)
{
	int s3 = 0, i;
	int *c = (int *)p;
	for (i = 0; i < 9; i++) {

		if (i % 3 == 2)
			s3 = s3 + *(c + i);

	}
	printf(" suma este:%d \n", s3);
	pthread_mutex_lock(&m);
	s = s + s3;
	pthread_mutex_unlock(&m);
	return NULL;
}
