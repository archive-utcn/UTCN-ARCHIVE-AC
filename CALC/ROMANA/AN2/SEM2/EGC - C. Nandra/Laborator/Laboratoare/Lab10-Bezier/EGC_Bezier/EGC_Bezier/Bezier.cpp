#include "Bezier.h"
#include "math.h"
#include <vector>

//Return the value of P(t), where t is in [0,1]
vec2 getParametricPoint(float t, vec2 p0, vec2 p1) {
	//P(t) = (1 - t)*P0 + t*P1
	vec2 point;
	point.x = (1 - t) * p0.x + t * p1.x;
	point.y = (1 - t) * p0.y + t * p1.y;
	return point;
}

//Paint the pixels that are on the line P0P1
void drawParametricLinePoints(vec2 p0, vec2 p1, SDL_Renderer* renderer) {
	//Hint: To paint a single pixel, you can use the function: SDL_RenderDrawPoint(renderer, x, y)
	for (float t = 0; t <= 1; t += 0.001f) {
		vec2 p = getParametricPoint(t, p0, p1);
		SDL_RenderDrawPoint(renderer, p.x, p.y);
	}
}

//Return the value of B(t), where t is in [0,1]. The value of B(t) is computed by taking into account all the 
//controll points contained within the input vecto
vec2 getBezierPoint(std::vector<vec2> controlPoints, float t) {
	vec2 point;
	if (controlPoints.size() == 2) {
		point = getParametricPoint(t, controlPoints[0], controlPoints[1]);
	}
	else {
		vec2 pn = controlPoints.at(controlPoints.size() - 1);
		controlPoints.pop_back();
		vec2 b0_n_1 = getBezierPoint(controlPoints, t);
		controlPoints.push_back(pn);
		controlPoints.erase(controlPoints.begin());
		vec2 b1_n = getBezierPoint(controlPoints, t);
		point = b0_n_1 * (1 - t) + b1_n * t;
	}
	return point;
}

//Paint the pixels that are on the Bezier curve defined by the given control points
void drawBezierPoints(std::vector<vec2> controlPoints, SDL_Renderer* renderer) {
	
	for (float t = 0; t <= 1; t += 0.001f) {
		vec2 bezier = getBezierPoint(controlPoints, t);
		SDL_RenderDrawPoint(renderer, bezier.x, bezier.y);
	}
	
	for (int i = 0; i < controlPoints.size() - 1; i++) {
		drawParametricLinePoints(controlPoints[i], controlPoints[i + 1], renderer);
	}
}
