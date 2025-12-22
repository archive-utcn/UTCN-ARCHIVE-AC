#include <stdio.h>
#include "mat3.h"

namespace egc
{
	mat3& mat3::operator =(const mat3& srcMatrix)
	{
		for (int i = 0; i < 9; i++)
		{
			matrixData[i] = srcMatrix.matrixData[i];
		}
		return *this;
	}

	mat3  mat3::operator *(float scalarValue) const
	{
		mat3 m;
		for (int i = 0; i < 9; i++)
		{
			m.matrixData[i] = matrixData[i] * scalarValue;
		}

		return m;
	}

	mat3 mat3::operator *(const mat3& srcMatrix) const
	{
		mat3 m;
		for (int i = 0; i < 9; i++)
		{
			m.matrixData[i] = 0;
		}

		for (int i = 0; i < 3; i++)
		{
			for (int j = 0; j < 3; j++)
			{
				for (int k = 0; k < 3; k++)
				{
					m.at(i, j) += this->at(i, k) * srcMatrix.at(k, j);
				}
			}
		}
		return m;
	}

	vec3 mat3::operator *(const vec3& srcVector) const
	{
		vec3 v;
		float x = srcVector.x, y = srcVector.y, z = srcVector.z;
		v.x = this->at(0, 0) * x + this->at(0, 1) * y + this->at(0, 2) * z;
		v.y = this->at(1, 0) * x + this->at(1, 1) * y + this->at(1, 2) * z;
		v.z = this->at(2, 0) * x + this->at(2, 1) * y + this->at(2, 2) * z;
		return v;
	}

	mat3 mat3::operator +(const mat3& srcMatrix) const
	{
		mat3 m;
		for (int i = 0; i < 9; i++)
		{
			m.matrixData[i] = srcMatrix.matrixData[i] + matrixData[i];
		}
		return m;
	}
	//get element by (row, column)

	float& mat3::at(int i, int j)
	{
		return matrixData[3 * j + i];
	}
	const float& mat3::at(int i, int j) const
	{
		return matrixData[3 * j + i];
	}

	float mat3::determinant() const
	{
		float det = matrixData[0] * matrixData[4] * matrixData[8] + matrixData[1] * matrixData[5] * matrixData[6] + matrixData[2] * matrixData[3] * matrixData[7];
		det = det - matrixData[2] * matrixData[4] * matrixData[6] - matrixData[1] * matrixData[3] * matrixData[8] - matrixData[0] * matrixData[5] * matrixData[7];
		return det;
	}
	mat3 mat3::inverse() const
	{
		mat3 rez;
		float det;
		det = this->determinant();
		rez.matrixData[0] = matrixData[4] * matrixData[8] - matrixData[5] * matrixData[7];
		rez.matrixData[1] = (-1) * (matrixData[1] * matrixData[8] - matrixData[2] * matrixData[7]);
		rez.matrixData[2] = matrixData[1] * matrixData[5] - matrixData[2] * matrixData[4];
		rez.matrixData[3] = (-1) * (matrixData[3] * matrixData[8] - matrixData[5] * matrixData[6]);
		rez.matrixData[4] = (matrixData[0] * matrixData[8] - matrixData[2] * matrixData[6]);
		rez.matrixData[5] = (-1) * (matrixData[0] * matrixData[5] - matrixData[3] * matrixData[2]);
		rez.matrixData[6] = (matrixData[3] * matrixData[7] - matrixData[6] * matrixData[4]);
		rez.matrixData[7] = (-1) * (matrixData[0] * matrixData[7] - matrixData[1] * matrixData[6]);
		rez.matrixData[8] = matrixData[0] * matrixData[4] - matrixData[1] * matrixData[3];
		for (int i = 0; i < 9; i++)
			rez.matrixData[i] = rez.matrixData[i] / det;
		return rez;
	}
	mat3 mat3::transpose() const
	{
		mat3 m;
		for (int i = 0; i < 3; i++)
		{
			for (int j = 0; j < 3; j++)
			{
				m.matrixData[3 * j + i] = matrixData[3 * i + j];
			}
		}
		return m;
	}


}