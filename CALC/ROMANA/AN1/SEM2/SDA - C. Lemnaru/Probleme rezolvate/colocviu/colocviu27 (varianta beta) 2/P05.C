/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~ File Name:  P05.c                                                      ~
~                                                                        ~
~Purpose: Hamiltonian cycle of minimum cost.                             ~
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
#define INFTY 32000
#define separators " ,\n\t"

FILE *in , *out;
int G[MAXD][MAXD] , n ;


int succesor( int stack[MAXD] , int k )
{
	if( stack[k] == n-1 && k == n-1 )
		return 0;
	stack[k]++;
	return 1;
}

int valid(int stack[MAXD] , int k )
{
	int i;
	for( i = 0 ; i < k ; i++)
		if( G[stack[i]][stack[k]] == INFTY )
			return 0;
	return 1;
}

int solution( int stack[MAXD] , int k , int sol[MAXD] , int *cost , int *m)
{
	int i , s = 0 ;
	if( k != 0 && stack[k] == stack[0] )
		{/* we have found a hamiltonian cycle */
			for( i = 0 ; i < k ; i++)
				s +=  G[stack[i]][stack[i+1]];
			if( s < *cost )
			 {
				for( i = 0 ; i < k ; i++ )
					sol[i] = stack[i];
				*cost = s;
				*m = k;
			 }
			return 1;
		}
	return 0;
}

void back( void )
{
	/*uses the backtracking algorithm and selects best solution. */
	int stack[MAXD] , k = 0 , i , as , ev , sol[MAXD] , cost = INFTY , m = 0;
	for( i = 0 ; i < MAXD; i++)
		stack[i] = -1;
	while( k > -1 )
	 {
		do
			{
				if( as = succesor( stack , k ))
					ev = valid( stack , k );
			}while(!( !as || ev ));
		if( as )
			{
				if( !solution( stack , k , sol , &cost , &m ))
					 k++;
			}
			else
				stack[k--] = -1;
	 }
	out = fopen("out.dat" , "w");
	if( cost != INFTY )
	 for( i = 0 ; i < m ; i++ )
		 fprintf( out , "%d " , sol[i]);
	 else
		 fprintf( out , " no solution found.");
	fprintf( out , "\n" );
	fclose( out );
}

int main()
{
	char *s;
	int i = 0 , j ;
	for( i = 0 ; i < MAXD ; i++)
		for( j = 0 ; j < MAXD ; G[i][j++] = 0);
	in = fopen("in.dat" , "r");
	s = malloc(10);
	fgets( s , 10 , in );
	n =  atoi( s );
	for( ; !feof( in ) && i < n ; )
		{
			s = malloc( MAXL );
			fgets( s , MAXL , in );
			j = 0;
			for( s = strtok( s , separators ) ; s != NULL && j < n; s = strtok( NULL , separators))
			 if( strcmp( s , "1e5" ) == 0 )
				 G[i][j++] = INFTY;
				else
					G[i][j++] = atoi( s );
			i++;
		 }
	fclose( in );
	back();
	return 1;
}