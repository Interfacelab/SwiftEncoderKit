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
    case value1
    case value2
    case value3
}

enum IntEnum: Int {
    case value1
    case value2
    case value3
}

enum Int8Enum: Int8 {
    case value1
    case value2
    case value3
}

enum Int16Enum: Int16 {
    case value1
    case value2
    case value3
}

enum Int32Enum: Int32 {
    case value1
    case value2
    case value3
}

enum Int64Enum: Int64 {
    case value1
    case value2
    case value3
}

enum UIntEnum: UInt {
    case value1
    case value2
    case value3
}

enum UInt8Enum: UInt8 {
    case value1
    case value2
    case value3
}

enum UInt16Enum: UInt16 {
    case value1
    case value2
    case value3
}

enum UInt32Enum: UInt32 {
    case value1
    case value2
    case value3
}

enum UInt64Enum: UInt64 {
    case value1
    case value2
    case value3
}

enum FloatEnum: Float {
    case value1
    case value2
    case value3
}

enum DoubleEnum: Double {
    case value1
    case value2
    case value3
}

enum StringEnum: String {
    case value1 = "value1"
    case value2 = "value2"
    case value3 = "value3"
}


enum CharacterEnum: Character {
    case value1 = "1"
    case value2 = "2"
    case value3 = "3"
}

indirect enum IndirectEnum {
    case value1(Int)
    case value2(IndirectEnum)
    case value3(IndirectEnum)
}