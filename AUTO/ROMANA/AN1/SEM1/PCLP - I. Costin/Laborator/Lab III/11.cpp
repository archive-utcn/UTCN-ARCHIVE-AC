#include <stdio.h>
#include <conio.h>
#include <stdlib.h>

int n;
double Eq[101][101];
double fr[101];
double Sol[101];

void CheckIfOk ()
{
  int i, j, k;
  for (i = 1;i <= n;i++) //check if the determinant of the matrix of eq is not 0
  {
    double sum = 0;
    for (j = 1;j <= n;j++)
     sum += Eq[i][j];
     
    if (sum == 0) 
    {
      printf("The system has more than one sollution\n");
      getch();
    }
    
    sum = 0;
    for (j = 1;j <= n;j++)
     sum += Eq[j][i];
    
    if (sum == 0) 
    {
      printf("The system has more than one sollution\n");
      getch();
    }
  }
}

void Read ()
{
  int i, j;
  printf("Input the number of equations of the system : ");
  scanf("%d", &n);
  printf("Input the equations on one line (%d coef) and free term \n", n);
  printf("All coefficients should be non-zero!\n");
  
  // read the input 
  for (i = 1;i <= n;i++)
  {
     printf("Equation nr #%d:\n", i); 
     for (j = 1;j <= n;j++)
     {
       scanf("%lf", Eq[i] + j);
       if (!Eq[i][j])
       {
          printf("You entered a non-zero coefficient!\nERROR\n");
          getch();
          exit(0);
       }
     }
     scanf("%lf", fr + i);
  }

}

void Transform ()
{
  int i, j, k;
  
  for (i = 1;i <= n - 1;i++) 
  //at each iteration we get 0 under the main diagonal on the column i
  {
    double aux; 
    
    for (k = i + 1;k <= n;k++)
    {
      aux = -Eq[i][i] / Eq[k][i];
      for (j = 1;j <= n;j++)
        Eq[k][j] *= aux;
      fr[k] *= aux;
    }
    
    for (k = i + 1;k <= n;k++)
    {
      for (j = 1;j <= n;j++)
        Eq[k][j] += Eq[i][j];
      fr[k] += fr[i];
    }
    
  }
}

void GetSol ()
{
  int i, j;
  double sum = 0;
  
  for (i = n;i >= 1;i--)
  {
    sum = 0;
    for (j = i + 1;j <= n;j++)
      sum += Eq[i][j] * Sol[j];
    Sol[i] = (fr[i] - sum)/Eq[i][i];
  }
}

void PrintSol ()
{
  int i;
  printf("The sollution is : \n{ ");
  for (i = 1;i < n;i++)
   printf("%.2lf, ", Sol[i]);
  printf("%.2lf }", Sol[n]);
}

int main ()
{
  
  Read ();
  Transform ();
  CheckIfOk ();
  
  /*
  // Show we have 0 under the main diagonal
  for (i = 1;i <= n;i++)
  {
    for (j = 1;j <= n;j++)
      printf("%.2lf ", Eq[i][j]);
    printf(" = %.2lf\n", fr[i]);
  }*/
  
  GetSol ();
  PrintSol ();
  
  getch ();
  return 0;
}
