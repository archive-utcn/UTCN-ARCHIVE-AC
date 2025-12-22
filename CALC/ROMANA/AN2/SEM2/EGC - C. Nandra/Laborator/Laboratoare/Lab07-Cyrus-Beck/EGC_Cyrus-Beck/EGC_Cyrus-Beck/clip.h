//
//  clip.hpp
//
//  Copyright © 2016 CGIS. All rights reserved.
//

#pragma once
#include "vec3.h"
#include <vector>

namespace egc {
    
	//Cyrus-Beck clipping algorithm
	//clipWindow specifies the vertices that define the clipping area in conterclockwise order
	//and can represent any convex polygon
	//function returns -1 if the line segment cannot be clipped
	int lineClip_CyrusBeck(std::vector<vec3> clipWindow, vec3& p1, vec3& p2);
}
