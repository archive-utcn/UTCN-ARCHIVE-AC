#include <stdio.h>
#include <stdlib.h>

int main()
{  /* float n = 0.0f;
    printf("Enter a real number: \n");
    scanf("%f", &n);
    if(n < -1)
    {
        printf("Writes the expression of the first branch %f", (n*n + 4*n + 8));

    }
    else if (n==-1)
    {
        printf(("Writes the expression of the second branch %f", 0));
    }
    else
    {
        printf("Writes the expression of the third branch %f", (n*n - 5*n + 1));

    } */

  /*  unsigned int no = 0;
    unsigned int mask = 1 << 31;

    printf("enter a new value ");
    scanf("%d", &no);

     while (mask > 0)
     {
         if (no && mask == 0) printf("0");
            else printf("1");
            mask = mask << 1;
     }


      float ma1 = 0.0f, suma1 = 0.0f,suma2 = 0.0f, ma2 = 0.0f;
      int nr_even = 0, nr_odd = 0, i = 0, c=0, k = 0;
      int array[100];

       do
       {
           printf("enter a value: ");
           scanf("%d", &c);

           array[i] = c;
           i++;

       }while(c != 0);

        for (k=0; k<i; k++)
        {
            if (array[k] % 2==0 && array[k] != 0)
            {
                nr_even++;
             suma1=suma1+array[k];
            }


          if (array[k] % 2 !=0)
          {
              nr_odd++;
              suma2=suma2+array[k];
          }

        }
        ma1=suma1/nr_even;
        ma2=suma2/nr_odd;

        printf("write the even average value %f\n", ma1);
        printf("write the odd average value %f\n", ma2);
        printf("write total of even numbers %d\n", nr_even);
        printf("write the total of odd numbers %d\n", nr_odd);

    */

   char k = '0';
   float a = 0, b = 0;

   //printf("Enter one of the following: + or - or * or / \n");
   scanf(" %c", &k);


   while ( scanf(" %c", &k) == 1 && k != 'q')
   {printf("enter the a value ");
   scanf("%f", &a);
   printf("enter the b value ");
   scanf("%f", &b);
       switch(k)
     {
        case '+':
        printf("The addition is performed");
        printf("%f", a+b);
        break;


        case '-':
        printf("The subtraction is performed");
        printf("%f", a-b);
        break;


        case '*':
        printf("The multiplication is performed");
        printf("%f", a*b);
        break;


        case '/':
        printf("The division is performed");
        printf("%f", a/b);
        break;
     }

    }
    printf("Enter one of the following: + or - or * or / \n");
     //scanf(" %c", &k);
   }


