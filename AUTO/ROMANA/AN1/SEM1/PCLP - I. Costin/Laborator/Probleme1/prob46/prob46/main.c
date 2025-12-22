#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int cmmppmmsecpt(int bubu)   //nota: cmmppmmsecpt = cel mai mare patrat perfect mai mic sau egal cu parametrul transmis
{
    bubu =   trunc(sqrt(bubu));
    bubu = bubu*bubu;
    return bubu;
}



int main()
{
    int papa;
    scanf("%d", &papa);
    printf("%d",cmmppmmsecpt(papa));
    return 0;
}
