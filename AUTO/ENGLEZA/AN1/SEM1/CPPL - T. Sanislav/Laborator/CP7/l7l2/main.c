#include <stdio.h>
#include <stdlib.h>

struct stock {
char code[3]; //4 - multiplii de 4
char name[30]; // 32 - multiplii de 4
int quantity; //4
float price; // 4
};

void insert_products(int, struct stock*);
void display_products(int, struct stock*);


int main()
{
 struct stock *ptr; //va lua adresa primului element
 int number = 0;

 printf("Enter the number of products :");
 scanf("%d", &number );

 ptr = (struct stock *) malloc (number * sizeof(struct stock)); //aloca memorie pentru n*44 biti
 insert_products(number, ptr);

 printf("Display the products with quantity > 0 : \n");
 display_products(number, ptr);

 printf("%d", sizeof(struct stock)); //de ce e 44 si nu 41?
 //printf("%d", sizeof(float));

 free(ptr);

 return 0;
}

void insert_products(int number, struct stock *st) {
int i = 0;
for(i = 0; i < number; i++)
    {
        printf("Enter code, name, quantity, price of the %d product :\n", i+1);
        scanf("%s%s%d%f", (st +i)-> code, (st +i)-> name, &(st +i)-> quantity, &(st +i)-> price); //nu am ampersant la %s
    }

}              //model de printf din listing 1 ("%d; %s; %s \n", bk_ptr->book_id, bk_ptr->title, bk_ptr->author);
               //st+i pointer catre al i-lea produs

void display_products (int number, struct stock *st){
int i=0;
for(i=0; i < number; i++)
    { if ((st+i)-> quantity > 0)
        printf("%s\t%s\t%d\t%2.f\n" , (st+ i )-> code, (st+ i)-> name, (st+i)-> quantity , (st+i)-> price);
    }

}
