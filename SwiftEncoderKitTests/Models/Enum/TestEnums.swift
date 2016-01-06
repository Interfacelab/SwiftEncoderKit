//
//  TestEnums.swift
//  SwiftEncoderKit
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


import Foundation

enum NoRawValueEnum {
    case Value1
    case Value2
    case Value3
}

enum IntEnum: Int {
    case Value1
    case Value2
    case Value3
}

enum Int8Enum: Int8 {
    case Value1
    case Value2
    case Value3
}

enum Int16Enum: Int16 {
    case Value1
    case Value2
    case Value3
}

enum Int32Enum: Int32 {
    case Value1
    case Value2
    case Value3
}

enum Int64Enum: Int64 {
    case Value1
    case Value2
    case Value3
}

enum UIntEnum: UInt {
    case Value1
    case Value2
    case Value3
}

enum UInt8Enum: UInt8 {
    case Value1
    case Value2
    case Value3
}

enum UInt16Enum: UInt16 {
    case Value1
    case Value2
    case Value3
}

enum UInt32Enum: UInt32 {
    case Value1
    case Value2
    case Value3
}

enum UInt64Enum: UInt64 {
    case Value1
    case Value2
    case Value3
}

enum FloatEnum: Float {
    case Value1
    case Value2
    case Value3
}

enum DoubleEnum: Double {
    case Value1
    case Value2
    case Value3
}

enum StringEnum: String {
    case Value1 = "Value1"
    case Value2 = "Value2"
    case Value3 = "Value3"
}


enum CharacterEnum: Character {
    case Value1 = "1"
    case Value2 = "2"
    case Value3 = "3"
}

indirect enum IndirectEnum {
    case Value1(Int)
    case Value2(IndirectEnum)
    case Value3(IndirectEnum)
}