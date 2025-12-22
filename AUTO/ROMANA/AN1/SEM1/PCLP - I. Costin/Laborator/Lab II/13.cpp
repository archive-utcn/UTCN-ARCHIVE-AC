#include <stdio.h>
#include <conio.h>

int main()
{
    int x1,y1,x2,y2,x3,y3,x,y;
    int min_x,max_y,max_x,min_y;
    int ok;
    
    printf("\n Please input the value of x1\n");//*we read the coordinates of 3 points which form a triangle
    scanf("%5d",&x1);
    printf("\n Please input the value of y1\n");
    scanf("%5d",&y1);
    printf("\n Please input the value of x2\n");
    scanf("%5d",&x2);
    printf("\n Please input the value of y2 \n");
    scanf("%5d",&y2);
    printf("\n Please input the value of x3\n");
    scanf("%5d",&x3);
    printf("\n Please input the value of y3\n");
    scanf("%5d",&y3);
    printf("\n Please input the value of x\n");//*we read the coordinates of a point which we want to establish its position raporting to the triangle
    scanf("%5d",&x);
    printf("\n Please input the value of y\n");
    scanf("%5d",&y);
    
    min_x=x1;//*we calculate the minimum from the abcises of the 3 point of the triangle
    if (min_x>x2)
       min_x=x2;
       else
           if (min_x>x3)
              min_x=x3;
     
     max_x=x1;//*we calculate the maximum from the abcises of the 3 point of the triangle
     if (max_x<x2)
       max_x=x2;
       else
           if (max_x<x3)
              max_x=x3;
     
     min_y=y1;//*we calculate the minimum from the ordonates of the 3 point of the triangle
     if (min_y>y2)
       min_y=y2;
       else
           if (min_y>y3)
              min_y=y3;
     
     max_y=y1;//*we calculate the maximum from the ordonates of the 3 point of the triangle
    if (max_y<y2)
       max_y=y2;
       else
           if (max_y<y3)
              min_y=y3;

     ok=1;//*we consider that the point is in the interior of the triangle 
     if (x>max_x)//*respecting this condition, the point is at right
        {
        printf("\n The point is at right \n");
        ok=0;//*so, the point is not in the interior of the triangle
        }    
     if (x<min_x)//*respecting this condition, the point is at left
        {
        printf("\n The point is at left \n");
        ok=0;//*so, the point is not in the interior of the triangle
        }   
     if (y>max_y)//*respecting this condition, the point is above
        {
        printf("\n The point is above\n");
        ok=0;//*so, the point is not in the interior of the triangle
        }    
     if (y<min_y)//*respecting this condition, the point is below
        {
        printf("\n The point is below \n");
        ok=0;//*so, the point is not in the interior of the triangle
        }
     if (ok==1)//*like we suppose at begining, when ok==1 then the point is in the interior of the triangle
        printf("\n The point is in the interior of the triangle \n");
     getch();
}
