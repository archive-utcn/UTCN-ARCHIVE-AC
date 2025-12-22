#include "math.h"
#define nmax 10

void invert(int n,double a[nmax][nmax],double eps,double b[nmax][nmax],double *det_a, int *err)
{ 
  int i,j,k,pozmax;
  double amax,aux;
  double s;
  for (i=0;i<n;i++)//we initialize the matrix b with the unit matrix
      for (j=0;j<n;j++)
          if (i==j)
             b[i][j]=1.0;
          else
             b[i][j]=0.0;
  *det_a=1.0;//we initialize the determinant; we make 0 under the principal diagonale
  k=0;
  *err=-1;
  while ( (k<n)&&(*err==-1) )
    { 
      // element pivot...
      amax=fabs(a[k][k]);
      pozmax=k;
      for (i=k+1;i<n;i++)
        if ( fabs(a[i][k])>amax)
          { 
            amax=fabs(a[i][k]);
            pozmax=i;
          }
      // interscimbarea liniei k cu pozmax in matr a si b
      if (k!=pozmax)
        {
           for (j=0;j<n;j++)
             { 
               aux=a[k][j];
               a[k][j]=a[pozmax][j];
               a[pozmax][j]=aux;
               aux=b[k][j];
               b[k][j]=b[pozmax][j];
               b[pozmax][j]=aux;
            }
           *det_a=-*det_a;
        }
      if (fabs(a[k][k])<eps)
        *err=k;
      else
        { 
           *det_a=*det_a*a[k][k];
           aux=a[k][k];
           for (j=0;j<n;j++)
              { 
                a[k][j]=a[k][j]/aux;
                b[k][j]=b[k][j]/aux;
              }
           for (i=0;i<n;i++)
              if (i!=k)
                 { 
                    aux=a[i][k];
                    for (j=0;j<n;j++)
                       { 
                         a[i][j]=a[i][j]-a[k][j]*aux;
                         b[i][j]=b[i][j]-b[k][j]*aux;
                       }
                 }
        }
    k++;
  }
}

