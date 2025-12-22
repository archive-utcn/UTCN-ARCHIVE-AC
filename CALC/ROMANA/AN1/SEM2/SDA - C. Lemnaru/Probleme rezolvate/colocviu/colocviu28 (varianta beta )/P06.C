/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~ File Name:  P06.c                                                      ~
~                                                                        ~
~Purpose: Find the smallest sum of n different numbers taken from the    ~
~          elements of the matrix A of different columns and lines.      ~
~                                                                        ~
~                                                                        ~
~Student name: 6519                                                      ~
~E-mail:       caveman0000@yhoo.com                                      ~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/  

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAXD 5
#define MAXL 20
#define INFTY 32000
#define separators " ,\n\t"

FILE *in , *out;
int A[MAXD][MAXD] , n;

int succesor( int stack[MAXD] , int k )
{
 if( stack[k] >= n-1 | k >= n )
	return 0;
 stack[k]++;
 return 1;
}

int valid( int stack[MAXD] , int k , int sum )
{
	int i , s = 0;
	for( i = 0 ; i < k ; s += A[i][stack[i]] , i++ )
		if( stack[k] == stack[i] )
			return 0;
	return s + stack[k] < sum;
}

int solution( int stack[MAXD] , int k , int sol[MAXD] , int *sum)
{
	int i , s = 0;
	if( k != n-1 )
		return 0;
	for( i = 0 ; i < n ; s+=A[i][stack[i]] , i++);
	if( s < *sum )
		{
			for( i = 0 ; i < n ; i++)
			 sol[i] = stack[i];
			 *sum = s;
		}
	return 1;
}

void back( void )
{
	int stack[MAXD] , sol[MAXD] , sum = INFTY , k = 0 , i , as , ev;
	for( i = 0 ; i < MAXD ; i++)
		stack[i] = -1;
	while( k > -1 )
	 {
		do
			{
				if( as = succesor( stack , k ))
					ev = valid( stack , k , sum );
			}while(!( !as || ev ));
		if( as )
			{
				if( !solution( stack , k , sol , &sum ))
					k++;
			}
			else
				stack[k--] = -1;
	 }
	out = fopen("out.dat" , "w");
	if( sum < INFTY )
		 fprintf( out , "%d\n" , sum );
	fclose( out );
}

int main()
{
	char *s;
	int i , j = 0;
	in = fopen("in.dat" , "r");
	s = malloc( 10 );
	fgets( s , 10 , in );
	n =  atoi( s );
	for( i = 0 ; !feof( in ) & i < n; i++)
		{
			s = malloc(MAXL);
			fgets( s , MAXL , in );
			j = 0;
			for( s = strtok( s , separators); s != NULL & j < n ; s = strtok( NULL , separators))
			 A[i][j++] = atoi( s );
		 }
	fclose( in );
	back();
	return 1;
}