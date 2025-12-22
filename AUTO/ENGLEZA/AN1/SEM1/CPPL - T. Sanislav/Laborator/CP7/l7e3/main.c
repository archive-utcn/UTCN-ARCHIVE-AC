#include <stdio.h>
#include <stdlib.h>
//a
struct part {
int part_number;
char part_name[25];
};

/* typedef struct part{
int part_number;
} Part ; //synonym
*/
//b
typedef struct part Part; //synonym

int main()
{
   //c
   Part a, b[10], *ptr; // daca nu aveam typedef, puteam folosi struct part a, b[10] *ptr;

   printf("Read a part number and a part name.");
   //d
   scanf("%d%s", &a.part_number, a.part_name);
   //e
   b[2] = a;
   //f
   ptr = b; //b is array
   //g
   printf("%d %s", (ptr+2)->part_number, (ptr+2)->part_name);

   return 0;
}
