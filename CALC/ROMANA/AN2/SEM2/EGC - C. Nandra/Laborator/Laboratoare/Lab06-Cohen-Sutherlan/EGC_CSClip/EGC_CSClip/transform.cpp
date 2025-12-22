#include <iostream>
#include "transform.h"
#include <cmath>

namespace egc
{

	mat3 translate(const vec2 translateArray)
	{
		mat3 mat;
		mat.at(0, 2) = translateArray.x;
		mat.at(1, 2) = translateArray.y;

		return mat;
	}

	mat3 translate(float tx, float ty)
	{

		mat3 mat;
		mat.at(0, 2) = tx;
		mat.at(1, 2) = ty;

		return mat;
	}

	mat3 scale(const vec2 scaleArray)
	{
		mat3 mat;
		mat.at(0, 0) = scaleArray.x;
		mat.at(1, 1) = scaleArray.y;

		return mat;
	}

	mat3 scale(float sx, float sy)
	{
		mat3 mat;
		mat.at(0, 0) = sx;
		mat.at(1, 1) = sy;

		return mat;
	}

	mat3 rotate(float angle)
	{

		mat3 mat;
		mat.at(0, 0) = cos((angle*PI) / 180);
		mat.at(0, 1) = -sin((angle*PI) / 180);
		mat.at(1, 0) = sin((angle*PI) / 180);
		mat.at(1, 1) = cos((angle*PI) / 180);

		return mat;
	}

	mat4 translate(const vec3 translateArray)
	{
		mat4 mat;
		mat.at(0, 3) = translateArray.x;
		mat.at(1, 3) = translateArray.y;
		mat.at(2, 3) = translateArray.z;

		return mat;
	}

	mat4 translate(float tx, float ty, float tz)
	{
		mat4 mat;
		mat.at(0, 3) = tx;
		mat.at(1, 3) = ty;
		mat.at(2, 3) = tz;

		return mat;
	}

	mat4 scale(const vec3 scaleArray)
	{
		mat4 mat;

		mat.at(0, 0) = scaleArray.x;
		mat.at(1, 1) = scaleArray.y;
		mat.at(2, 2) = scaleArray.z;

		return mat;
	}

	mat4 scale(float sx, float sy, float sz)
	{
		mat4 mat;

		mat.at(0, 0) = sx;
		mat.at(1, 1) = sy;
		mat.at(2, 2) = sz;

		return mat;
	}

	mat4 rotateX(float angle)
	{

		float ang = (angle*PI) / 180;

		mat4 mat;

		mat.at(1, 1) = cos(ang);
		mat.at(1, 2) = -sin(ang);
		mat.at(2, 1) = sin(ang);
		mat.at(2, 2) = cos(ang);

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

	mat4 rotateZ(float angle)
	{
		float ang = (angle*PI) / 180;

		mat4 mat;
		mat.at(0, 0) = cos(ang);
		mat.at(0, 1) = -sin(ang);
		mat.at(1, 0) = sin(ang);
		mat.at(1, 1) = cos(ang);

		return mat;
	}

}
