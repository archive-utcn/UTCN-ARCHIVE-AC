//
//  main.cpp
//  Lab2
//
//  Copyright © 2016 CGIS. All rights reserved.
//

#include <iostream>
#include "vec2.h"
#include "vec3.h"
#include "vec4.h"

int testVec2Implementation()
{
    int nrOfErrors = 0;
    
    std::cout << "Testing vec2 class" << std::endl;
    
    egc::vec2 v1, v2, v3, v4;
    
    v1.x = 1.0f;
    v2.y = 1.0f;
    
    v3 = v1 + v2;
    if(v3 == egc::vec2(1.0f, 1.0f))
        std::cout << "\tCorrect + operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect + operation" << std::endl;
        nrOfErrors++;
    }
    
    v3 += v1;
    if(v3 == egc::vec2(2.0f, 1.0f))
        std::cout << "\tCorrect += operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect += operation" << std::endl;
        nrOfErrors++;
    }
    
    v3 = egc::vec2(2.0f, 1.0f) - v1;
    if(v3 == egc::vec2(1.0f, 1.0f))
        std::cout << "\tCorrect - operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect - operation" << std::endl;
        nrOfErrors++;
    }
    
    v3 -= v1;
    if(v3 == egc::vec2(0.0f, 1.0f))
        std::cout << "\tCorrect -= operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect -= operation" << std::endl;
        nrOfErrors++;
    }
    
    v3 = egc::vec2(3.0f, 4.0f);
    if(v3.length() == 5.0f)
        std::cout << "\tCorrect length operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect length operation" << std::endl;
        nrOfErrors++;
    }
    
    v4 = v3.normalize();
    if(v4 == egc::vec2(0.6f, 0.8f))
        std::cout << "\tCorrect normalize operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect normalize operation" << std::endl;
        nrOfErrors++;
    }
    
    if(egc::dotProduct(v1, v2) == 0.0f)
        std::cout << "\tCorrect dot product operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect dot product operation" << std::endl;
        nrOfErrors++;
    }
    
    return nrOfErrors;
}

int testVec3Implementation()
{
    int nrOfErrors = 0;
    
    std::cout << "Testing vec3 class" << std::endl;
    
    egc::vec3 v1, v2, v3, v4;
    
    v1.x = 1.0f;
    v2.y = 1.0f;
    
    v3 = v1 + v2;
    if(v3 == egc::vec3(1.0f, 1.0f, 0.0f))
        std::cout << "\tCorrect + operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect + operation" << std::endl;
        nrOfErrors++;
    }
    
    v3 += v1;
    if(v3 == egc::vec3(2.0f, 1.0f, 0.0f))
        std::cout << "\tCorrect += operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect += operation" << std::endl;
        nrOfErrors++;
    }
    
    v3 = egc::vec3(2.0f, 1.0f, 0.0f) - v1;
    if(v3 == egc::vec3(1.0f, 1.0f, 0.0f))
        std::cout << "\tCorrect - operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect - operation" << std::endl;
        nrOfErrors++;
    }
    
    v3 -= v1;
    if(v3 == egc::vec3(0.0f, 1.0f, 0.0f))
        std::cout << "\tCorrect -= operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect -= operation" << std::endl;
        nrOfErrors++;
    }
    
    v3 = egc::vec3(2.0f, 4.0f, 4.0f);
    if(v3.length() == 6.0f)
        std::cout << "\tCorrect length operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect length operation" << std::endl;
        nrOfErrors++;
    }
    
    v4 = v3.normalize();
    if(v4 == egc::vec3(2.0f / 6.0f, 4.0f / 6.0f, 4.0f / 6.0f))
        std::cout << "\tCorrect normalize operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect normalize operation" << std::endl;
        nrOfErrors++;
    }
    
    if(egc::dotProduct(v1, v2) == 0.0f)
        std::cout << "\tCorrect dot product operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect dot product operation" << std::endl;
        nrOfErrors++;
    }
    
    v4 = egc::crossProduct(v1, v2);
    if(v4 == egc::vec3(0.0f, 0.0f, 1.0f))
        std::cout << "\tCorrect cross product operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect cross product operation" << std::endl;
        nrOfErrors++;
    }
    
    return nrOfErrors;
}

int testVec4Implementation()
{
    int nrOfErrors = 0;
    
    std::cout << "Testing vec4 class" << std::endl;
    
    egc::vec4 v1, v2, v3, v4;
    
    v1.x = 1.0f;
    v2.y = 1.0f;
    
    v3 = v1 + v2;
    if(v3 == egc::vec4(1.0f, 1.0f, 0.0f, 0.0f))
        std::cout << "\tCorrect + operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect + operation" << std::endl;
        nrOfErrors++;
    }
    
    v3 += v1;
    if(v3 == egc::vec4(2.0f, 1.0f, 0.0f, 0.0f))
        std::cout << "\tCorrect += operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect += operation" << std::endl;
        nrOfErrors++;
    }
    
    v3 = egc::vec4(2.0f, 1.0f, 0.0f, 0.0f) - v1;
    if(v3 == egc::vec4(1.0f, 1.0f, 0.0f, 0.0f))
        std::cout << "\tCorrect - operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect - operation" << std::endl;
        nrOfErrors++;
    }
    
    v3 -= v1;
    if(v3 == egc::vec4(0.0f, 1.0f, 0.0f, 0.0f))
        std::cout << "\tCorrect -= operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect -= operation" << std::endl;
        nrOfErrors++;
    }
    
    v3 = egc::vec4(2.0f, 4.0f, 4.0f, 0.0f);
    if(v3.length() == 6.0f)
        std::cout << "\tCorrect length operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect length operation" << std::endl;
        nrOfErrors++;
    }
    
    v4 = v3.normalize();
    if(v4 == egc::vec4(2.0f / 6.0f, 4.0f / 6.0f, 4.0f / 6.0f, 0.0f))
        std::cout << "\tCorrect normalize operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect normalize operation" << std::endl;
        nrOfErrors++;
    }
    
    return nrOfErrors;
}

int main(int argc, const char * argv[]) {
    
    int nrOfErrors = 0;
    
    nrOfErrors += testVec2Implementation();
    nrOfErrors += testVec3Implementation();
    nrOfErrors += testVec4Implementation();
    
    std::cout << "Number of errors: " << nrOfErrors << std::endl;

    std:getchar();
    
    return 0;
}
