#include "include/SDL.h"

typedef struct _Bline
{
	int startX;
	int startY;
	int endX;
	int endY;
} BresenhamLine;

typedef struct _Bcircle
{
	int centerX;
	int centerY;
	int radius;
} BresenhamCircle;

//Detects in which octant a line is situated
int getOctant(BresenhamLine line);

//Draws a new raster line using Bresenham's algorithm
void BresenhamDraw(BresenhamLine line, SDL_Renderer* renderer);

//Draws a new raster circle using Bresenham's algorithm
void BresenhamDraw(BresenhamCircle circle, SDL_Renderer* renderer);