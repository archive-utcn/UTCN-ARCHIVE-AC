#include <stdio.h>
#include <stdlib.h>

void print_int(int x)
{
    printf("%d\n", x);
}

int main()
{
    void (*f_ptr)(int) = &print_int;

   // f_ptr = &print_int;

    f_ptr(2);
    (*f_ptr)(2);
    return 0;
}
