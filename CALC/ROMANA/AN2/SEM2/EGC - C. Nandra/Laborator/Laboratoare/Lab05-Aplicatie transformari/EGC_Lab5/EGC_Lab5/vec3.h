//
//  vec3.h
//  Lab2
//
//  Copyright © 2016 CGIS. All rights reserved.
//

#pragma once

#include <cmath>
#include "vec4.h"

namespace egc {

class vec3
{
public:
    union
    {
        float x;
        float r;
        float u;
    };
    
    union
    {
        float y;
        float g;
        float v;
    };
    
    union
    {
        float z;
        float b;
        float w;
    };
    
    //=========================================
    //constructors
    //=========================================
    
    //default constructor creates a zero vector
    vec3()
    {
		x = 0.0f;
		y = 0.0f;
		z = 0.0f;
    }
    
    //creates a vector (fX, fY, fZ)
    vec3(float fX, float fY, float fZ)
    {
		x = fX;
		y = fY;
		z = fZ;
    }
    
    //copy constructor
    vec3(const vec3 &srcVector)
    {
		x = srcVector.x;
		y = srcVector.y;
		z = srcVector.z;
    }
    
    vec3(const egc::vec4 &srcVector)
    {
		x = srcVector.x;
		y = srcVector.y;
		z = srcVector.z;
    }
    
    //=========================================
    //
    //=========================================
    
    bool operator ==(const vec3& srcVector) const
    {
        return (std::abs(x - srcVector.x) < std::numeric_limits<float>::epsilon()) && (std::abs(y - srcVector.y) < std::numeric_limits<float>::epsilon()) && (std::abs(z - srcVector.z) < std::numeric_limits<float>::epsilon());
    }
    
    friend std::ostream& operator<< (std::ostream &out, const vec3& srcVector);
    
    //=========================================
    //3D vector operations
    //TO BE IMPLEMENTED
    //=========================================
    
    vec3& operator =(const vec3 &srcVector);
    vec3 operator +(const vec3& srcVector) const;
    vec3& operator +=(const vec3& srcVector);
    vec3 operator *(float scalarValue) const;
    vec3 operator -(const vec3& srcVector) const;
    vec3& operator -=(const vec3& srcVector);
    vec3 operator -() const;
    float length() const;
    vec3& normalize();
};
    
    inline std::ostream& operator<< (std::ostream &out, const vec3& srcVector)
    {
        out << "(" << srcVector.x << ", " << srcVector.y << ", " << srcVector.z << ")";
        return out;
    }

    float dotProduct(const vec3& v1, const vec3& v2);
    vec3 crossProduct(const vec3& v1, const vec3& v2);
    
}
