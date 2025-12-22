//program care realizeaza intersectia, reuniunea si diferenta a doua multimi citite
#include<stdio.h

int main ()
{
    int n,m,a[200],b[200],i,j,c[200],k=-1,ok,s[200],r[200];
    printf("n=");
    scanf("%d",&n);
    for(i=0; i<n; i++)
        scanf("%d",&a[i]);
    printf("m=");
    scanf("%d",&m);
    for(i=0; i<m; i++)
        scanf("%d",&b[i]);
// intersectia
    for(i=0; i<n; i++)
        for( j=0; j<m; j++)
            if( a[i] == b[j] )
            {
                k++;
                c[k]=a[i];
            }
    printf("intersectia este: ");
    for( i=0; i<=k ; i++ )
        printf("%d ",c[i]);
//reuniunea
    for(i=0; i<n; i++)
        r[i]=a[i];

	k=n-1;
	for(i=0; i<m; i++)
        {
			ok=1;
			for( j=0; j<n; j++)
				if( b[i] == a[j] )
					ok=0;
			if( ok == 1 )
			{
				k++;
				r[k]=b[i];
			}
		}

    printf("\nreuniunea este: ");
    for( i=0; i<=k; i++ )
        printf("%d ",r[i]);
//diferenta
	printf("\ndiferenta dintre prima multime si a doua este: ");
	k=-1;
	for(i=0; i<n; i++)
        {
			ok=1;
			for( j=0; j<m; j++)
				if( a[i] == b[j] )
					ok=0;
			if( ok == 1 )
			{
				k++;
				c[k]=a[i];
			}
		}
	for( i=0; i<=k; i++ )
		printf("%d ",c[i]);
//diferenta
	printf("\ndiferenta dintre a doua multime si prima este: ");

	k=-1;
	for(i=0; i<m; i++)
        {
			ok=1;
			for( j=0; j<n; j++)
				if( b[i] == a[j] )
					ok=0;
			if( ok == 1 )
			{
				k++;
				s[k]=b[i];
			}
		}

	for( i=0; i<=k; i++ )
		printf("%d ",s[i]);

    return 0;
}
