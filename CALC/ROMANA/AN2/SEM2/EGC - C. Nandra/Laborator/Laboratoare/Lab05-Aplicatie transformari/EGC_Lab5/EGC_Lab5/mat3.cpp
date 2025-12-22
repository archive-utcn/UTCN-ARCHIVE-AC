#include "mat3.h"

namespace egc {
	
	float& mat3::at(int i, int j) {
		return (*this).matrixData[i + 3 * j];
	}
	const float& mat3::at(int i, int j) const {
		return (*this).matrixData[i + 3 * j];
	}

	mat3& mat3::operator =(const mat3& srcMatrix) {
		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 3; j++) {
				(*this).at(i, j) = srcMatrix.at(i, j);
			}
		}
		return (*this);
	}

	mat3 mat3::operator +(const mat3& srcMatrix) const {
		mat3 result;
		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 3; j++) {
				result.at(i, j) = at(i, j) + srcMatrix.at(i, j);
			}
		}
		return result;
	}

	mat3 mat3::operator *(float scalarValue) const {
		mat3 result;
		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 3; j++) {
				result.at(i, j) = scalarValue * at(i, j);
			}
		}
		return result;
	}

	mat3 mat3::operator *(const mat3& srcMatrix) const {
		mat3 result;
		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 3; j++) {
				result.at(i, j) = 0;
				for (int k = 0; k < 3; k++) {
					result.at(i, j) += at(i, k) * srcMatrix.at(k, j);
				}
			}
		}
		return result;
	}

	vec3 mat3::operator *(const vec3& srcVector) const {
		vec3 result;
		result.x = at(0, 0) * srcVector.x + at(0, 1) * srcVector.y + at(0, 2) * srcVector.z;
		result.y = at(1, 0) * srcVector.x + at(1, 1) * srcVector.y + at(1, 2) * srcVector.z;
		result.z = at(2, 0) * srcVector.x + at(2, 1) * srcVector.y + at(2, 2) * srcVector.z;
		return result;
	}

	float mat3::determinant() const {
		return at(0, 0) * at(1, 1) * at(2, 2) + at(0, 1) * at(2, 0) * at(1, 2) + at(1, 0) * at(2, 1) * at(0, 2) - at(0, 2) * at(1, 1) * at(2, 0) - at(0, 0) * at(2, 1) * at(1, 2) - at(0, 1) * at(1, 0) * at(2, 2);
	}

	mat3 mat3::inverse() const {
		mat3 inv;
		inv.at(0, 0) = (at(1, 1) * at(2, 2) - at(1, 2) * at(2, 1));
		inv.at(1, 0) = -(at(1, 0) * at(2, 2) - at(2, 0) * at(1, 2));
		inv.at(2, 0) = (at(1, 0) * at(2, 1) - at(2, 0) * at(1, 1));
		inv.at(0, 1) = -(at(0, 1) * at(2, 2) - at(2, 1) * at(0, 2));
		inv.at(1, 1) = (at(0, 0) * at(2, 2) - at(0, 2) * at(2, 0));
		inv.at(2, 1) = -(at(0, 0) * at(2, 1) - at(0, 1) * at(2, 0));
		inv.at(0, 2) = (at(0, 1) * at(1, 2) - at(0, 2) * at(1, 1));
		inv.at(1, 2) = -(at(0, 0) * at(1, 2) - at(1, 0) * at(0, 2));
		inv.at(2, 2) = (at(0, 0) * at(1, 1) - at(1, 0) * at(0, 1));
		inv = inv * (1 / determinant());
		return inv;
	}
	
	mat3 mat3::transpose() const {
		mat3 t;
		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 3; j++) {
				t.at(i, j) = at(j, i);
			}
		}
		return t;
	}
}