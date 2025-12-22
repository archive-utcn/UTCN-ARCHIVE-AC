#pragma once
#include "include/SDL.h"
#include "vec2.h"
#include "vec4.h"
#include <vector>


namespace egc {

	void computeAlphaBetaGamma(const std::vector<egc::vec4>& triangleVertices, vec2 pixel, float& alpha, float& beta, float& gamma);

	void rasterizeTriangle(SDL_Renderer *renderer, const std::vector<egc::vec4> &triangleVertices, const std::vector<egc::vec4> &triangleColors);

}

