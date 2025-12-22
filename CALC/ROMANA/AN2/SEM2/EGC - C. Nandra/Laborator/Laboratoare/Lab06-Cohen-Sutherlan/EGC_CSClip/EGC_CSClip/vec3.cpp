#include "vec3.h"
namespace egc {
	vec3& vec3::operator =(const vec3 &srcVector) {
		x = srcVector.x;
		y = srcVector.y;
		z = srcVector.z;

		return *this;
	}
}