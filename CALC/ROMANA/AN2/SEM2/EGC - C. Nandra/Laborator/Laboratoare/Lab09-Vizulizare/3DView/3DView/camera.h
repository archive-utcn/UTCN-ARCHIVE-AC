//
//  camera.h
//  Lab8_TODO
//
//  Copyright © 2016 CGIS. All rights reserved.
//

#pragma once

#include "vec3.h"

namespace egc {
    class Camera{
    public:
        vec3 cameraPosition;
        vec3 cameraTarget;
        vec3 cameraUp;
        
        //default constructor
        Camera(){
            cameraPosition = vec3(0.0f, 0.0f, 10.0f);
            cameraTarget = vec3(0.0f, 0.0f, -10.0f);
            cameraUp = vec3(0.0f, 1.0f, 0.0f);
        };
        
        Camera(vec3 cameraPosition, vec3 cameraTarget, vec3 cameraUp)
        {
            this->cameraPosition = cameraPosition;
            this->cameraTarget = cameraTarget;
            this->cameraUp = cameraUp;
        };
    };
}