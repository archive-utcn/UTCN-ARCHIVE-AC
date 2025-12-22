#include <iostream>
#include "vec2.h"
#include "vec3.h"
#include "mat3.h"
#include "mat4.h"
#include "transform.h"

namespace egc {

int test2DTransformImplementation()
{
    int nrOfErrors = 0;
    
    std::cout << "Testing 2D Tranformations" << std::endl;
    
    float a2[] = {1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 2.0f, 3.0f, 1.0f};
    
    egc::mat3 m1, m2(a2);
    
    m1 = egc::translate(egc::vec2(2.0f, 3.0f));
    if(m1 == m2)
        std::cout << "\tCorrect translate matrix (by vec2)" << std::endl;
    else
    {
        std::cout << "\tIncorrect translate matrix (by vec2)" << std::endl;
        nrOfErrors++;
    }
    
    m1 = egc::translate(2.0f, 3.0f);
    if(m1 == m2)
        std::cout << "\tCorrect translate matrix (by values)" << std::endl;
    else
    {
        std::cout << "\tIncorrect translate matrix (by values)" << std::endl;
        nrOfErrors++;
    }
    
    float a3[] = {3.0f, 0.0f, 0.0f, 0.0f, 2.0f, 0.0f, 0.0f, 0.0f, 1.0f};
    egc::mat3 m3(a3);
    
    m1 = egc::scale(egc::vec2(3.0f, 2.0f));
    if(m1 == m3)
        std::cout << "\tCorrect scale matrix (by vec2)" << std::endl;
    else
    {
        std::cout << "\tIncorrect scale matrix (by vec2)" << std::endl;
        nrOfErrors++;
    }
    
    m1 = egc::scale(3.0f, 2.0f);
    if(m1 == m3)
        std::cout << "\tCorrect scale matrix (by values)" << std::endl;
    else
    {
        std::cout << "\tIncorrect scale matrix (by values)" << std::endl;
        nrOfErrors++;
    }

    float a4[] = {0.0f, 1.0f, 0.0f, -1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f};
    egc::mat3 m4(a4);
    
    m1 = egc::rotate(90.0f);
    if(m1 == m4)
        std::cout << "\tCorrect rotate matrix" << std::endl;
    else
    {
        std::cout << "\tIncorrect rotate matrix" << std::endl;
        nrOfErrors++;
    }
    
    return nrOfErrors;
}

int test3DTransformImplementation()
{
    int nrOfErrors = 0;
    
    std::cout << "Testing 3D Tranformations" << std::endl;
    
    float a2[] = {1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 2.0f, 3.0f, 3.0f, 1.0f};
    
    egc::mat4 m1, m2(a2);
    
    m1 = egc::translate(egc::vec3(2.0f, 3.0f, 3.0f));
    if(m1 == m2)
        std::cout << "\tCorrect translate matrix (by vec3)" << std::endl;
    else
    {
        std::cout << "\tIncorrect translate matrix (by vec3)" << std::endl;
        nrOfErrors++;
    }
    
    m1 = egc::translate(2.0f, 3.0f, 3.0f);
    if(m1 == m2)
        std::cout << "\tCorrect translate matrix (by values)" << std::endl;
    else
    {
        std::cout << "\tIncorrect translate matrix (by values)" << std::endl;
        nrOfErrors++;
    }
    
    float a3[] = {3.0f, 0.0f, 0.0f, 0.0f, 0.0f, 2.0f, 0.0f, 0.0f, 0.0f, 0.0f, 3.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f};
    egc::mat4 m3(a3);
    
    m1 = egc::scale(egc::vec3(3.0f, 2.0f, 3.0f));
    if(m1 == m3)
        std::cout << "\tCorrect scale matrix (by vec3)" << std::endl;
    else
    {
        std::cout << "\tIncorrect scale matrix (by vec3)" << std::endl;
        nrOfErrors++;
    }
    
    m1 = egc::scale(3.0f, 2.0f, 3.0f);
    if(m1 == m3)
        std::cout << "\tCorrect scale matrix (by values)" << std::endl;
    else
    {
        std::cout << "\tIncorrect scale matrix (by values)" << std::endl;
        nrOfErrors++;
    }
    
    float a4[] = {1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, -1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f};
    egc::mat4 m4(a4);
    
    m1 = egc::rotateX(90.0f);
    if(m1 == m4)
        std::cout << "\tCorrect rotate matrix around X" << std::endl;
    else
    {
        std::cout << "\tIncorrect rotate matrix around X" << std::endl;
        nrOfErrors++;
    }
    
    float a5[] = {0.0f, 0.0f, -1.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f};
    egc::mat4 m5(a5);
    
    m1 = egc::rotateY(90.0f);
    if(m1 == m5)
        std::cout << "\tCorrect rotate matrix around Y" << std::endl;
    else
    {
        std::cout << "\tIncorrect rotate matrix around Y" << std::endl;
        nrOfErrors++;
    }

    float a6[] = {0.0f, 1.0f, 0.0f, 0.0f, -1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f};
    egc::mat4 m6(a6);
    
    m1 = egc::rotateZ(90.0f);
    if(m1 == m6)
        std::cout << "\tCorrect rotate matrix around Z" << std::endl;
    else
    {
        std::cout << "\tIncorrect rotate matrix around Z" << std::endl;
        nrOfErrors++;
    }
    
    return nrOfErrors;
}
}
