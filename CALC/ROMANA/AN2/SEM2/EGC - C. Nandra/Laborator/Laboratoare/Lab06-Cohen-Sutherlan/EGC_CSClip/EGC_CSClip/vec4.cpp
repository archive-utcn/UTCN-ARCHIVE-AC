#include "vec4.h"
namespace egc {
	vec4& vec4::operator =(const vec4 &srcVector) {
		x = srcVector.x;
		y = srcVector.y;
		z = srcVector.z;
		w = srcVector.w;

		return *this;
	}
}