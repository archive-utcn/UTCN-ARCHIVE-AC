/*Program de calcul a inversei unei matrice si a
   determinantului atasat */
    #include <stdio.h>
    #include <conio.h>

    #define NMAX 10
    void citire_matrice(int *n,int *m,double a[NMAX][NMAX]);
    void afisare(int n,int m,double a[NMAX][NMAX],char ch);
    void produs(int n,int m,int p,double a[NMAX][NMAX],
		 double b[NMAX][NMAX],double c[NMAX][NMAX]);
    void invers(int n,double a[NMAX][NMAX],double eps,
	 double b[NMAX][NMAX],double *det_a,int *err);

     int main()
    {
       int i,j,n,m,err;
       double eps,det_a,a[NMAX][NMAX],a1[NMAX][NMAX],
			b[NMAX][NMAX],c[NMAX][NMAX];
       citire_matrice(&n,&m,a);
       afisare(n,m,a,'A');
       getch();
       for(i=0;i<n;i++)
	 for(j=0;j<n;j++)
	   a1[i][j]=a[i][j];
       eps=1.0e-6;
       invers(n,a1,eps,b,&det_a,&err);
       if(err==1) printf("\nMATRICEA A ESTE SINGULARA");
       else { printf("\nMATRICEA INVERSA B=A^(-1)\n");
	      afisare(n,n,b,'B');
	      printf("\nDETERMINANTUL MATRICEI A ESTE 8.4lf ",det_a);
	      produs(n,n,n,a,b,c);
	      printf("\nVERIFICARE C=A*B REZULTA MATRICEA UNITATE!");
	      afisare(n,n,c,'C');
	      getch();
	    }
	    return(0);
   }
