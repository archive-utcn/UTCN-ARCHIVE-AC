#include "bresenham.h"
#include "math.h"

//Detects in which octant a line is situated
int getOctant(BresenhamLine line) {

	int deltaY = (line.endY - line.startY);
	int deltaX = (line.endX - line.startX);

	//Slope		
	float m = abs(deltaY) / (float)abs(deltaX);

	if ((m < 1) && (deltaX > 0) && (deltaY <= 0)) // first octant
		return 1;
	if ((m > 1) && (deltaX > 0) && (deltaY <= 0)) // second octant
		return 2;
	if ((m > 1) && (deltaX <= 0) && (deltaY <= 0)) // third octant
		return 3;
	if ((m < 1) && (deltaX <= 0) && (deltaY <= 0))
		return 4;
	if ((m < 1) && (deltaX <= 0) && (deltaY > 0)) 
		return 5;
	if ((m > 1) && (deltaX <= 0) && (deltaY > 0))
		return 6;
	if ((m > 1) && (deltaX > 0) && (deltaY > 0)) 
		return 7;
	if ((m < 1) && (deltaX > 0) && (deltaY > 0))
		return 8;

	return 0;
}

//Draws a new raster line using Bresenham's algorithm
void BresenhamDraw(BresenhamLine line, SDL_Renderer* renderer) {
	int tmpStartX = 0;
	int tmpStartY = 0;
	int tmpEndX = 0;
	int tmpEndY = 0;
	int tmpCurrentX = 0;
	int tmpCurrentY = 0;

	int dy = abs(line.endY - line.startY);
	int dx = abs(line.endX - line.startX);

	int d, inc1, inc2;

	int octant = getOctant(line);

	tmpStartX = tmpCurrentX = line.startX;
	tmpEndX = line.endX;
	tmpStartY = tmpCurrentY = line.startY;
	tmpEndY = line.endY;

	switch (octant)
	{
	case 1:

		d = 2 * dy - dx;
		inc1 = 2 * dy;
		inc2 = 2 * (dy - dx);

		while (tmpCurrentX < tmpEndX)
		{
			//Draw current point
			SDL_RenderDrawPoint(renderer, tmpCurrentX, tmpCurrentY);
			++tmpCurrentX;

			if (d < 0)
				d += inc1;
			else
			{
				d += inc2;
				--tmpCurrentY;
			}
		}
		break;
	case 2:
		d = 2 * dx - dy;
		inc1 = 2 * dx;
		inc2 = 2 * (dx - dy);

		while (tmpCurrentX < tmpEndX) {
			SDL_RenderDrawPoint(renderer, tmpCurrentX, tmpCurrentY);
			--tmpCurrentY;

			if (d < 0)
				d += inc1;
			else {
				d += inc2;
				++tmpCurrentX;
			}
		}
		break;
	case 3:
		d = 2 * dx - dy;
		inc1 = 2 * dx;
		inc2 = 2 * (dx - dy);

		while (tmpCurrentX > tmpEndX) {
			SDL_RenderDrawPoint(renderer, tmpCurrentX, tmpCurrentY);
			--tmpCurrentY;

			if (d < 0)
				d += inc1;
			else {
				d += inc2;
				--tmpCurrentX;
			}
		}
		break;
	case 4:
		d = 2 * dy - dx;
		inc1 = 2 * dy;
		inc2 = 2 * (dy - dx);

		while (tmpCurrentX > tmpEndX) {
			SDL_RenderDrawPoint(renderer, tmpCurrentX, tmpCurrentY);
			--tmpCurrentX;

			if (d < 0)
				d += inc1;
			else {
				d += inc2;
				--tmpCurrentY;
			}
		}
		break;
	case 5:
		d = 2 * dy - dx;
		inc1 = 2 * dy;
		inc2 = 2 * (dy - dx);

		while (tmpCurrentX > tmpEndX) {
			SDL_RenderDrawPoint(renderer, tmpCurrentX, tmpCurrentY);
			--tmpCurrentX;

			if (d < 0)
				d += inc1;
			else {
				d += inc2;
				++tmpCurrentY;
			}
		}
		break;
	case 6:
		d = 2 * dx - dy;
		inc1 = 2 * dx;
		inc2 = 2 * (dx - dy);

		while (tmpCurrentX > tmpEndX) {
			SDL_RenderDrawPoint(renderer, tmpCurrentX, tmpCurrentY);
			++tmpCurrentY;

			if (d < 0)
				d += inc1;
			else {
				d += inc2;
				--tmpCurrentX;
			}
		}
		break;
	case 7:
		d = 2 * dx - dy;
		inc1 = 2 * dx;
		inc2 = 2 * (dx - dy);

		while (tmpCurrentX < tmpEndX) {
			SDL_RenderDrawPoint(renderer, tmpCurrentX, tmpCurrentY);
			++tmpCurrentY;

			if (d < 0)
				d += inc1;
			else {
				d += inc2;
				++tmpCurrentX;
			}
		}
		break;
	case 8:
		d = 2 * dy - dx;
		inc1 = 2 * dy;
		inc2 = 2 * (dy - dx);

		while (tmpCurrentX < tmpEndX) {
			SDL_RenderDrawPoint(renderer, tmpCurrentX, tmpCurrentY);
			++tmpCurrentX;

			if (d < 0)
				d += inc1;
			else {
				d += inc2;
				++tmpCurrentY;
			}
		}
		break;

	default:
		break;
	}
}

void plotPoints(int x, int y, BresenhamCircle circle, SDL_Renderer* renderer) {
	SDL_RenderDrawPoint(renderer, circle.centerX + x, circle.centerY + y);
	SDL_RenderDrawPoint(renderer, circle.centerX + x, circle.centerY - y);
	SDL_RenderDrawPoint(renderer, circle.centerX - x, circle.centerY + y);
	SDL_RenderDrawPoint(renderer, circle.centerX - x, circle.centerY - y);
	SDL_RenderDrawPoint(renderer, circle.centerX + y, circle.centerY + x);
	SDL_RenderDrawPoint(renderer, circle.centerX - y, circle.centerY + x);
	SDL_RenderDrawPoint(renderer, circle.centerX + y, circle.centerY - x);
	SDL_RenderDrawPoint(renderer, circle.centerX - y, circle.centerY - x);
}

//Draws a new raster circle using Bresenham's algorithm
void BresenhamDraw(BresenhamCircle circle, SDL_Renderer* renderer) {
	int currentY = circle.radius;
	int d = 1 / 4 - circle.radius;
	
	for (int currentX = 0; currentX < ceil(circle.radius / sqrt(2)); currentX++) {
		plotPoints(currentX, currentY, circle, renderer);
		d += 2 * currentX + 1;

		if (d > 0) {
			d += 2 - 2 * currentY;
			--currentY;
		}
	}
}

