#include "include/SDL.h"
#include <vector>
#include "vec2.h"

using namespace egc;

//Return the value of P(t), where t is in [0,1]
vec2 getParametricPoint(float t, vec2 p0, vec2 p1);


//Paint the pixels that are on the line P0P1
void drawParametricLinePoints(vec2 p0, vec2 p1, SDL_Renderer* renderer);


//Return the value of B(t), where t is in [0,1]. The value of B(t) is computed by taking into account all the 
//controll points contained within the input vector
vec2 getBezierPoint(std::vector<vec2> controlPoints, float t);


//Paint the pixels that are on the Bezier curve defined by the given control points
void drawBezierPoints(std::vector<vec2> controlPoints, SDL_Renderer* renderer);

