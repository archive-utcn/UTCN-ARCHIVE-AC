#include <stdio.h>
#include <stdlib.h>

void function1(int x)
{
    printf("You entered %d -- Function1 was called.\n",x);
}
void function2(int y)
{
    printf("You entered %d -- Function2 was called.\n",y);
}
void function3(int z)
{
    printf("You entered %d -- Function3 was called.\n",z);
}

int main()
{
    void(*f_ptr[3])(int) = {function1,function2,function3};
    int choice = 0;

    printf("Enter a number betweer 1 and 3,4 to end: ");
    scanf("%d", &choice);

    while (choice >=1 && choice <4)
    {
        (*f_ptr[choice-1])(choice);
        printf("Enter a number between 1 and 3, 4 to end: ");
        scanf("%d",&choice);
    }
    return 0;
}
