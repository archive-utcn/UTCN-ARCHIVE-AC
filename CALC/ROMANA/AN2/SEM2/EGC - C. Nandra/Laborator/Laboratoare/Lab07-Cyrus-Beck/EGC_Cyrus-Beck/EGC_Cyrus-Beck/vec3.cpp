#include "vec3.h"
namespace egc {
	vec3& vec3::operator =(const vec3 &srcVector) {
		x = srcVector.x;
		y = srcVector.y;
		z = srcVector.z;

		return *this;
	}

	vec3 vec3::operator +(const vec3& srcVector) const {
		vec3 result;
		result.x = x + srcVector.x;
		result.y = y + srcVector.y;
		result.z = z + srcVector.z;
		return result;
	}

	vec3& vec3::operator +=(const vec3& srcVector) {
		x += srcVector.x;
		y += srcVector.y;
		z += srcVector.z;
		return (*this);
	}

	vec3 vec3::operator *(float scalarValue) const {
		vec3 result;
		result.x = x * scalarValue;
		result.y = y * scalarValue;
		result.z = z * scalarValue;
		return result;
	}

	vec3 vec3::operator -(const vec3& srcVector) const {
		vec3 result;
		result.x = x - srcVector.x;
		result.y = y - srcVector.y;
		result.z = z - srcVector.z;
		return result;
	}

	vec3& vec3::operator -=(const vec3& srcVector) {
		x -= srcVector.x;
		y -= srcVector.y;
		z -= srcVector.z;
		return (*this);
	}

	vec3 vec3::operator -() const {
		vec3 result;
		result.x = -x;
		result.y = -y;
		result.z = -z;
		return result;
	}

	float vec3::length() const {
		return sqrt(x * x + y * y + z * z);
	}

	vec3& vec3::normalize() {
		*this = *this * (1.0 / sqrt(x * x + y * y + z * z));
		return (*this);
	}

	float dotProduct(const vec3& v1, const vec3& v2) {
		return v1.x * v2.x + v1.y * v2.y + v1.z * v2.z;
	}

	vec3 crossProduct(const vec3& v1, const vec3& v2) {
		vec3 result;
		result.x = v1.y * v2.z - v1.z * v2.y;
		result.y = v1.z * v2.x - v1.x * v2.z;
		result.z = v1.x * v2.y - v1.y * v2.x;
		return result;
	}
}