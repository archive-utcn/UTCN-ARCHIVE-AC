/* +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
Turtulea Alexandra Georgina
Write a program to ask for your first and last names and reports the total number of
letters in them. Use pointer to structure and functions (i.e. get_info(), make_info(),
show_info()).
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+- */

#include <stdio.h>
#include <stdlib.h>

struct student{
    char fam_name[20];
    char last_name[20];
    int num_letters;

};

void get_info(struct student *pointer){

   printf("Enter your family name: ");
   scanf("%s", pointer->fam_name); //reads the family name

   printf("Enter your last name: ");
   scanf("%s", pointer->last_name); //reads the last name

   }

void make_info ( struct student *pointer) {
     pointer->num_letters = strlen(pointer->fam_name) + strlen(pointer->last_name); //give num_letters the value of the length of fam_name + last_name
}
void show_info( struct student *pointer){
  printf("Your family name is: %s, Your last name is: %s.\n You have %d letters in your name.", pointer->fam_name, pointer->last_name, pointer->num_letters);
}

int main ()
{

struct student ans;

get_info(&ans);
make_info(&ans);
show_info(&ans);

return 0;

}
