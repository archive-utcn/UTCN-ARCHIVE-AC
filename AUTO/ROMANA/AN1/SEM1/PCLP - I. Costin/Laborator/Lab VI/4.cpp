#include "stdio.h"
#include "conio.h"
#define nmax 50

void sort(int n,float *a)//sort a vector
{ 
  int i, j;
  float aux;
  for (i=0;i<n-1;i++)
      for (j=i+1;j<n;j++)
          if (*(a+i)>*(a+j))//when we find 2 consecutive elements in descending order, we interchange them
             {
               aux=*(a+i);
               *(a+i)=*(a+j);
               *(a+j)=aux;
             }
}

/*int search(int n,float *a,int val)//we search if a value is a vector or not
{
    int ok,i;
    ok=0;
    for (i=1;i<=n;i++)
        if (*(a+i)==val)
           ok=1;
    return ok;
}*/

int merge(int n,int m,int *p,float *a,float *b,float *c)//merge the 2 vectors
{ 
  int i,j;
  i=0;
  j=0;
  (*p)=0;
  while ((i<n)&&(j<m))
     if (*(a+i)<*(b+j))
       {
                   *(c+(*p))=*(a+i);
                   (*p)+=1;
                    i++;
       }
     else
       { 
                  *(c+(*p))=*(b+j);
                  (*p)+=1;
                  j++;
                
       }
  while (i<n)
       { 
           *(c+(*p))=*(a+i);
           (*p)+=1;
            i++;
        }
  while (j<m)
        { 
             *(c+(*p))=*(b+j);
             (*p)+=1;
              j++;
         }

}

int main()
{ 
  int i,n,m,p;
  float a[nmax],b[nmax],c[nmax];
  printf("Please input the numbers of elements of the first vector \n");//read the first vector
  scanf("%d",&n);
  for (i=0;i<n;i++)
      { printf("Please input  a[%d]= \n",i+1);
        scanf("%f",&a[i]);
      }

  sort(n,a);//sort the first vector
  
  printf("Please input the numbers of elements of the second vector \n");//read the second vector
  scanf("%d",&m);
  for (i=0;i<m;i++)
      { 
         printf("Please input a[%d]= \n",i+1);
         scanf("%f",&b[i]);
      }
      
  sort(n,b);//sort the second vector
  
  merge(n,m,&p,a,b,c);//merge two vectors
  for (i=0;i<p;i++)//display the vector obtained by merging the 2 vectors
      printf("c[%d]=%f\n",i+1,c[i]);
  getch();
}
