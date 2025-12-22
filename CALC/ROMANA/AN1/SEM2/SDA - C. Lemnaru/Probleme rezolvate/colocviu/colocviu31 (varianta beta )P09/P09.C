/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~ File Name:  P09.c                                                      ~
~                                                                        ~
~Purpose: A set of integer numbers is given. Generate all the subsets of ~ 
~          this set which sum up to S.                                   ~
~                                                                        ~
~                                                                        ~
~Student name: 6519                                                      ~
~E-mail:       caveman0000@yhoo.com                                      ~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/  
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAXD 20
#define MAXL 20
#define separators " ,\n\t"

FILE *in , *out;
int V[MAXD] , n , S;

int succesor( int stack[MAXD] , int k )
{
	if( stack[k] > 0 | k >= n )
	return 0;
	stack[k]++;
	return 1;
}


int solution( int stack[MAXD] , int k )
{
	int i , sum = 0;
	if( k != n-1 )
		return 0;
	for( i = 0 ; i < n ; sum += V[i] * stack[i++]);
	if ( sum == S )
		return 1;
	return 0;
}

void back( void )
{
	int stack[MAXD] , k = 0 , i , as;
	for( i = 0 ; i < MAXD; i++)
		stack[i] = -1;
	out = fopen("out.dat" , "w");
	while( k > -1 )
	 {
		as = succesor( stack , k );
		if( as )
				if( solution( stack ,  k ))
					{/*we have found a solution*/
						for( i = 0 ; i < n ; i++)
							if( stack[i] == 1 )
								fprintf( out , "%d " , V[i]);
						fprintf( out , "\n" );
					}
					 else
						 k++;
			else
				stack[k--] = -1;
	 }
	fclose( out );
}

int main()
{
	char *s;
	n = 0;
	in = fopen( "in.dat" , "r");
	s = malloc(MAXL);
	fgets( s , MAXL , in );
	for( s = strtok( s , separators ) ; s != NULL ; s = strtok( NULL , separators))
		V[n++] = atoi( s );
	s = malloc(8);
	fgets( s , 8 , in );
	S = atoi( s );
	fclose( in );
	back();
	return 1;
}