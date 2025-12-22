/* Program L6Ex3.cpp */

#include <stdio.h>
#include <alloc.h>
#include <process.h>
#include <conio.h>

int main(void)
{
   char *str1,*str2;
   /* Allocate memory for the first character string */
   if ((str1=(char*)malloc(100))==NULL)
      {
         printf("\n Insufficient memory\n");
         exit(1);
      }
   printf("\n Input the first character string an press ENTER\n");
   gets(str1);
   printf("\n The string you supplied is \n %s \n",str1);
   /* Allocate memory for the second character string */
   if ((str2=(char*)calloc(100,sizeof(char)))==NULL)
      {
         printf("\n Insufficient memory\n");
         exit(2);
      }
   printf("\n Input the second character string an press ENTER \n");
   gets(str2);
   printf("\n The string you supplied is \n %s \n",str2);
   printf("\n Press a key \n");
   getch();
   /* Free allocated memory */
   free(str1);
   free(str2);
   getch();
}
