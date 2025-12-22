/*  Functia calculeaza produsul matricelor a[n][m]
	si b[m][p] de tip double rezultand matricea c[n[][p] */
    #define NMAX 10

    void produs(int n,int m,int p,double a[NMAX][NMAX],
		double b[NMAX][NMAX],double c[NMAX][NMAX])
    /* Calculul produsului c=a*b) */
    {
       int i,j,k;
       double s;
       for(i=0;i<n;i++)
	 for(j=0;j<p;j++)
	   {
                 s=0.0;
	     for(k=0;k<m;k++)
	       s=s+a[i][k]*b[k][j];
	     c[i][j]=s;
	   };
    }
