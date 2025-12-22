#include <stdio.h>
#include <stdlib.h>

#include "elev.h"

int main()
{
    int materia1 = 0;
    int materia2 = 0;
    int materia3 = 0;
    int materia4 = 0;
    int materia5 = 0;
    int prezente = 0;

     printf("Please input the number of attendance: \n");
    scanf("%d",&prezente);

    if (attendance(prezente) == 1)

    printf("Please input the grade of subject number 1: \n");
    scanf("%d",&materia1);

    printf("Please input the grade of subject number 2: \n");
    scanf("%d",&materia2);

    printf("Please input the grade of subject number 3: \n");
    scanf("%d",&materia3);

    printf("Please input the grade of subject number 4: \n");
    scanf("%d",&materia4);

    printf("Please input the grade of subject number 5: \n");
    scanf("%d",&materia5);





    pass(materia1,materia2,materia3,materia4,materia5);

    printf("The Average is : %.2f",average(materia1,materia2,materia3,materia4,materia5));

}
