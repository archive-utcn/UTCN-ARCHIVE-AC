#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int n , nr;

void sol( void )
{
	int m , b = 0;
	m = n;
	if(nr/2)
		{
		    printf("\nMal stang  Barca   Mal drept\n");
			printf( "%d %d      %d %d      %d %d\n" , n - nr , n , nr , 0, 0 , 0 );
			printf( "\n" );
			printf( "%d %d      %d %d      %d %d\n" , n - nr , n - nr , 0 , nr ,nr , 0);
			printf( "\n" );
			m = n - nr;
		}
	while (m>nr/2)
	 {
		printf( "%d %d      %d %d      %d %d\n" , m , m , b , b, n-m-b , n-m-b);
		printf( "\n");
		b = nr/2;
		m=m-nr/2;
	 }
	printf( "%d %d      %d %d      %d %d\n" , 0 , 0 , m , m, n-m , n-m );
	printf( "\n" );
	printf( "%d %d      %d %d      %d %d\n" , 0 , 0 , 0 , 0, n , n);
}

int main()
{
    printf("Numar de canibali si de oameni:");
    scanf("%d",&n);
    printf("Numar de locuri in barca:");
    scanf("%d",&nr);
	sol();
	return 1;
}
