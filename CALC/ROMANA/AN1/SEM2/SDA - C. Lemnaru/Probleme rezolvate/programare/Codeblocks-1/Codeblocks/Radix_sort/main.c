#include <stdio.h>



void afisare(int *a,int n)
{
		int i;
        for(i=0;i<n;i++)
			printf("%d  ",a[i]);
}

void radixsort(int *a,int n)
{
		int i,b[20],m=0,exp=1;
		for(i=0;i<n;i++)
		{
			if(a[i]>m)
				m=a[i];
		}

		while(m/exp>0)
		{
			int bu[10]={0};
			for(i=0;i<n;i++)
				bu[a[i]/exp%10]++;
			for(i=1;i<10;i++)
				bu[i]+=bu[i-1];
			for(i=n-1;i>=0;i--)
				b[--bu[a[i]/exp%10]]=a[i];
			for(i=0;i<n;i++)
				a[i]=b[i];
			exp*=10;
        }
}


int main()
{
           int aa[20],i,n;
           printf("Cate elemente sunt? ");
           scanf("%d",&n);
           printf("Elementele sunt :\n");
           for(i=0;i<n;i++)
				scanf("%d",&aa[i]);
           printf("\nElemente nesortate  : ");
           afisare(&aa[0],n);
           radixsort(&aa[0],n);
           printf("\nDupa radix sort : ");
           afisare(&aa[0],n);
           printf("\n");
           return 0;
}
