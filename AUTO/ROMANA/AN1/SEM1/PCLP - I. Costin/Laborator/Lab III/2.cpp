#include <stdio.h>
#include <conio.h>
#include <math.h>

struct point {
 double x, y;
} P[4];

double abs ( double a ) { return a > 0 ? a : -a; }

double Area (point A, point B, point C)
{
    return abs (A.x*B.y + B.x*C.y + C.x*A.y - A.y*B.x - B.y*C.x - C.y*A.x);   
}
int IsInside (point A, point B, point C, point D)
{
    return (Area(A,B,C) == Area(A,B,D) + Area(B,C,D) + Area(A,C,D));
}
double Slope (point A, point B)
{   
    return (B.y - A.y)/(B.x - A.x);
}
double Dist (point A, point B)
{
  return sqrt((A.x-B.x)*(A.x-B.x) + (A.y-B.y)*(A.y-B.y));
}


int main ()
{
    //we read the coordinates of the 4 vertices
    printf("\n Please input the coordonates of the first vertex : \n");
    printf("\n Please input the abcise: \n");
    scanf("%lf",&P[0].x);
    printf("\n Please input the ordonate: \n");
    scanf("%lf",&P[0].y);
    
    printf("\n Please input the coordonates of the second vertex : \n");
    printf("\n Please input the abcise: \n");
    scanf("%lf",&P[1].x);
    printf("\n Please input the ordonate: \n");
    scanf("%lf",&P[1].y);
    
    printf("\n Please input the coordonates of the third vertex : \n");
    printf("\n Please input the abcise: \n");
    scanf("%lf",&P[2].x);
    printf("\n Please input the ordonate: \n");
    scanf("%lf",&P[2].y);
    
    printf("\n Please input the coordonates of the fourth vertex : \n");
    printf("\n Please input the abcise: \n");
    scanf("%lf",&P[3].x);
    printf("\n Please input the ordonate: \n");
    scanf("%lf",&P[3].y);
     
    
    //concave or convexe ?
    if (IsInside(P[0],P[1],P[2],P[3]) || IsInside(P[1],P[2],P[3],P[0]) || IsInside(P[0],P[2],P[3],P[1]) || IsInside(P[0],P[1],P[3],P[2]))
    {
       printf("It is concave");
       getch();
       return 0;
    }
    else
    {
        if ( ((P[0].x==P[1].x && P[3].x==P[2].x)||Slope(P[0],P[1])==Slope(P[2],P[3])) && 
             ((P[1].x==P[2].x && P[0].x==P[3].x)||Slope(P[1],P[2])==Slope(P[3],P[0])) )
             {
               //paralelogram
               if (Dist(P[0],P[1]) == Dist(P[1],P[2]) && Dist(P[2],P[3]) == Dist(P[3],P[0]))
               {
                  //rombus
                  if (Dist(P[0],P[1]) == Dist(P[3],P[0]))
                     printf("We have a square\n");
                  else
                     printf("We have a rombus\n");
               }
               if (Area(P[0],P[1],P[2]) + Area(P[2],P[3],P[0]) == Dist(P[0],P[1])*Dist(P[1],P[2]))
                 printf("We have a rectangle\n");
             }
        else if ( ((P[0].x==P[1].x && P[3].x==P[2].x)||Slope(P[0],P[1])==Slope(P[2],P[3])) ||
             ((P[1].x==P[2].x && P[0].x==P[3].x)||Slope(P[1],P[2])==Slope(P[3],P[0])) )
             {
               //trapez
               printf("Two sides are parallel\n");
             }
        else
        {
            //oarecare
            printf("We have a random convex polygon\n");
        }
        
    }
       
    
   getch();
    
    
    return 0;
}
