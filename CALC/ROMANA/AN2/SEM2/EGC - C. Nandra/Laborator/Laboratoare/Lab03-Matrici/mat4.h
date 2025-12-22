//
//  mat4.h
//  Lab3_TODO
//
//  Copyright © 2016 CGIS. All rights reserved.
//

#pragma once

#include <algorithm>
#include <iostream>
#include "vec4.h"

namespace egc {
    class mat4
    {
    public:
        //==============================================
        //matrixData is stored in column-major order
        //  m00  m04   m08  m12
        //  m01  m05   m09  m13
        //  m02  m06   m10  m14
        //  m03  m07   m11  m15
        //
        //  matrixData[] = {m00, m01, m02, m03,
        //                  m04, m05, m06, m07,
        //                  m08, m09, m10, m11,
        //                  m12, m13, m14, m15}
        //==============================================
        float matrixData[16];
        
        //==============================================
        //constructors
        //==============================================
        
        //default constructor creates an identity matrix
        mat4()
        {
            for (int i = 0; i < 16; i++) {
                matrixData[i] = (i % 5) ? 0.0f : 1.0f;
            }
        }
        
        mat4(const float* srcMatrix)
        {
            std::copy(srcMatrix, srcMatrix + 16, matrixData);
        }
        
        //==============================================
        // TO BE IMPLEMENTED
        //==============================================
        mat4& operator =(const mat4& srcMatrix);
        mat4 operator *(float scalarValue) const;
        mat4 operator *(const mat4& srcMatrix) const;
        vec4 operator *(const vec4& srcVector) const;
        mat4 operator +(const mat4& srcMatrix) const;
        //get element by (row, column)
        float& at(int i, int j);
        const float& at(int i, int j) const;
        float determinant() const;
        mat4 inverse() const;
        mat4 transpose() const;
        
        //==============================================
        friend std::ostream& operator<< (std::ostream &out, const mat4& srcMatrix);
        
        bool operator ==(const mat4& srcMatrix) const
        {
            for (int i = 0; i < 16; i++)
                if (std::abs(matrixData[i] - srcMatrix.matrixData[i]) >= std::numeric_limits<float>::epsilon()) {
                    return false;
                }
            return true;
        }
    };
    
    inline std::ostream& operator<< (std::ostream &out, const mat4& srcMatrix)
    {
        for(int i = 0; i < 4; i++)
            out << srcMatrix.matrixData[i] << "\t" << srcMatrix.matrixData[i + 4] << "\t" << srcMatrix.matrixData[i + 8] << "\t" << srcMatrix.matrixData[i + 12] << "\n";
        return out;
    };
}