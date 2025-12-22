#pragma once

#include <cmath>
#include <iostream>
#include "vec4.h"

namespace egc {


	vec4& vec4:: operator =(const vec4& srcVector)
	{
		x = srcVector.x;
		y = srcVector.y;
		z = srcVector.z;
		w = srcVector.w;
		return *this;
	}

	vec4 vec4:: operator +(const vec4& srcVector) const
	{
		return vec4(x + srcVector.x, y + srcVector.y, z + srcVector.z, w + srcVector.w);
	}

	vec4& vec4:: operator +=(const vec4& srcVector)
	{
		x += srcVector.x;
		y += srcVector.y;
		z += srcVector.z;
		w += srcVector.w;
		return *this;
	}

	vec4 vec4:: operator *(float scalarValue) const
	{
		return vec4(x * scalarValue, y * scalarValue, z * scalarValue, w * scalarValue);
	}

	vec4 vec4:: operator -(const vec4& srcVector) const
	{
		return vec4(x - srcVector.x, y - srcVector.y, z - srcVector.z, w - srcVector.w);
	}

	vec4& vec4:: operator -=(const vec4& srcVector)
	{
		x -= srcVector.x;
		y -= srcVector.y;
		z -= srcVector.z;
		w -= srcVector.w;
		return *this;
	}

	vec4& vec4:: operator -()
	{
		x = (-x);
		y = (-y);
		z = (-z);
		w = (-w);
		return *this;
	}

	float vec4::length() const
	{
		return sqrt(x * x + y * y + z * z + w * w);
	}

	vec4& vec4::normalize()
	{
		float aux = this->length();
		x = x / aux;
		y = y / aux;
		z = z / aux;
		w = w / aux;
		return *this;
	}

}