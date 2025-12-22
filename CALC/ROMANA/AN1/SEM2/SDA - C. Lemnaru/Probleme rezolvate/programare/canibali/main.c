#include <stdlib.h>
#include <stdio.h>

FILE *in , *out;
int n , cap;

void solution( void )
{
	int m = n , b = 0;
	out = fopen("out.txt" , "w");
	if( cap / 2 )
		{
			/* cap canibals cross , followed by cap missionars */
			fprintf( out , "L %d %d\n" , n - cap , n );
			fprintf( out , "B %d %d\n" , cap , 0 );
			fprintf( out , "R %d %d\n" , 0 , 0 );
			fprintf( out , "\n" );
			fprintf( out , "L %d %d\n" , n - cap , n - cap );
			fprintf( out , "B %d %d\n" , 0 , cap );
			fprintf( out , "R %d %d\n" ,  cap , 0 );
			fprintf( out , "\n" );
			m = n - cap;
		}
	while( m > cap/2 )
	 {
		fprintf( out , "L %d %d\n" , m , m );
		fprintf( out , "B %d %d\n" , b , b);
		fprintf( out , "R %d %d\n" , n-m-b , n-m-b );
		fprintf( out , "\n");
		b = cap/2;
		m -= cap/2;
	 }
	fprintf( out , "L %d %d\n" , 0 , 0 );
	fprintf( out , "B %d %d\n" , m , m );
	fprintf( out , "R %d %d\n" , n-m , n-m );
	fprintf( out , "\n" );
	fprintf( out , "L %d %d\n" , 0 , 0 );
	fprintf( out , "B %d %d\n" , 0 , 0 );
	fprintf( out , "R %d %d\n" , n , n );
	fclose( out );
}

int main()
{
	in = fopen("in.txt" , "r");
	fscanf(in,"%d",&n);
	fscanf(in,"%d",&cap);
	solution();
	return 1;
}
