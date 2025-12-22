#include <iostream>
#include "transform.h"
#include <cmath>

namespace egc
{
	mat4 scale(float sx, float sy, float sz)
	{
		mat4 mat;

		mat.at(0, 0) = sx;
		mat.at(1, 1) = sy;
		mat.at(2, 2) = sz;

		return mat;
	}
	

	mat4 rotateY(float angle)
	{
		float ang = (angle*PI) / 180;

		mat4 mat;

		mat.at(0, 0) = cos(ang);
		mat.at(2, 0) = -sin(ang);
		mat.at(0, 2) = sin(ang);
		mat.at(2, 2) = cos(ang);

		return mat;
	}

}
