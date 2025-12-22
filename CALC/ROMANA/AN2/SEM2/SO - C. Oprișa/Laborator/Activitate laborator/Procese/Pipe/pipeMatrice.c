#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>

/* n nr de linii, m nr de coloane, mat matricea */
void matrice(int n, int m, int* mat[]){
	int i,j;
	int ok;
	int nr0 = 0;
	int nr1 = 0;
//	afisMatrice(n,m,mat);
	ok = 0;
	while ( ok != 1){
		ok = 1;
		for ( i = 0; i < n-1; i++ ) 
			for ( j = 0; j < m-1; j++ ){
				nr1=0;
				nr0=0;
				if (j > 0){
					if (mat[i][j-1] == 1)
						nr1++;
					else nr0++;

					if (mat[i+1][j-1] == 1)
						nr1++;
					else nr0++;
				}
				if (i > 0 && j > 0){
					if (mat[i-1][j-1] == 1 )
						nr1++;
					else nr0++;
				}	
			
				if ( i > 0 ){
					if ( mat[i-1][j] == 1 )
						nr1++;
					else nr0++;

					if ( mat[i-1][j+1] == 1)
						nr1++;
					else nr0++;
				}

				if(mat[i+1][j] == 1)
					nr1++;
				else nr0++;

				if(mat[i+1][j+1] == 1)
					nr1++;
				else nr0++;

				if(mat[i][j+1] == 1)
					nr1++;
				else nr0++;
			
				if ( nr1 >= 5 && mat[i][j] != 0){
					printf(" nr1=%d \n",nr1);
					printf(" i=%d, j=%d \n",i,j);
					mat[i][j] = 0;
					ok = 0;
				}

				else if ( nr0 >= 5 && mat[i][j] != 1){
					printf(" nr0=%d \n", nr0 );
					printf(" i=%d, j=%d \n" , i,j );
					mat[i][j] = 1;
					ok = 0;
				      }
			}
	}
}

/*n nr de linii, m nr de coloane */
void afisMatrice(int n, int m, int* mat[]) {
	int i,j;
	for (i = 0; i < n; i++){
		for (j =0; j < m; j++)
			printf (" %d ",mat[i][j]);
	printf("\n");
	}
}
			

int main(){
	int p[2];
	pipe(p);
	int q[2];
	pipe(q);
	int f;
	f=fork();
	if (f < 0) {
		printf(" nu s-a creeat fork " );
		exit(0);
	}
	if( f == 0 ){ //fiu
		int i,j;
		int** mat;
		int n,m;
		printf(" dati numarul de linii ");
		scanf ("%d",&n);
		printf(" dati numarul de coloane ");
		scanf ("%d",&m);
		mat = malloc(n * sizeof(int*));
		for( i = 0; i < n; i++)
			mat[i] = malloc ( m * sizeof(int));
		for ( i = 0; i < n; i++)
			for (j = 0; j < m; j++){
				printf("mat[%d][%d]=",i,j);
				scanf("%d",&mat[i][j]);
			}
		afisMatrice(n,m,mat);
		write(p[1],&n,sizeof(int));
		write(p[1],&m,sizeof(int));
//		write(p[1],mat,sizeof(int*));
		for(i=0;i<n;i++)
			for(j=0;j<m;j++)
				write(p[1],&mat[i][j],sizeof(int));		
	
		read(q[0],&n,sizeof(int));
		read(q[0],&m,sizeof(int));
//		read(q[0],mat,sizeof(int*));
		
		for(i = 0; i < n; i++)
			for(j = 0; j < m; j++){
				read(q[0],&mat[i][j],sizeof(int));
			}
		printf("afisare matrice din client \n");
		afisMatrice(n,m,mat);
		for(i=0;i<n;i++)
			free(mat[i]);
		free(mat);
		exit(0);
	}
	int i,j;
	int a,b,c;
	int** x;
	read(p[0],&a,sizeof(int));
	read(p[0],&b,sizeof(int));
	
	x = malloc(a * sizeof(int*));
	for (i = 0; i < a; i++ )
		x[i] = malloc (b * sizeof(int));
	
//	read(p[0],x,sizeof(int*));
	
	for(i = 0; i < a; i++)
		for(j=0;j<b;j++)
			read(p[0],&x[i][j],sizeof(int));
 	
	matrice(a,b,x);
	
	write(q[1],&a,sizeof(int));
	write(q[1],&b,sizeof(int));
//	write(q[1],x,sizeof(int*));

	for(i = 0; i < a; i++)
		for(j = 0; j < b; j++)
			write(q[1],&x[i][j],sizeof(int));
	
	wait(0);

//	printf("afisare matrice din server: \n");
//	afisMatrice(a,b,x);
	
	for(i = 0; i < a; i++)
		free(x[i]);
	free(x);
	printf("parinte");
	 
	return 0;
} 
