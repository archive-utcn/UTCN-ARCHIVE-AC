#include <stdio.h>
#include <stdlib.h>

int main()
{
    int num = 45, *ptr = &num, **ptr2ptr = &ptr;
    void *intt = NULL;
    int *z_ptr;
    //    ptr = &num;
//    ptr2ptr = &ptr;
// *ptr imi da 45
    printf("%d %d %d", &ptr, ptr2ptr, **ptr2ptr);
    return 0;
}
