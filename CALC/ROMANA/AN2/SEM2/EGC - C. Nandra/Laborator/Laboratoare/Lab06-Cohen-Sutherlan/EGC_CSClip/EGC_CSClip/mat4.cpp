#pragma once
#include <algorithm>
#include <iostream>
#include "vec3.h"
#include "mat3.h"
#include "mat4.h"
#include "vec4.h"
#include <math.h>

namespace egc
{
	float& mat4::at(int i, int j)
	{
		return this->matrixData[4 * j + i];
	}

	const float& mat4::at(int i, int j) const {
		return this->matrixData[4 * j + i];
	}

	mat4& mat4::operator =(const mat4& srcMatrix)
	{
		for (int i = 0; i < 16; i++)
		{
			this->matrixData[i] = srcMatrix.matrixData[i];
		}
		return *this;
	}

	mat4 mat4::operator *(float scalarValue) const
	{
		mat4 aux;
		for (int i = 0; i < 4; i++)
		{
			for (int j = 0; j < 4; j++)
			{
				aux.at(i, j) = scalarValue * this->at(i, j);
			}
		}
		return aux;
	}

	mat4 mat4::operator *(const mat4& srcMatrix) const
	{
		mat4 aux;
		float s;
		for (int i = 0; i < 16; i++) {
			s = 0;
			for (int j = 0; j < 4; j++)
				s+= this->at(i % 4, j)*srcMatrix.at(j, i / 4);
			aux.matrixData[i] = s;
		}
		return aux;
	}

	vec4 mat4::operator *(const vec4& srcVector) const
	{
		vec4 v;
		float vec[4];
		for (int i = 0; i < 4; i++)
			vec[i] = this->matrixData[i] * srcVector.x + this->matrixData[i + 4] * srcVector.y + this->matrixData[i + 8] * srcVector.z + this->matrixData[i + 12] * srcVector.w;
		v.x = vec[0];
		v.y = vec[1];
		v.z = vec[2];
		v.w = vec[3];
		return v;
	}

}