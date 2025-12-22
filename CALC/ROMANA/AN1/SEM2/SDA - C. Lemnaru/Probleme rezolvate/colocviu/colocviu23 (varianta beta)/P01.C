/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~ File Name:  P01.c                                                      ~
~                                                                        ~
~Purpose: Consider m vectors Vi of length ni respectively.These vectors  ~
~          are then merged , obtaining another vector of length = sum ni.~
~          It is known that merging two vectors requires a time interval ~
~          proportional to their length. Determine the optimal order for ~
~          merging the all the vectors.                                  ~
~                                                                        ~
~                                                                        ~
~Student name: 6519                                                      ~
~E-mail:       caveman0000@yhoo.com                                      ~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/  
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAXD  20
#define MAXL 100
#define separators " ,\n\t"

FILE *in , *out;

void selectSol( int A[MAXD] , int n , int *x )
{
	/*
	*/
	int min = A[0] , j;
	*x = 0;
	for( j = 1 ; j < n ; j++)
		if( A[j] < min )
			{
				min = A[j];
				*x = j;
			}
	A[*x] = MAXD;
}

void greedy( int A[MAXD] , int n , int B[MAXD] , int *k )
{
	/*
		A - set of candidate elements , of length n;
		B - set of elements in the solution , of length k;
	*/
	int x , i;
	*k = 0; /* empty solution set*/
	for( i = 0 ; i < n ; i++ )
		{
			selectSol( A , n , &x );
			/*
				 select from the set A the proper element & remove it from A;
			*/
			B[ ( *k )++] = x;
		}
}

void printV( int B[MAXD] , int k )
{
	int i;
	out = fopen( "out.dat" , "w");
	for( i = 0 ; i < k ; i++ )
		fprintf( out , "%d " , B[i] );
	fprintf( out , "\n");
	fclose( out );
}

int main()
{
	char *s;
	int n , i , k , V[MAXD] , A[MAXD][MAXD] , B[MAXD];
	in = fopen( "in.dat" , "r");
	n = 0;
	for( ; ! feof( in ); )
		{
			s = malloc( MAXL );
			fgets( s , MAXL , in );
			s = strtok( s , separators);
			for( i = 0 ; s != NULL ; i++)
			 {
				A[n][i] = atoi( s );
				s = strtok( NULL , separators );
			 }
			V[n++] = i;
		}
	fclose( in );
	greedy( V , n , B , &k );
	printV( B , k );
	return 1;
}
