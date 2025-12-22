#include "rasterization.h"

namespace egc {

	float Fab(float x, float y, float ax, float ay, float bx, float by, float cx, float cy) {
		return (ay - by) * x + (bx - ax) * y + ax * by - bx * ay;
	}
	float Fbc(float x, float y, float ax, float ay, float bx, float by, float cx, float cy) {
		return (by - cy) * x + (cx - bx) * y + bx * cy - cx * by;
	}
	float Fca(float x, float y, float ax, float ay, float bx, float by, float cx, float cy) {
		return (cy - ay) * x + (ax - cx) * y + cx * ay - ax * cy;
	}

	void computeAlphaBetaGamma(const std::vector<egc::vec4>& triangleVertices, vec2 pixel, float& alpha, float& beta, float& gamma) 
	{
		//TO DO - Compute alfa, beta and gamma => we use the function's input parameters as the return mechanism
		//Store the final results in the input parameters
		alpha = Fbc(pixel.x, pixel.y, triangleVertices.at(0).x, triangleVertices.at(0).y, triangleVertices.at(1).x, triangleVertices.at(1).y, triangleVertices.at(2).x, triangleVertices.at(2).y)
			/ Fbc(triangleVertices.at(0).x, triangleVertices.at(0).y, triangleVertices.at(0).x, triangleVertices.at(0).y, triangleVertices.at(1).x, triangleVertices.at(1).y, triangleVertices.at(2).x, triangleVertices.at(2).y);
		beta = Fca(pixel.x, pixel.y, triangleVertices.at(0).x, triangleVertices.at(0).y, triangleVertices.at(1).x, triangleVertices.at(1).y, triangleVertices.at(2).x, triangleVertices.at(2).y)
			/ Fca(triangleVertices.at(1).x, triangleVertices.at(1).y, triangleVertices.at(0).x, triangleVertices.at(0).y, triangleVertices.at(1).x, triangleVertices.at(1).y, triangleVertices.at(2).x, triangleVertices.at(2).y);
		gamma = 1 - alpha - beta;
	}

	float minimum(float x, float y, float z) {
		return std::min(x, std::min(y, z));
	}

	float maximum(float x, float y, float z) {
		return std::max(x, std::max(y, z));
	}

	void rasterizeTriangle(SDL_Renderer *renderer, const std::vector<egc::vec4> &triangleVertices, const std::vector<egc::vec4> &triangleColors) {
		//TO DO - Implement the triangle rasterization algorithm
		float x_min = minimum(triangleVertices.at(0).x, triangleVertices.at(1).x, triangleVertices.at(2).x);
		float x_max = maximum(triangleVertices.at(0).x, triangleVertices.at(1).x, triangleVertices.at(2).x);
		float y_min = minimum(triangleVertices.at(0).y, triangleVertices.at(1).y, triangleVertices.at(2).y);
		float y_max = maximum(triangleVertices.at(0).y, triangleVertices.at(1).y, triangleVertices.at(2).y);

		for (float i = x_min; i <= x_max; i++) {
			for (float j = y_min; j <= y_max; j++) {
				float alpha, beta, gamma;
				computeAlphaBetaGamma(triangleVertices, vec2(i, j), alpha, beta, gamma);
				if (0.0f <= alpha && alpha <= 1.0f && 0.0f <= beta && beta <= 1.0f && 0.0f <= gamma && gamma <= 1.0f) {
					float red = triangleColors.at(0).x * alpha + triangleColors.at(1).x * beta + triangleColors.at(2).x * gamma;
					float green = triangleColors.at(0).y * alpha + triangleColors.at(1).y * beta + triangleColors.at(2).y * gamma;
					float blue = triangleColors.at(0).z * alpha + triangleColors.at(1).z * beta + triangleColors.at(2).z * gamma;
					SDL_SetRenderDrawColor(renderer, red, green, blue, 255); //RGB
					SDL_RenderDrawPoint(renderer, i, j);
				}
			}
		}

	}

}