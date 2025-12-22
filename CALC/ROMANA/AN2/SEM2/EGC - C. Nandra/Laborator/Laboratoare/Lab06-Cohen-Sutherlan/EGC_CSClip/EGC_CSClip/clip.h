//
//  clip.hpp
//
//  Copyright © 2016 CGIS. All rights reserved.
//

#pragma once
#include "vec3.h"
#include <vector>

namespace egc {
    
    //Cohen-Sutherland clipping algorithm
    //clipWindow specifies the vertices that define the clipping area in conterclockwise order
    //and must be a rectangular window
    std::vector<int> computeCSCode(std::vector<vec3> clipWindow, const vec3 p);
    bool simpleRejection(std::vector<int> cod1, std::vector<int> cod2);
    bool simpleAcceptance(std::vector<int> cod1, std::vector<int> cod2);

    //function returns -1 if the line segment cannot be clipped
    int lineClip_CohenSutherland(std::vector<vec3> clipWindow, vec3& p1, vec3& p2);
}
