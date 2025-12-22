#define nmax 10

void product(int n,int m,int p,double a[nmax][nmax],double b[nmax][nmax],double c[nmax][nmax])
{ 
  int i,j,k;
  double s;
  for (i=0;i<n;i++)
      for (j=0;j<p;j++)
          { 
            s=0.0;
            for (k=0;k<m;k++)
                s=s+a[i][k]*b[k][j];
            c[i][j]=s;
          }
}

