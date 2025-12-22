#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<limits.h>

typedef struct vectT
{
	int* v;
	int n;
} vectT;
vectT post, pre, inor, dist;
FILE *in, *out;

int **adj, **A, **p;

/***********************************************************
* FUNCTION NAME: rebuild
*
* DESCRIPTION: Rebuilds the adjacenti matrix from the preorder and postorder traversals
*
* ARGUMENT LIST:
* Argument        Type   IO      Description
* ------------- -------- -- --------------------------------
* int**         adj         matrix to store result
* int           p
* int           s
* RETURN VALUE: void
*
* CHANGES:
*************************************************************/
void rebuild(int** adj,int p, int s)
{
	static int i=0, j=0, k=0;
	int d;
	if(p==0)
		p=pre.v[i++];
	if(s==0)
		s=post.v[j++];
	while(p!=s)
	{
		d=pre.v[i++];
		if(d==s)
			adj[p-1][d-1]=adj[d-1][p-1]=dist.v[k++];
		else
		{
			rebuild(adj,d,s);
			adj[p-1][d-1]=adj[d-1][p-1]=dist.v[k++];
		}
		s=post.v[j++];
	}
}

/***********************************************************
* FUNCTION NAME: len
*
* DESCRIPTION: calculates the number os digits of a number
*
* ARGUMENT LIST:
* Argument        Type   IO      Description
* ------------- -------- -- --------------------------------
* int           n
* RETURN VALUE: int
*
* CHANGES:
*************************************************************/
int len(int n)
{
	int i=1;
	while(n/=10)
		i++;
	return i;
}

/***********************************************************
* FUNCTION NAME: DFS
*
* DESCRIPTION: Depht first search
*
* ARGUMENT LIST:
* Argument        Type   IO      Description
* ------------- -------- -- --------------------------------
* int **        adj         natrix
* int*          pred        precedency vector
* int*          d           dfnumber
* int*          aux         low vector for articulation points
* int*          art         artculation points
* int           n           number of nodes
*               void
*               *pf         ArtPoint function or dfsvisit
*
*               int
* int*
* int**
* int*
* int*
* int*
* int*
*               int
* RETURN VALUE: void
*
* CHANGES:
*************************************************************/
void DFS(int **adj, int *pred, int* d, int* aux, int* art, int n, void(*pf)(int, int*, int**, int*, int*, int*, int*, int))
{
	int i=0;
	static int time=0;
	for(i=0; i<n; i++)
		pred[i]=-2;
	for(i=0; i<n; i++)
		if(pred[i]==-2)
			(*pf)(i, &time, adj, pred, d, aux, art, n);
}

/***********************************************************
* FUNCTION NAME: ArtPoint
*
* DESCRIPTION:  Finsd articulation points in conjuction with DFS. Parameters as before
*
* ARGUMENT LIST:
* Argument        Type   IO      Description
* ------------- -------- -- --------------------------------
* int           v
* int*          time
* int **        adj
* int*          pred
* int*          d
* int*          aux
* int*          art
* int           n
* RETURN VALUE: void
*
* CHANGES:
*************************************************************/
void ArtPoint(int v, int* time, int **adj, int *pred, int* d, int* aux, int *art, int n)
{	if(pred[v]==-2)
		pred[v]=-1;
	aux[v]=d[v]=++(*time);
	int j=0, k=0;
	for(j=0; j<n; j++)
		if(adj[v][j]!=INT_MAX)
		{
			if(pred[j]==-2)
			{
				pred[j]=v;
				ArtPoint(j, time, adj, pred, d, aux, art, n);
				aux[v]=(aux[v]<aux[j])?aux[v]:aux[j];
				if(pred[v]==-1)
				{
					for(k=0; k<n; k++)
						if(pred[k]==v && k!=j)
							art[v]++;
				}
				else if(aux[j]>=d[v])
					art[v]++;
			}
			else if(j!=pred[v])
				aux[v]=(aux[v]<d[j])?aux[v]:d[j];
		}
}

/***********************************************************
* FUNCTION NAME: read
*
* DESCRIPTION: Reads the data form the file
*
* ARGUMENT LIST:
* Argument        Type   IO      Description
* ------------- -------- -- --------------------------------
* vectT*        av          Vertices vector
* vectT*        bv          distance vector
* int k                     variable to specify if dist reading is necessary
* RETURN VALUE: void
*
* CHANGES:
*************************************************************/
void read(FILE * f, int * n)
{
	fscanf(f, "%d", n);

	int i = 0, j = 0;

	//allocate memory for matrix
	adj = (int**)malloc((*n) * sizeof(int*));
	for(i = 0; i < (*n); i++)
        adj[i] = (int*)malloc((*n) * sizeof(int));

	for(i = 0; i < (*n); i++)
	{
	    for(j = 0; j < (*n); j++)
	    {
	        fscanf(f, "%d", &adj[i][j]);
	    }
	}
}

/***********************************************************
* FUNCTION NAME: Floyd
*
* DESCRIPTION: Floyd algorithm implementation.
*
* ARGUMENT LIST:
* Argument        Type   IO      Description
* ------------- -------- -- --------------------------------
* int n
* int**         adj         adjacenti matrix
* int **        A           calculated distance matrix
* int **        p           path matrix
* RETURN VALUE: void
*
* CHANGES:
*************************************************************/
void Floyd( int n , int** adj, int **A, int **p)
{
	int i, j, k;
	/* initialize A */
	for ( i = 0; i < n; i++ )
		for ( j = 0; j < n; j++ )
			A[ i ][ j ] = adj[ i ][ j ];
	for ( i = 0; i < n; i++ )
		for ( j = 0; j < n; j++ )
			p[ i ][ j ] = -1;
	for ( i = 0; i < n; i++ )
		A[ i ][ i ] = 0;
	for ( k = 0; k < n; k++ ) 	/* all nodes */
		for ( i = 0; i < n; i++ ) /* all lines */
			for ( j = 0; j < n; j++ ) /* all columns */
				if ( A[ i ][ k ] + A[ k ][ j ] < A[ i ][ j ] && A[i][k]!=0 && A[k][j]!=0)
				{
					A[ i ][ j ] = A[ i ][ k ] + A[ k ][ j ];
					p[i][j]=k;
				}
}

/***********************************************************
* FUNCTION NAME: path
*
* DESCRIPTION: Path decoding function for floyd alg.
*
* ARGUMENT LIST:
* Argument        Type   IO      Description
* ------------- -------- -- --------------------------------
* int           i
* int           j
* int**
* RETURN VALUE: void
*
* CHANGES:
*************************************************************/
void path( int i, int j, int** p )
{
	int k;
	k = p[ i ][ j ];
	if ( k != -1 )
	{
		path( i, k, p );
		fprintf(out, "%d, ", k+1);
		path( k, j, p );
	}
}

int main()
{
	if(!(in=fopen("input.txt", "r")))
	{
		printf("Couldn't open file for input!...");
		return 0;
	}
	if(!(out=fopen("P03.out", "w")))
	{
		printf("Couldn't open file for output!...");
		return 0;
	}

	int i,j,n;
	read(in, &n);

	for(i = 0; i < n; i++)
    {
        for(j = 0; j < n; j++)
            printf("%3d", adj[i][j]);
        printf("\n");
    }

	A=(int**)malloc(n*sizeof(int*));
	for(i=0; i<n; i++)
		A[i]=(int*)malloc(n*sizeof(int));
	p=(int**)malloc(n*sizeof(int*));
	for(i=0; i<n; i++)
		p[i]=(int*)malloc(n*sizeof(int));

	Floyd(n, adj, A, p);
	fprintf(out,"\n");
	fprintf(out, "\n");
	fprintf(out, "Shortest paths:\n");
	for(i=0; i<n; i++)
		for(j=i; j<n; j++)
			if(i!=j)
				if(A[i][j]!=INT_MAX)
				{
					fprintf(out,"From %d to %d, length %d: %d, ", i+1, j+1, A[i][j], i+1);
					path(i,j,p);
					fprintf(out,"%d.\n", j+1);
				}
				else
					fprintf(out, "No path from %d to %d!\n", i+1, j+1);
	fclose(in);
	fclose(out);
	return 0;
}
