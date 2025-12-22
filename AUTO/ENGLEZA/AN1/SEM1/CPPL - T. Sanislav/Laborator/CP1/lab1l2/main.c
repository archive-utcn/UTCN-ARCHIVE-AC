#include <stdio.h>
#include <stdlib.h>

int main()
{
    int integer_no = 45678;
    float float_no = 456.789f;

    printf("45678 right justified to 6 columns: %6d\n", integer_no);
    printf("456.789 rounded to 2 digits: %.2f\n", float_no);
    printf("456.789 rounded to 0 digits: %.f\n", float_no);
    printf("456.789 rounded in exponential form: %e\n", float_no);
    printf("456.789 right justified to 8 columns and rounded to 2 digits: %8.2f\n", float_no);

    return 0;

}
