//
//  mat3.h
//  Lab3_TODO
//
//  Copyright © 2016 CGIS. All rights reserved.
//

#pragma once

#include <algorithm>
#include <iostream>
#include "vec3.h"

namespace egc {
    class mat3
    {
    public:
        //==============================================
        //matrixData is stored in column-major order
        //  m0  m3   m6
        //  m1  m4   m7
        //  m2  m5   m8
        //
        //  matrixData[] = {m0, m1, m2,
        //                  m3, m4, m5,
        //                  m6, m7, m8}
        //==============================================
        float matrixData[9];
        
        //==============================================
        //constructors
        //==============================================
        
        //default constructor creates an identity matrix
        mat3()
        {
            for (int i = 0; i < 9; i++) {
                matrixData[i] = (i % 4) ? 0.0f : 1.0f;
            }
        }
        
        mat3(const float* srcMatrix)
        {
            std::copy(srcMatrix, srcMatrix + 9, matrixData);
        }
        
        //==============================================
        // TO BE IMPLEMENTED
        //==============================================
        mat3& operator =(const mat3& srcMatrix);
        mat3 operator *(float scalarValue) const;
        mat3 operator *(const mat3& srcMatrix) const;
        vec3 operator *(const vec3& srcVector) const;
        mat3 operator +(const mat3& srcMatrix) const;
        //get element by (row, column)
        float& at(int i, int j);
        const float& at(int i, int j) const;
        float determinant() const;
        mat3 inverse() const;
        mat3 transpose() const;
        
        //==============================================
        friend std::ostream& operator<< (std::ostream &out, const mat3& srcMatrix);
        
        bool operator ==(const mat3& srcMatrix) const
        {
            for (int i = 0; i < 9; i++)
                if (std::abs(matrixData[i] - srcMatrix.matrixData[i]) >= std::numeric_limits<float>::epsilon()) {
                    return false;
                }
            return true;
        }
    };
    
    inline std::ostream& operator<< (std::ostream &out, const mat3& srcMatrix)
    {
        for(int i = 0; i < 3; i++)
            out << srcMatrix.matrixData[i] << "\t" << srcMatrix.matrixData[i + 3] << "\t" << srcMatrix.matrixData[i + 6] << "\n";
        return out;
    };
}