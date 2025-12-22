#include <stdio.h>
#include <stdlib.h>

int main()
{
    enum number {zero, one, two, three, four, five};
    enum number x, y;
    int z = 0, w = 0;

    x = two; // x ia valoarea lui two din enum, adica 2
    y = three; // y <- 3
    z = x + y; // z<-2+3=5
    w = x * y; // w<-2*3=6
    printf("z = %d w = %d\n", z, w);

    return 0;
}
