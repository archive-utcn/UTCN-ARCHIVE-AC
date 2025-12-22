#include <stdio.h>
#include <stdlib.h>
union number {
 int x;
 double y;
 } value;

int main(void)
{
    value.x = 100;
    printf("%s\n%s %d\n%s %f\n", "Put a value in the integer number and print both members.", "int:", value.x, "double:", value.y);
    value.y = 100.0;
    printf("\n%s\n%s %d\n%s %f\n", "Put a value in the floating member and print both members.", "int: ", value.x, "double:", value.y);
    return 0;
}
