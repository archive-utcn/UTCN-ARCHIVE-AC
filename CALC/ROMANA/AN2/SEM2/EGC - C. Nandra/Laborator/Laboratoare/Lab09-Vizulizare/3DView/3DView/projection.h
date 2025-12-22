//
//  projection.h
//  Lab8_TODO
//
//  Copyright © 2016 CGIS. All rights reserved.
//

#pragma once
#include "include/SDL.h"
#include "vec3.h"
#include "vec4.h"
#include "mat4.h"
#include "camera.h"
#include <vector>


namespace egc {
    mat4 defineViewTransformMatrix(int startX, int startY, int width, int height);
    mat4 defineCameraMatrix(Camera myCamera);
    mat4 definePerspectiveProjectionMatrix(float fov, float aspect, float zNear, float zFar);
    void perspectiveDivide(vec4 &inputVertex);
    bool clipPointInHomogeneousCoordinate(const egc::vec4 &vertex);
    bool clipTriangleInHomegeneousCoordinates(const std::vector<egc::vec4> &triangle);
    egc::vec3 findNormalVectorToTriangle(const std::vector<egc::vec4> &triangle);
    egc::vec4 findCenterPointOfTriangle(const std::vector<egc::vec4> &triangle);
    bool isTriangleVisible(const std::vector<egc::vec4> &triangle, const egc::vec3 &normalVector);
	void displayNormalVectors(egc::vec3 &normalVector, egc::vec4 &triangleCenter, SDL_Renderer *renderer, egc::mat4 viewTransformMatrix, egc::mat4 perspectiveMatrix);
}
