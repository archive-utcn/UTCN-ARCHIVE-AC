#include <stdio.h>
#include <stdlib.h>

/*int digit(char);*/

int numbers(int v[100])
{
    int i;
    if (v[i]-(int)v[i] == 0) // we check if the number read from the input is an integer
        return 1;
    else return 0;
}



int main()
{
    int v[100];
    int i,n;
    scanf("%d",&n);
    //the functon for the roman numbers dind't work so well, so I used /* for it
    /*char romanumber[1000];long int number =0;
    int l=0
      printf("Roman numbers:  \n");
      scanf("%s",romanumber);
    while(romannumber[i]){

         if(digit(romanumber[l]) < 0){
             printf("Invalid roman digit : %c",romannumber[l]);
             return 0;
         }

         if((strlen(romanumber) -l) > 2){
             if(digit(romannumber[l]) < digit(romanumber[l+2])){
                 printf("Invalid roman number");
                 return 0;
             }
         }

         if(digit(romanumber[l]) >= digit(romanumber[l+1]))
             number = number + digit(romanumber[l]);
         else{
             number = number + (digit(romanumber[l+1]) - digit(romanumber[l]));
             i++;
         }
         l++;
    }
    printf("Its decimal value is : %ld",number);*/
    for(i=0; i<n; i++)
    {
        scanf("%d", &v[i]);
    }
    printf("Integer numbers:");
    for(i=0; i<n; i++)
    {
        if( (numbers(v[i])) == 1)
            printf("%d \n",v[i]); // we print the integer numbers
    }
    return 0;
}
