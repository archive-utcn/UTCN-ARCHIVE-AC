//
//  main.cpp
//  Lab3
//
//  Copyright © 2016 CGIS. All rights reserved.
//

#include <iostream>

#include "testTransform.h"

int main(int argc, const char * argv[]) {
    int nrOfErrors = 0;
    
    nrOfErrors += egc::test2DTransformImplementation();
    nrOfErrors += egc::test3DTransformImplementation();
    
    std::cout << "Number of errors: " << nrOfErrors << std::endl;
    
    std:getchar();
    
    return 0;
}
