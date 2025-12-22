#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define M_PI 3.14159265358979323846264338327
int main()
{
    double angleDeg, angleRad, mins, deg, secs;

    printf("angle[in  radians]=");
    scanf("%lf", &angleRad);
    angleDeg=angleRad *180.0/M_PI;
    deg= (int) angleDeg;
    mins= (int)angleRad * 60;
    secs=angleRad / 60 * 3600;
    printf("%lf radians is &f degrees,%f minutes, %f seconds", angleRad, mins, secs);
    return 0;
}
