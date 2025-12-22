#include "vec2.h"
#include <math.h>

namespace egc {

	// a, b		a = b
	vec2& vec2::operator =(const vec2& srcVector) {
		// metode alternative de asignare
		// this->x = srcVector.x; 
		// (*this).x = srcVector.x;
		x = srcVector.x;
		y = srcVector.y;
		return (*this);
	}

	// c = a + b
	vec2 vec2::operator +(const vec2& srcVector) const {
		// nu putem sa modificam valorile lui this, cream vector nou (de asta avem al doilea const)
		vec2 result;
		result.x = x + srcVector.x;
		result.y = y + srcVector.y;
		return result;
	}

	// a = a + b
	vec2& vec2::operator +=(const vec2& srcVector) {
		x += srcVector.x;
		y += srcVector.y;
		return (*this);
	}

	// b = f * a
	vec2 vec2::operator *(float scalarValue) const {
		vec2 result;
		result.x = x * scalarValue;
		result.y = y * scalarValue;
		return result;
	}

	// c = a - b
	vec2 vec2::operator -(const vec2& srcVector) const {
		vec2 result;
		result.x = x - srcVector.x;
		result.y = y - srcVector.y;
		return result;
	}

	// a = a - b
	vec2& vec2::operator -=(const vec2& srcVector) {
		x -= srcVector.x;
		y -= srcVector.y;
		return (*this);
	}

	// -a
	vec2 vec2::operator -() const {
		vec2 result;
		result.x = -x;
		result.y = -y;
		return result;
	}

	// ||a||
	float vec2::length() const {
		return sqrt(x * x + y * y);
	}

	// a = (1 / ||a||) * a
	vec2& vec2::normalize() {
		*this = *this * (1.0 / sqrt(x * x + y * y));
		return (*this);
	}

	float dotProduct(const vec2& v1, const vec2& v2) {
		return v1.x * v2.x + v1.y * v2.y;
	}



}