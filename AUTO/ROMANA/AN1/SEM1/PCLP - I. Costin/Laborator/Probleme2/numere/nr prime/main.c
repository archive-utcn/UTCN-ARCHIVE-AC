// program care determina numerele prime, mai mici sau egale cu un X citit de la tastatura
#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n,i,k ,j;
    printf("n=");
    scanf("%d",&n);
    printf("numere prime mai mici decat %d sunt: ",n);
	for( i = n; i >=2 ; i-- )
		{
			k=1;
			for( j=2; j<=sqrt(i); j++ )
				if( i%j == 0 )
					k=0;
			if( k == 1 )
				printf("%d ",i);
		}
    return 0;
}
