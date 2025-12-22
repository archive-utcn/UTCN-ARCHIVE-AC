#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

int main()
{
    double angle_in_degrees,angle_in_radians,sine,cosine,tangent;
    scanf("%lf",&angle_in_degrees);
    angle_in_radians=(M_PI/180.0)*angle_in_degrees;
    sine=sin(angle_in_radians);
    cosine=cos(angle_in_radians);
    tangent=tan(angle_in_radians);
    printf("sine=%f cosine=%f tangent=%f",sine,cosine,tangent);

    return 0;
}
