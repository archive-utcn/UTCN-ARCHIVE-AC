#include "vec2.h"

namespace egc {

	vec2& vec2::operator =(const vec2 &srcVector) {
		x = srcVector.x;
		y = srcVector.y;
		return *this;
	}
	vec2 vec2::operator +(const vec2& srcVector) const {
		vec2 res;
		res.x = x + srcVector.x;
		res.y = y + srcVector.y;

		return res;
	}

	//vec2& operator +=(const vec2& srcVector);

	vec2 vec2::operator *(float scalarValue) const {
		vec2 res;
		res.x = x * scalarValue;
		res.y = y * scalarValue;
		return res;
	}
}