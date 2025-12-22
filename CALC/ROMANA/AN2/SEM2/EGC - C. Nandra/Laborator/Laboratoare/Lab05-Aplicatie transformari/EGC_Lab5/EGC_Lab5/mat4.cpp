#include "mat3.h"
#include "mat4.h"
#include <math.h>

namespace egc {
	float& mat4::at(int i, int j) {
		return (*this).matrixData[i + 4 * j];
	}

	const float& mat4::at(int i, int j) const {
		return (*this).matrixData[i + 4 * j];
	}

	mat4& mat4::operator =(const mat4& srcMatrix) {
		for (int i = 0; i < 4; i++) {
			for (int j = 0; j < 4; j++) {
				(*this).at(i, j) = srcMatrix.at(i, j);
			}
		}
		return (*this);
	}

	mat4 mat4::operator *(float scalarValue) const {
		mat4 result;
		for (int i = 0; i < 4; i++) {
			for (int j = 0; j < 4; j++) {
				result.at(i, j) = scalarValue * at(i, j);
			}
		}
		return result;
	}

	mat4 mat4::operator *(const mat4& srcMatrix) const {
		mat4 result;
		for (int i = 0; i < 4; i++) {
			for (int j = 0; j < 4; j++) {
				result.at(i, j) = 0;
				for (int k = 0; k < 4; k++) {
					result.at(i, j) += at(i, k) * srcMatrix.at(k, j);
				}
			}
		}
		return result;
	}

	vec4 mat4::operator *(const vec4& srcVector) const {
		vec4 result;
		result.x = at(0, 0) * srcVector.x + at(0, 1) * srcVector.y + at(0, 2) * srcVector.z + at(0, 3) * srcVector.w;
		result.y = at(1, 0) * srcVector.x + at(1, 1) * srcVector.y + at(1, 2) * srcVector.z + at(1, 3) * srcVector.w;
		result.z = at(2, 0) * srcVector.x + at(2, 1) * srcVector.y + at(2, 2) * srcVector.z + at(2, 3) * srcVector.w;
		result.w = at(3, 0) * srcVector.x + at(3, 1) * srcVector.y + at(3, 2) * srcVector.z + at(3, 3) * srcVector.w;
		return result;
	}

	mat4 mat4::operator +(const mat4& srcMatrix) const {
		mat4 result;
		for (int i = 0; i < 4; i++) {
			for (int j = 0; j < 4; j++) {
				result.at(i, j) = at(i, j) + srcMatrix.at(i, j);
			}
		}
		return result;
	}

	// Functie care ma ajuta sa calculez cofactorul elemetului de pe linia row si coloana col
	mat3 cofactor(mat4 srcMatrix, int row, int col) {
		mat3 result;
		int x = 0;
		for (int i = 0; i < 4; i++) {
			int y = 0;
			for (int j = 0; j < 4; j++) {
				if (i != row && j != col) {
					result.at(x, y) = srcMatrix.at(i, j);
					y++;
				}
			}
			if (i != row) {
				x++;
			}
		}
		return result;
	}

	float mat4::determinant() const {
		float det = 0.0f;
		for (int j = 0; j < 4; j++) {
			mat3 mc = cofactor(*this, 0, j); // dezvolt dupa prima linie
			if (j % 2 == 0) {
				det += at(0, j) * mc.determinant();
			}
			else {
				det -= at(0, j) * mc.determinant();
			}
		}
		return det;
	}

	mat4 mat4::transpose() const {
		mat4 t;
		for (int i = 0; i < 4; i++) {
			for (int j = 0; j < 4; j++) {
				t.at(i, j) = at(j, i);
			}
		}
		return t;
	}

	mat4 mat4::inverse() const {
		mat4 t = transpose();
		mat4 adjMatrix;
		for (int i = 0; i < 4; i++) {
			for (int j = 0; j < 4; j++) {
				mat3 mc = cofactor(t, i, j);
				adjMatrix.at(i, j) = pow(-1, i + j) * mc.determinant();
			}
		}
		return adjMatrix * (1.0 / determinant());
	}
}