//
//  main.cpp
//  Lab3
//
//  Copyright © 2016 CGIS. All rights reserved.
//

#include <iostream>
#include "testMatrix.h"
#include "mat3.h"
#include "mat4.h"

int main(int argc, const char * argv[]) {
    int nrOfErrors = 0;
    
    nrOfErrors += egc::testMat3Implementation();
    nrOfErrors += egc::testMat4Implementation();
    
    std::cout << "Number of errors: " << nrOfErrors << std::endl;

    std:getchar();
    
    return 0;
}
