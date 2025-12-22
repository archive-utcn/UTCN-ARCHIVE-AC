// Skeleton implementation of problem 2 of Lab. 3
#include <stdio.h>
#include <stdlib.h>
#undef __STRICT_ANSI__
#include <math.h>

// Constants used to determine the nature of the polygon

// for EDGES
// all edges equal
#define E_ALL_EQ (1)
// edges pairwise equal
#define E_PAIR_EQ (1 << 1)

// for ANGLES
// all angles equal
#define A_ALL_EQ (1 << 2)
// angles pairwise equal
#define A_PAIR_EQ (1 << 3)
// adjacent angles equal
#define A_ADJ_EQ (1 << 4)
// two adjacent angles are 90 degrees
#define A_ADJ_90 (1 << 5)
// two adjacent angles sum up to 180 degrees
#define A_ADJ_180 (1 << 6)
// one interior angle greater than 180 degress
#define A_GT_180 (1 << 7)

#define SQUARE (E_ALL_EQ | E_PAIR_EQ | A_ALL_EQ | A_PAIR_EQ | A_ADJ_EQ | A_ADJ_90 | A_ADJ_180)
#define RECTANGLE (E_PAIR_EQ | A_ALL_EQ | A_PAIR_EQ | A_ADJ_EQ | A_ADJ_90 | A_ADJ_180)
#define DIAMOND (E_ALL_EQ | E_PAIR_EQ | A_PAIR_EQ)
#define PARALELOGRAM (E_PAIR_EQ | A_PAIR_EQ | A_ADJ_180)
#define TRAPEZE (A_ADJ_180)
#define TRAPEZE_RECT (A_ADJ_180 | A_ADJ_90)
#define TRAPEZE_ISOS (A_ADJ_180 | A_ADJ_EQ)
#define CONCAVE (A_GT_180)
/***********************************************************
* FUNCTION NAME: doEdges
*
* DESCRIPTION:  determines useful info on the relationships netwen the edges
*               of the 4-edge polygon whose vertices are given as args, i.e.
*               whether they are all equal or pairwise equal
*
* ARGUMENT LIST:
* Argument        Type   IO      Description
* ------------- -------- -- --------------------------------
* double        x[4]     I  x coordinates of polygon vertices
* double        y[4]     I  y coordinates of polygon vertices
* RETURN VALUE: int       nature of polygon, formed using the
*                         constants starting with E_ (see defines)
*
* CHANGES: -
*************************************************************/
int doEdges(const double x[4], const double y[4])
{
    int nature = 0; // return value
    double lengths[4];
    // TODO: calculate the lengths of polygon edges
    printf("Edges:\n");
    for (int i = 0; i < 4; i++)
    {
        double xDiff = x[(i + 1)% 4] - x[i];
        double yDiff = y[(i + 1)% 4] - y[i];
        lengths[i] = sqrt( xDiff * xDiff + yDiff * yDiff);
        printf("%f ", lengths[i]);
    }
    // check if lengths are pairwise equal
    if (lengths[0] == lengths[2] && lengths[1] == lengths[3])
    {
        nature |= E_PAIR_EQ; // set edges pairwise equal
        if (lengths[0] == lengths[1])
            nature |= E_ALL_EQ; // set edges pairwise equal
    }
    return nature;
}
/***********************************************************
* FUNCTION NAME: calcAngle
*
* DESCRIPTION:
*
* ARGUMENT LIST:
* Argument        Type   IO      Description
* ------------- -------- -- --------------------------------
* const double  x0        I  first x coordinate segment 1
* const double  y0        I  first y coordinate segment 1
* const double  x1
* const double  y1
* const double  x2
* const double  y2
*
* RETURN VALUE: double
*
* CHANGES:
*************************************************************/
double calcAngle(const double x0, const double y0, const double x1, const double y1,
                  const double x2, const double y2)
{
    return fabs(atan2(fabs(y1-y0), fabs(x1-x0)) + atan2(fabs(y2-y1), fabs(x2-x1)));
}
/***********************************************************
* FUNCTION NAME: doAngles
*
* DESCRIPTION:  determines useful info on the relationships netwen the angles
*               of the 4-edge polygon whose vertices are given as args, i.e.
*               whether they are all equal or pairwise equal
*
* ARGUMENT LIST:
* Argument        Type   IO      Description
* ------------- -------- -- --------------------------------
* double        x[4]     I  x coordinates of polygon vertices
* double        y[4]     I  y coordinates of polygon vertices
* RETURN VALUE: int       nature of polygon, formed using the
*                         constants starting with A_ (see defines)
*
* CHANGES: -
*************************************************************/
int doAngles(const double x[4], const double y[4])
{
    int nature = 0; // return value
    double angles[4];
    // TODO calculate angles
    printf("Angles:\n");
    for (int i = 0; i < 4; i++)
    {
        angles[i] = calcAngle(x[i], y[i], x[(i+1) % 4], y[(i+1) % 4], x[(i+2) % 4], y[(i+2) % 4]);
        printf("%f ", angles[i]);
    }
    for (int i = 0; i < 4; i++)
    {
        if (angles[i] == M_PI)
        {
            printf("Not a quadrilateral. Two edges are collinear");
            return 0;
        }
        if (angles[i] > M_PI)
            return A_GT_180;
        if (angles[i] == M_PI / 2.0 && angles[(i+1) % 4] == angles[i])
            nature |= A_ADJ_90 | A_ADJ_180;
        if (angles[i] == angles[(i+1) % 4])
            nature |= A_ADJ_EQ;
        if (angles[i] + angles[(i+1) % 4] == M_PI)
            nature |= A_ADJ_180;
    }
    // check if angles are pairwise equal
    if (angles[0] == angles[2] && angles[1] == angles[3])
    {
        nature |= A_PAIR_EQ; // set angles pairwise equal
        if (angles[0] == angles[1])
            nature |= A_ALL_EQ; // set angles pairwise equal
    }
    // TODO set return value
    return nature;
}

int main()
{
    double x[4], y[4];
    int nature = 0;

    // read the coordinate values
    for (int i = 0; i < sizeof(x)/sizeof(x[0]); i++)
    {
        printf("x[%d]=", i);
        if (1 != scanf("%lf", &x[i]))
        {
            printf("Bad value for x coordinate\n. Restart program, please\n");
            return 1;
        }
        printf("y[%d]=", i);
        if (1 != scanf("%lf", &y[i]))
        {
            printf("Bad value for y coordinate\n. Restart program, please\n");
            return 1;
        }
    }
    // Compute lengths of edges and determine useful relationships for edges
    nature |= doEdges(x, y);
    // Compute values of interior angles and determine useful relationships for interior angles
    nature |= doAngles(x, y);

    printf("The given quadrilateral is a ");
    if (nature & A_GT_180)
        printf("concave polygon\n");
    else
    switch(nature)
    {
        case SQUARE:
            printf("square\n");
            break;
        // TODO rest of classification
        case RECTANGLE:
            printf("rectangle\n");
            break;
        case DIAMOND:
            printf("diamond\n");
        case PARALELOGRAM:
            printf("paralelogram\n");
            break;
        case TRAPEZE:
            printf("trapeze\n");
            break;
        case TRAPEZE_RECT:
            printf("rectangular trapeze\n");
            break;
        case TRAPEZE_ISOS:
            printf("isosceles trapeze\n");
            break;
        default:
            printf("irregular polygon\n");
    }
    return 0;
}
