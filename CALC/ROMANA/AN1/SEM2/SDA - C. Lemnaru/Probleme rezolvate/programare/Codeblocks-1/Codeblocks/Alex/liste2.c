#include<stdlib.h>
#include<stdio.h>

typedef struct list_el {
   int val;
   struct list_el *next;
}item;

item *curr, *head;

void main()
{
   int i;
   head = NULL;

   for(i=1;i<=10;i++) {
      curr = (item *)malloc(sizeof(item));
      printf("\n Introduceti numarul:");
      scanf("%d",curr->val);
   }

   curr = head;

   while(curr!=0) {
      printf("%d\n", curr->val);
      curr = curr->next ;
   }

}
