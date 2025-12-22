#include "programe.h"

int ex1(int n,int s)
{
    while(n!=0)
        {
        if(n&1)
            s++;
        n=n>>1;
        }
    s=sizeof(n)*8-s;
    return s;
}
int ex2(int n)
{

    if(((n%4==0)&&(n%100!=0))||(n%400==0))
        printf("An bisect");
        else printf("Nu e an bisect");
}
int ex3(int n)
{
    int a[200], b[200]={0},i;
    printf("sirul este: ");
    for(i=0 ; i<n; i++ )
        {
            scanf("%d",&a[i]);
            b[a[i]]=b[a[i]]+1;
        }
    for(i=0 ; i<n; i++ )
        {
            if(b[a[i]] !=0 )
                {
                    printf("numarul %d apare de %d ori \n",a[i],b[a[i]]);
                    b[a[i]]=0;
                }
        }
}
int ex4(int n)
{
    int m,a[200],b[200],i,j,c[200],k=-1,ok,s[200],r[200];
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

}
int ex5(int x)
{
    if(x<-2)
        printf("f(%d)=%d",x,x*x+4*x+4);
        else if((x>-2)&&(x!=0))
                printf("f(%d)=%d",x,x*x+5*x);
                else if(x==0)
                        printf("f(%d)=0",x);
                        else printf("Functia nu e definita in -2");
}
int ex6()
{
    printf("tipul INT are %d biti \n",sizeof(int)*8);
	printf("tipul FLOAT are %d biti \n",sizeof(float)*8);
	printf("tipul CHAR are %d biti \n",sizeof(char)*8);
	printf("tipul DOUBLE are %d biti \n",sizeof(double)*8);
	printf("tipul LONG INT are %d biti \n",sizeof(long int)*8);
}
int ex7(int n)
{
    float v[50],max, min;
    int i;
    for(i=0;i<n;i++)
        {
            printf("v[%d]=",i);
            scanf("%f",&v[i]);
        }
    min=v[0];
    max=v[0];
    for(i=1;i<n;i++)
    {
        if(max<v[i])
               max=v[i];
        if(min>v[i])
            min=v[i];
    }
    printf("max=%f si se gaseste pe pozitia",max);
    for(i=0;i<n;i++)
        if(max==v[i])
            printf("%d ",i+1);
    printf("\nmin=%f si se gaseste pe pozitia",min);
    for(i=0;i<n;i++)
        if(min==v[i])
            printf("%d ",i+1);
}
int ex8(int n)
{
    int i,k ,j;
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
}
int ex9(int n)
{

	int i,j,ok,s ;
	printf("numere perfecte mai mici decat %d sunt: ",n);
	for( i = n; i >=2 ; i-- )
		{
			s=0;
			for( j=1; j<=i/2; j++ )
				if( i%j == 0 )
					s=s+j;
			if( s == i )
				printf("%d ",i);
		}
}
int ex10(int n)
{
    int x,inv=0;
    x=n;
    while(x!=0)
    {
        inv=inv*10+x%10;
        x=x/10;
    }
    if(inv==n)
        printf("Numarul este palindrom");
        else printf("Numarul nu este palindrom");
    return 0;
}
