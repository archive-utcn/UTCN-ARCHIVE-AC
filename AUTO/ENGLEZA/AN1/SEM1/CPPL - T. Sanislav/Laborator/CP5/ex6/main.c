#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MARIME 10
//#define SIZE 10 //define the maximum SIZE of the string as 10
// varianta comentata e gresita
/*
int min(int str[SIZE], int len)
{
    int a = str[0];
    int i = 0;
    for (i = 1; i<len; i++){
        if (str[i] < a){
            a = str[i];
        }
    }
    return a;

}

int max(int str[SIZE], int len)
{

    int a=0;
    int i=0;
    for (i = 0;i<len;i++){
        if (str[i]>a){
            a=str[i];
        }
    }
    return a;
}

int main()
{
    int string[SIZE];
    printf("Input the desired string: ");
    gets(string);
    printf("The minimum element is: ");
    printf("%d", min(string, SIZE));
    printf("The maximum element is: ");
    printf("%d", max(string, SIZE));
    return 0;
}

*/

int main () {
    int array[MARIME], i;
    for (i = 0; i < MARIME; i++)
        scanf("%d",&array[i]);

    printf("minimum = %d\n",min(MARIME, array));
    printf("maximum = %d\n",max(MARIME, array));
}

int min(int len, int array[len]) {
    int minimum = array[0], i;
    for (i = 0; i < len; i++)
    if (array[i] < minimum) minimum = array [i];
    return minimum;
}
int max(int len, int array[len]) {
    int maxim = 0, i;
    for (i = 0; i < len; i++)
    if (array[i] > maxim) maxim = array [i];
    return maxim;
}




