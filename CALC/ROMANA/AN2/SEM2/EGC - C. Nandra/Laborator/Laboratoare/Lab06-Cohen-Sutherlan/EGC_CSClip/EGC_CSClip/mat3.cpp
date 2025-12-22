#pragma once
#include <algorithm>
#include <iostream>
#include "vec3.h"
#include "mat3.h"
#include <math.h>

namespace egc
{
	float& mat3::at(int i, int j)
	{
		return this->matrixData[3 * j + i];
	}

	const float& mat3::at(int i, int j) const {
		return this->matrixData[3 * j + i];
	}

	mat3& mat3::operator =(const mat3& srcMatrix)
	{
		for (int i = 0; i < 9; i++)
		{
			this->matrixData[i] = srcMatrix.matrixData[i];
		}
		return *this;
	}

	mat3 mat3::operator *(float scalarValue) const
	{
		mat3 aux;
		for (int i = 0; i < 3; i++)
		{
			for (int j = 0; j < 3; j++)
			{
				aux.at(i, j) = scalarValue*this->at(i, j);
			}
		}
		return aux;
	}

	mat3 mat3::operator *(const mat3& srcMatrix) const
	{
		mat3 aux;
		float s;
		for (int i = 0; i < 9; i++) {
			s = 0;
			for (int j = 0; j < 3; j++)
				s += this->at(i % 3, j)*srcMatrix.at(j, i / 3);
			aux.matrixData[i] = s;
		}
		return aux;
	}

	vec3 mat3::operator *(const vec3& srcVector) const
	{
		vec3 v;
		float vec[3];
		for (int i = 0; i < 3; i++)
			vec[i] = this->matrixData[i] * srcVector.x + this->matrixData[i + 3] * srcVector.y + this->matrixData[i + 6] * srcVector.z;
		v.x = vec[0];
		v.y = vec[1];
		v.z = vec[2];
		return v;
	}

}