/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~ File Name:  P04.c                                                      ~
~                                                                        ~
~Purpose: Graph coloring problem.                                        ~
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
int G[MAXD][MAXD] , n , m ;
char C[MAXD];

int succesor( int stack[MAXD] , int k )
{
	if( stack[k] >=  m-1 | k >= n )
	return 0;
	stack[k]++;
	return 1;
}

int valid(int stack[MAXD] , int k )
{
	int i;
	for( i = 0 ; i < k ; i++)
		if( G[i][k] == 1 && stack[i] == stack[k] )
			return 0;
	return 1;
}

int solution( int k )
{
	 return k == n-1 ;
}

void back( void )
{
	/*uses the backtracking algorithm and selects best solution. */
	int stack[MAXD] , solNo = 1 , k = 0 , i , as , ev;
	for( i = 0 ; i < MAXD; i++)
		stack[i] = -1;
	out = fopen("out.dat" , "w");
	while( k > -1 )
	 {
		do
			{
				if( as = succesor( stack , k ))
					ev = valid( stack , k );
			}while(!( !as || ev ));
		if( as )
				if( solution( k ))
					{/*we have found a solution*/
						fprintf( out , "%d :\n" , solNo++);
						for( i = 0 ; i < n ; fprintf( out , "%d  %c\n" , i , C[stack[i++]]));
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
	int i , j , k = 0;
	for( i = 0 ; i < MAXD ; i++)
		for( j = 0 ; j < MAXD ; G[i][j++] = 0);
	in = fopen("in.dat" , "r");
	s = malloc(10);
	fgets( s , 10 , in );
	n =  atoi( s );
	m = 0;
	for( ; !feof( in ) ; )
		{
			s = malloc(MAXL);
			fgets( s , MAXL , in );
			i = atoi( s = strtok( s , separators)) - 1;
			if( i == -1 )
				k = 1;/* we have read a color*/
				else
					j = atoi(strtok( NULL , separators)) - 1;
			if( k == 0 )
			 {
				G[i][j] = 1;
				G[j][i] = 1;
			 }
			else
				C[m++] = s[0];
		 }
	fclose( in );
	back();
	return 1;
}