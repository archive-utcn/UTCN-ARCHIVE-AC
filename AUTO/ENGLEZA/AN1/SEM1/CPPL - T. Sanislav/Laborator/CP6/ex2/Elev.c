#include "elev.h"

float average(int a, int b, int c, int d, int e)
{
    float avg = 0.0f;
    avg = (a + b + c + d + e) / 5.00;
    return avg;
}

int attendance(int att)

{
    int stop=0;
    if (att  < 5)
        {
            printf("This student will not enter the exams \n");
            stop=1;

        }
    return stop;
}

int pass(int p1, int p2, int p3, int p4, int p5)

{

    if ((p1 && p2 && p3 && p4 && p5) >= 5)
    {
        printf("This student has not passed on at least one subject \n");
    }
    else
    {
        printf("This student has passed all exams. \n");
    }
    return 0;
}
