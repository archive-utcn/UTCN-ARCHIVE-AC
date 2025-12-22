
/* Programul L7Ex1.cpp */

	#include <stdio.h>
	#include <conio.h>

	/* Programul citeste n cuvinte separate cu spatiu;
	(dupa ultimul cuvant va exista  spatiu si <ENTER>)
			 si le afiseaza "in oglinda" */

	 void revers(void)
	 {
		char c;
		scanf("%c",&c);
		if (c!='\40') {printf("%c",c);revers();};
		printf("%c",c);
	 }

	  int main(void)
	  {
		 int n,i;
		 printf("\nNumarul de cuvinte=");
		 scanf("%d",&n);
		 for(i=1;i<=n;++i)
			 {
				revers();
				printf("\n");
			 };
		 printf("\nPROGRAMUL S-A TERMINAT!!!\n");
		 getch();
		 return(0);
	  }
