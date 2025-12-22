   /* Afisarea si citirea unei matrice de n*m elemente de tip double */

    #include <stdio.h>
    #include <conio.h>

    #define NMAX 10

    void afisare(int n,int m,double a[NMAX][NMAX],char ch)
    {
      int i,j;
      printf("\n    MATRICEA  %c\n",ch);
      for(i=0;i<n;i++)
	{ for(j=0;j<m;j++)
	    printf("%8.2lf ",a[i][j]);
	  printf("\n");
	}
     }
    void citire_matrice(int *n,int *m,double a[NMAX][NMAX])
    {
      int i,j;
      printf("\nIntroduceti nr.linii n=");scanf("%d",n);
      printf("\nIntroduceti nr.coloane m=");scanf("%d",m);
      printf("\nIntroduceti elementele matricei\n");
      for (i=0;i<*n;i++)
	for(j=0;j<*m;j++)
	  {
                printf("a[%d,%d]=",i,j);scanf("%lf",&a[i][j]);
	  }
      printf("\n");
    }
