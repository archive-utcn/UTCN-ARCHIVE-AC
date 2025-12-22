#include <stdio.h>
#include <stdlib.h>

int main()
{

    float pi = 3.14159265;
    printf("Pi rounded to 3 digits: %.3f\n", pi);
    printf("Pi rounded to 0 digits: %.f\n", pi);
    printf("Pi rounded in exponential form: %e\n", pi);
    printf("Pi right justified to 8 columns and rounded to 2 digits: %8.2f\n", pi);

    return 0;


}
