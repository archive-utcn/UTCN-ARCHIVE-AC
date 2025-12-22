/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~ File Name:  P07.c                                                        ~
~                                                                          ~
~Purpose: Knight's tour.An nxn chessboard and a knight placed on the upper ~
~          left square, numbered as (1,1). List all the possible moves of  ~
~          the knight such a way that it visits all squares exactely once. ~
~                                                                          ~
~                                                                          ~
~Student name: 6519                                                        ~
~E-mail:       caveman0000@yhoo.com                                        ~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/  
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAXD  20
#define MAXL 100
#define separators " ,\n\t"
const int row[8]={ -2 , -1 , 1 , 2 ,  2 ,  1 , -1 , -2 };
const int col[8]={  1 ,  2 , 2 , 1 , -1 , -2 , -2 , -1 };
FILE *in , *out;
int path[MAXD][MAXD];
int LAB[MAXD][MAXD] , n , solNo = 1 , *k ;

void print( void )
{
	int i , j , way[MAXD*MAXD][2];
	for( i = 1 ; i <= n ; i++ )
	 for( j = 1 ; j <= n ; j++ )
		{
			way[path[i][j]][0] = i ;
			way[path[i][j]][1] = j;
		}
	fprintf( out , "%d:\n" , solNo++ );
	for ( i = 1 ; i <= n * n ; i++ )
	 fprintf( out , "%d %d\n" , way[i][0] , way[i][1]);
}
void back( int x , int y , int step )
{
	int xx , yy , opt ;
	char *s;
	for ( opt = 0 ; opt < 8 ; opt++ )
	 { xx = x + row[ opt ];
		 yy = y + col[ opt ];
		 if ( 1 <= xx && xx <= n && 1 <=yy && yy <=n )
			if( path[xx][yy]== 0 )
			 {
				path[xx][yy] = step;
				if( step == n * n ) print ();
					else back ( xx , yy , step+1 );
				path[xx][yy] = 0;
			 }
	 }
}
int main()
{ char *s;
	int i , j;
	in = fopen( "in.txt" , "r" );
	s = malloc( MAXL );
	fgets( s , MAXL , in );
	if( !( n = atoi( s )))
	return 0;
	fclose( in );
	for( i = 1 ; i <= n ; i++ )
	 for( j = 1 ; j <= n ; j++ )
		path[i][j] = 0;
	out = fopen( "out.txt" , "w");
	 path[1][1]=1;
	back( 1 , 1 , 2 );
	fclose( out );
	return 1;
}
