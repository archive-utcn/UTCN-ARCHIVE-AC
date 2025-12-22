#include <iostream>
#include "vec3.h"
#include "vec4.h"
#include "mat3.h"
#include "mat4.h"

namespace egc {
    
int testMat3Implementation()
{
    int nrOfErrors = 0;
    
    std::cout << "Testing mat3 class" << std::endl;
    
    float a1[] = {1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 1.0f, 1.0f, 1.0f};
    float a2[] = {3.0f, 0.0f, 0.0f, 0.0f, 3.0f, 0.0f, 0.0f, 0.0f, 1.0f};
    float a3[] = {4.0f, 0.0f, 0.0f, 0.0f, 4.0f, 0.0f, 1.0f, 1.0f, 2.0f};
    
    egc::mat3 m1(a1), m2(a2), m3(a3), m4;
    
    m4 = m1 + m2;
    if(m4 == m3)
        std::cout << "\tCorrect + operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect + operation" << std::endl;
        nrOfErrors++;
    }
    
    float a5[] = {3.0f, 0.0f, 0.0f, 0.0f, 3.0f, 0.0f, 3.0f, 3.0f, 3.0f};
    egc::mat3 m5(a5);
    
    m4 = m1 * 3.0f;
    if(m4 == m5)
        std::cout << "\tCorrect * (with scalar value) operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect * (with scalar value) operation" << std::endl;
        nrOfErrors++;
    }

    float a6[] = {3.0f, 0.0f, 0.0f, 0.0f, 3.0f, 0.0f, 1.0f, 1.0f, 1.0f};
    egc::mat3 m6(a6);
    
    m4 = m1 * m2;
    if(m4 == m6)
        std::cout << "\tCorrect * (with another matrix) operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect * (with another matrix) operation" << std::endl;
        nrOfErrors++;
    }

    egc::vec3 v1(1.0f, 1.0f, 1.0f);
    egc::vec3 v2(4.0f, 4.0f, 1.0f);
    egc::vec3 v3;
    
    v3 = m4 * v1;
    if(v3 == v2)
        std::cout << "\tCorrect * (with a vec3) operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect * (with a vec3) operation" << std::endl;
        nrOfErrors++;
    }
    
    float a7[] = {-4.0f, 0.0f, 1.0f, -3.0f, 2.0f, 4.0f, 3.0f, -2.0f, -1.0f};
    egc::mat3 m7(a7);
    
    if(std::abs(m7.determinant() + 24.0f) < std::numeric_limits<float>::epsilon())
        std::cout << "\tCorrect determinant operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect determinant operation" << std::endl;
        nrOfErrors++;
    }
    
    float a8[] = {-4.0f, -3.0f, 3.0f, 0.0f, 2.0f, -2.0f, 1.0f, 4.0f, -1.0f};
    egc::mat3 m8(a8);
    
    if(m7.transpose() == m8)
        std::cout << "\tCorrect transpose operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect transpose operation" << std::endl;
        nrOfErrors++;
    }
    
    float a9[] = {-1.0f/4.0f, 1.0f/12.0f, 1.0f/12.0f, -3.0f/8.0f, -1.0f/24.0f, -13.00f/24.0f, 0.0f, 1.0f/3.0f, 1.0f/3.0f};
    egc::mat3 m9(a9);
    
    if(m7.inverse() == m9)
        std::cout << "\tCorrect inverse operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect inverse operation" << std::endl;
        nrOfErrors++;
    }
    
    return nrOfErrors;
}

int testMat4Implementation()
{
    int nrOfErrors = 0;
    
    std::cout << "Testing mat4 class" << std::endl;
    
    float a1[] = {1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 1.0f, 1.0f, 1.0f, 1.0f};
    float a2[] = {3.0f, 0.0f, 0.0f, 0.0f, 0.0f, 3.0f, 0.0f, 0.0f, 0.0f, 0.0f, 3.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f};
    float a3[] = {4.0f, 0.0f, 0.0f, 0.0f, 0.0f, 4.0f, 0.0f, 0.0f, 0.0f, 0.0f, 4.0f, 0.0f, 1.0f, 1.0f, 1.0f, 2.0f};
    
    egc::mat4 m1(a1), m2(a2), m3(a3), m4;
    
    m4 = m1 + m2;
    if(m4 == m3)
        std::cout << "\tCorrect + operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect + operation" << std::endl;
        nrOfErrors++;
    }
    
    float a5[] = {3.0f, 0.0f, 0.0f, 0.0f, 0.0f, 3.0f, 0.0f, 0.0f, 0.0f, 0.0f, 3.0f, 0.0f, 3.0f, 3.0f, 3.0f, 3.0f};
    egc::mat4 m5(a5);
    
    m4 = m1 * 3.0f;
    if(m4 == m5)
        std::cout << "\tCorrect * (with scalar value) operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect * (with scalar value) operation" << std::endl;
        nrOfErrors++;
    }
    
    float a6[] = {3.0f, 0.0f, 0.0f, 0.0f, 0.0f, 3.0f, 0.0f, 0.0f, 0.0f, 0.0f, 3.0f, 0.0f, 1.0f, 1.0f, 1.0f, 1.0f};
    egc::mat4 m6(a6);
    
    m4 = m1 * m2;
    if(m4 == m6)
        std::cout << "\tCorrect * (with another matrix) operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect * (with another matrix) operation" << std::endl;
        nrOfErrors++;
    }
    
    egc::vec4 v1(1.0f, 1.0f, 1.0f, 1.0f);
    egc::vec4 v2(4.0f, 4.0f, 4.0f, 1.0f);
    egc::vec4 v3;
    
    v3 = m4 * v1;
    if(v3 == v2)
        std::cout << "\tCorrect * (with a vec4) operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect * (with a vec4) operation" << std::endl;
        nrOfErrors++;
    }
    
    
    float a7[] = {3.0f, 4.0f, 3.0f, 9.0f, 2.0f, 0.0f, 0.0f, 2.0f, 0.0f, 1.0f, 2.0f, 3.0f, 1.0f, 2.0f, 1.0f, 1.0f};
    egc::mat4 m7(a7);
    
    if(std::abs(m7.determinant() - 24.0f) < std::numeric_limits<float>::epsilon())
        std::cout << "\tCorrect determinant operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect determinant operation" << std::endl;
        nrOfErrors++;
    }
    
    float a8[] = {3.0f, 2.0f, 0.0f, 1.0f, 4.0f, 0.0f, 1.0f, 2.0f, 3.0f, 0.0f, 2.0f, 1.0f, 9.0f, 2.0f, 3.0f, 1.0f};
    egc::mat4 m8(a8);
    
    if(m7.transpose() == m8)
        std::cout << "\tCorrect transpose operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect transpose operation" << std::endl;
        nrOfErrors++;
    }
    
    float a9[] = {-1.0f/4.0f, 2.0f/3.0f, 1.0f/6.0f, 5.0f/12.0f, 1.0f/4.0f, -1.0f/2.0f, -1.0/2.0f, 1.0f/4.0f, -1.0f/2.0f, 1.0f/2.0f, 1.0f, 1.0f/2.0f, 1.0f/4.0f, -1.0f/6.0f, -1.0/6.0f, -5.0f/12.0f};
    egc::mat4 m9(a9);
    
    if(m7.inverse() == m9)
        std::cout << "\tCorrect inverse operation" << std::endl;
    else
    {
        std::cout << "\tIncorrect inverse operation" << std::endl;
        nrOfErrors++;
    }
    
    return nrOfErrors;
}
    
}
