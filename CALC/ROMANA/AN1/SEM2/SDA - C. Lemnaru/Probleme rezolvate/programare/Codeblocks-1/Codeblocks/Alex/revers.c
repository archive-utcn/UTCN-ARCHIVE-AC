#include <stdio.h>
	#include <conio.h>

	 void revers(void)
	 {
		char c;
		scanf("%c",&c);
		if (c!='\40') {printf("%c",c);revers();};
		printf("%c",c);
	 }

	  void main(void)
	  {
		 int n,i;
		 printf("\nNumarul de cuvinte=");
		 scanf("%d",&n);
		 for(i=1;i<=n;++i)
			 {
				revers();
				printf("\n");
			 };
	  }
