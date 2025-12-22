#include <stdio.h>
#include <stdlib.h>


void quickSort( int a[], int li, int ls)
{
   int j;
   if( li < ls )
   {
   	// divide and conquer
        j = partition( a, li, ls);
       quickSort( a, li, j-1);
       quickSort( a, j+1, ls);
   }

}



int partition( int a[], int li, int ls) {
   int pivot, i, j, t;
   pivot = a[li];
   i = li; j = ls+1;

   while( 1)
   {
   	do ++i; while( a[i] <= pivot && i <= ls );
   	do --j; while( a[j] > pivot );
   	if( i >= j ) break;
   	t = a[i]; a[i] = a[j]; a[j] = t;
   }
    t = a[li]; a[li] = a[j]; a[j] = t;
    return j;
}



int main()
{
	int a[100],i,n;
    printf("Cate numere doriti sa intrduceti? ");
    scanf("%d",&n);
    printf("Introduceti numerele: ");
    for(i=0;i<n;i++) scanf("%d",&a[i]);

	quickSort( a, 0, n);

	printf("Sirul sortat este:  ");
	for(i = 0; i < n; ++i)
		printf(" %d ", a[i]);
    return 0;
}




