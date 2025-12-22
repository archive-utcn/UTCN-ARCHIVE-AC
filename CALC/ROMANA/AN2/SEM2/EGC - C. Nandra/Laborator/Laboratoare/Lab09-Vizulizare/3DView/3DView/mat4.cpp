#include <stdio.h>
#include "mat4.h"

namespace egc
{
	mat4& mat4::operator =(const mat4& srcMatrix)
	{
		for (int i = 0; i < 16; i++)
		{
			matrixData[i] = srcMatrix.matrixData[i];
		}
		return *this;
	}

	mat4 mat4::operator *(float scalarValue) const
	{
		mat4 m;
		for (int i = 0; i < 16; i++)
		{
			m.matrixData[i] = matrixData[i] * scalarValue;
		}

		return m;
	}

	mat4 mat4::operator *(const mat4& srcMatrix) const
	{
		mat4 m;
		for (int i = 0; i < 16; i++)
		{
			m.matrixData[i] = 0;
		}

		for (int i = 0; i < 4; i++)
		{
			for (int j = 0; j < 4; j++)
			{
				for (int k = 0; k < 4; k++)
				{
					m.matrixData[4 * j + i] += this->at(i, k) * srcMatrix.at(k, j);
				}
			}
		}
		return m;
	}

	vec4 mat4::operator *(const vec4& srcVector) const
	{
		vec4 v;
		float x = srcVector.x, y = srcVector.y, z = srcVector.z, w = srcVector.w;

		v.x = matrixData[0] * x + matrixData[4] * y + matrixData[8] * z + matrixData[12] * w;
		v.y = matrixData[1] * x + matrixData[5] * y + matrixData[9] * z + matrixData[13] * w;
		v.z = matrixData[2] * x + matrixData[6] * y + matrixData[10] * z + matrixData[14] * w;
		v.w = matrixData[3] * x + matrixData[7] * y + matrixData[11] * z + matrixData[15] * w;
		return v;
	}

	mat4 mat4::operator +(const mat4& srcMatrix) const
	{
		mat4 m;
		for (int i = 0; i < 16; i++)
		{
			m.matrixData[i] = srcMatrix.matrixData[i] + matrixData[i];
		}
		return m;
	}

	//get element by (row, column)
	float& mat4::at(int i, int j)
	{
		return matrixData[4 * j + i];
	}

	const float& mat4::at(int i, int j) const
	{
		return matrixData[4 * j + i];
	}

	float mat4::determinant() const
	{
		return matrixData[0] * (matrixData[5] * matrixData[10] * matrixData[15] + matrixData[11] * matrixData[6] * matrixData[13] + matrixData[9] * matrixData[7] * matrixData[14] - matrixData[7] * matrixData[10] * matrixData[13] - matrixData[11] * matrixData[14] * matrixData[5] - matrixData[6] * matrixData[9] * matrixData[15]) -
			matrixData[4] * (matrixData[1] * matrixData[10] * matrixData[15] + matrixData[11] * matrixData[2] * matrixData[13] + matrixData[9] * matrixData[3] * matrixData[14] - matrixData[3] * matrixData[10] * matrixData[13] - matrixData[11] * matrixData[14] * matrixData[1] - matrixData[2] * matrixData[9] * matrixData[15]) +
			matrixData[8] * (matrixData[1] * matrixData[6] * matrixData[15] + matrixData[2] * matrixData[7] * matrixData[13] + matrixData[5] * matrixData[14] * matrixData[3] - matrixData[3] * matrixData[6] * matrixData[13] - matrixData[7] * matrixData[14] * matrixData[1] - matrixData[2] * matrixData[5] * matrixData[15]) -
			matrixData[12] * (matrixData[1] * matrixData[6] * matrixData[11] + matrixData[2] * matrixData[7] * matrixData[9] + matrixData[5] * matrixData[10] * matrixData[3] - matrixData[3] * matrixData[6] * matrixData[9] - matrixData[1] * matrixData[7] * matrixData[10] - matrixData[2] * matrixData[5] * matrixData[11]);
	}

	mat4 mat4::inverse() const
	{
		mat4 rez;
		float det;
		det = this->determinant();
		rez.matrixData[0] = matrixData[5] * matrixData[10] * matrixData[15] + matrixData[11] * matrixData[6] * matrixData[13] + matrixData[9] * matrixData[7] * matrixData[14] - matrixData[7] * matrixData[10] * matrixData[13] - matrixData[11] * matrixData[14] * matrixData[5] - matrixData[6] * matrixData[9] * matrixData[15];
		rez.matrixData[1] = -(matrixData[1] * matrixData[10] * matrixData[15] + matrixData[11] * matrixData[2] * matrixData[13] + matrixData[9] * matrixData[3] * matrixData[14] - matrixData[3] * matrixData[10] * matrixData[13] - matrixData[11] * matrixData[14] * matrixData[1] - matrixData[2] * matrixData[9] * matrixData[15]);
		rez.matrixData[2] = matrixData[1] * matrixData[6] * matrixData[15] + matrixData[2] * matrixData[7] * matrixData[13] + matrixData[5] * matrixData[14] * matrixData[3] - matrixData[3] * matrixData[6] * matrixData[13] - matrixData[7] * matrixData[14] * matrixData[1] - matrixData[2] * matrixData[5] * matrixData[15];
		rez.matrixData[3] = -(matrixData[1] * matrixData[6] * matrixData[11] + matrixData[2] * matrixData[7] * matrixData[9] + matrixData[5] * matrixData[10] * matrixData[3] - matrixData[3] * matrixData[6] * matrixData[9] - matrixData[1] * matrixData[7] * matrixData[10] - matrixData[2] * matrixData[5] * matrixData[11]);
		rez.matrixData[4] = -(matrixData[4] * matrixData[10] * matrixData[15] + matrixData[6] * matrixData[11] * matrixData[12] + matrixData[7] * matrixData[8] * matrixData[14] - matrixData[7] * matrixData[10] * matrixData[12] - matrixData[11] * matrixData[14] * matrixData[4] - matrixData[6] * matrixData[8] * matrixData[15]);
		rez.matrixData[5] = matrixData[0] * matrixData[10] * matrixData[15] + matrixData[2] * matrixData[11] * matrixData[12] + matrixData[3] * matrixData[8] * matrixData[14] - matrixData[3] * matrixData[10] * matrixData[12] - matrixData[0] * matrixData[11] * matrixData[14] - matrixData[2] * matrixData[8] * matrixData[15];
		rez.matrixData[6] = -(matrixData[0] * matrixData[6] * matrixData[15] + matrixData[2] * matrixData[7] * matrixData[12] + matrixData[4] * matrixData[3] * matrixData[14] - matrixData[3] * matrixData[6] * matrixData[12] - matrixData[0] * matrixData[7] * matrixData[14] - matrixData[2] * matrixData[4] * matrixData[15]);
		rez.matrixData[7] = matrixData[0] * matrixData[6] * matrixData[11] + matrixData[2] * matrixData[7] * matrixData[8] + matrixData[4] * matrixData[10] * matrixData[3] - matrixData[3] * matrixData[6] * matrixData[8] - matrixData[0] * matrixData[7] * matrixData[10] - matrixData[2] * matrixData[4] * matrixData[11];
		rez.matrixData[8] = matrixData[4] * matrixData[9] * matrixData[15] + matrixData[5] * matrixData[11] * matrixData[12] + matrixData[7] * matrixData[8] * matrixData[13] - matrixData[7] * matrixData[9] * matrixData[12] - matrixData[4] * matrixData[11] * matrixData[13] - matrixData[8] * matrixData[5] * matrixData[15];
		rez.matrixData[9] = -(matrixData[0] * matrixData[9] * matrixData[15] + matrixData[1] * matrixData[11] * matrixData[12] + matrixData[3] * matrixData[8] * matrixData[13] - matrixData[3] * matrixData[9] * matrixData[12] - matrixData[0] * matrixData[11] * matrixData[13] - matrixData[8] * matrixData[1] * matrixData[15]);
		rez.matrixData[10] = matrixData[0] * matrixData[5] * matrixData[15] + matrixData[1] * matrixData[7] * matrixData[12] + matrixData[3] * matrixData[4] * matrixData[13] - matrixData[3] * matrixData[5] * matrixData[12] - matrixData[0] * matrixData[7] * matrixData[13] - matrixData[1] * matrixData[4] * matrixData[15];
		rez.matrixData[11] = -(matrixData[0] * matrixData[5] * matrixData[11] + matrixData[1] * matrixData[7] * matrixData[8] + matrixData[3] * matrixData[4] * matrixData[9] - matrixData[3] * matrixData[5] * matrixData[8] - matrixData[0] * matrixData[7] * matrixData[9] - matrixData[1] * matrixData[4] * matrixData[11]);
		rez.matrixData[12] = -(matrixData[4] * matrixData[9] * matrixData[14] + matrixData[5] * matrixData[10] * matrixData[12] + matrixData[6] * matrixData[8] * matrixData[13] - matrixData[6] * matrixData[9] * matrixData[12] - matrixData[4] * matrixData[10] * matrixData[13] - matrixData[8] * matrixData[5] * matrixData[14]);
		rez.matrixData[13] = matrixData[0] * matrixData[9] * matrixData[14] + matrixData[1] * matrixData[10] * matrixData[12] + matrixData[2] * matrixData[8] * matrixData[13] - matrixData[2] * matrixData[9] * matrixData[12] - matrixData[0] * matrixData[10] * matrixData[13] - matrixData[8] * matrixData[1] * matrixData[14];
		rez.matrixData[14] = -(matrixData[0] * matrixData[5] * matrixData[14] + matrixData[1] * matrixData[6] * matrixData[12] + matrixData[2] * matrixData[4] * matrixData[13] - matrixData[2] * matrixData[5] * matrixData[12] - matrixData[0] * matrixData[6] * matrixData[13] - matrixData[1] * matrixData[4] * matrixData[14]);
		rez.matrixData[15] = matrixData[0] * matrixData[5] * matrixData[10] + matrixData[1] * matrixData[6] * matrixData[8] + matrixData[2] * matrixData[4] * matrixData[9] - matrixData[2] * matrixData[5] * matrixData[8] - matrixData[0] * matrixData[6] * matrixData[9] - matrixData[1] * matrixData[4] * matrixData[10];
		for (int i = 0; i < 16; i++)
			rez.matrixData[i] = rez.matrixData[i] / det;
		return rez;
	}
	mat4 mat4::transpose() const
	{
		mat4 m;
		for (int i = 0; i < 4; i++)
		{
			for (int j = 0; j < 4; j++)
			{
				m.matrixData[4 * j + i] = matrixData[4 * i + j];
			}
		}
		return m;
	}
}