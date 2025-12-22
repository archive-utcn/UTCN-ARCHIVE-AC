//
//  transformations.hpp
//  Lab4_TODO
//
//  Copyright © 2016 CGIS. All rights reserved.
//

#pragma once

#include "vec2.h"
#include "vec3.h"
#include "mat3.h"
#include "mat4.h"

namespace egc {
    const double PI = atan(1.0) * 4;
    
    //transformation matrices in 2D
    mat3 translate(const vec2 translateArray);
    mat3 translate(float tx, float ty);
    
    mat3 scale(const vec2 scaleArray);
    mat3 scale(float sx, float sy);
    
    mat3 rotate(float angle);

    //transformation matrices in 3D
    mat4 translate(const vec3 translateArray);
    mat4 translate(float tx, float ty, float tz);
    
    mat4 scale(const vec3 scaleArray);
    mat4 scale(float sx, float sy, float sz);
    
    mat4 rotateX(float angle);
    mat4 rotateY(float angle);
    mat4 rotateZ(float angle);
}