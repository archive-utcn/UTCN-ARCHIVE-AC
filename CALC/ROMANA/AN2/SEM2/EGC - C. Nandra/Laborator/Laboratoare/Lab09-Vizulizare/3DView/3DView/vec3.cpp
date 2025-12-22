#pragma once

#include <cmath>
#include <iostream>
#include "vec3.h"

namespace egc {


	vec3& vec3:: operator =(const vec3& srcVector)
	{
		x = srcVector.x;
		y = srcVector.y;
		z = srcVector.z;
		return *this;
	}

	vec3 vec3:: operator +(const vec3& srcVector) const
	{
		return vec3(x + srcVector.x, y + srcVector.y, z + srcVector.z);
	}

	vec3& vec3:: operator +=(const vec3& srcVector)
	{
		x += srcVector.x;
		y += srcVector.y;
		z += srcVector.z;
		return *this;
	}

	vec3 vec3:: operator *(float scalarValue) const
	{
		return vec3(x * scalarValue, y * scalarValue, z * scalarValue);
	}

	vec3 vec3:: operator -(const vec3& srcVector) const
	{
		return vec3(x - srcVector.x, y - srcVector.y, z - srcVector.z);
	}

	vec3& vec3:: operator -=(const vec3& srcVector)
	{
		x -= srcVector.x;
		y -= srcVector.y;
		z -= srcVector.z;
		return *this;
	}

	vec3& vec3:: operator -()
	{
		x = (-x);
		y = (-y);
		z = (-z);
		return *this;
	}

	float vec3::length() const
	{
		return sqrt(x * x + y * y + z * z);
	}

	vec3& vec3::normalize()
	{
		float aux = this->length();
		x = x / aux;
		y = y / aux;
		z = z / aux;
		return *this;
	}

	float dotProduct(const vec3& v1, const vec3& v2)
	{
		return v1.x * v2.x + v1.y * v2.y + v1.z * v2.z;
	}

	vec3 crossProduct(const vec3& v1, const vec3& v2)
	{
		return vec3(v1.y * v2.z - v1.z * v2.y,
			v1.z * v2.x - v1.x * v2.z,
			v1.x * v2.y - v1.y * v2.x);
	}
}