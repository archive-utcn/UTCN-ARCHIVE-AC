#include <stdio.h>
#define MAX_SIZE 100
int main()
 {

    float numbers[MAX_SIZE] = {0}, average = 0.0f, sum = 0.0f;
    int i = 0, no_numbers = 0;

    printf("Compute the arithmetic average value of n (<%d) real numbers.\n", MAX_SIZE);
    printf("Input the number of real numbers,n=");
    scanf("%d", &no_numbers);
    if  (no_numbers > 0 && no_numbers <= MAX_SIZE)
     {
      printf("Input the real numbers:\n");
      for(i = 0, sum = 0; i < no_numbers; i++)
       {
        printf("numbers[%3d]= ", i+1);
        scanf("%f", &numbers[i]);
        sum += numbers[i];
}
        average = sum / no_numbers;
        printf ("\nAVERAGE=%.2f\n", average);
}
    else
     {
     printf ("The number of real numbers is invalid.");
     }
    return 0;
}
