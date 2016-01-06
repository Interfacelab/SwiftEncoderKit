//
//  TestEnums.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

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