#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main()
{
    double angleDeg, angleRad;

    printf("angle[in degrees]=");
    scanf("%lf", &angleDeg);
    angleRad = angleDeg * M_PI/180.0;
    printf("sin(%f)=%f cos(%f)=%f tan(%f)=%f\n", angleDeg, sin(angleRad),
            angleDeg, cos(angleRad), angleDeg, tan(angleRad));
    return 0;
}
