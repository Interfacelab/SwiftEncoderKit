//
//  EnumModel.swift
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

class ConstEnumArrayModel : Encodable {
    let int: [IntEnum]
    let int8: [Int8Enum]
    let int16: [Int16Enum]
    let int32: [Int32Enum]
    let int64: [Int64Enum]
    let uint: [UIntEnum]
    let uint8: [UInt8Enum]
    let uint16: [UInt16Enum]
    let uint32: [UInt32Enum]
    let uint64: [UInt64Enum]
    let string: [StringEnum]
    let float: [FloatEnum]
    let double: [DoubleEnum]
    let character: [CharacterEnum]
    let intOpt: [IntEnum]?
    let int8Opt: [Int8Enum]?
    let int16Opt: [Int16Enum]?
    let int32Opt: [Int32Enum]?
    let int64Opt: [Int64Enum]?
    let uintOpt: [UIntEnum]?
    let uint8Opt: [UInt8Enum]?
    let uint16Opt: [UInt16Enum]?
    let uint32Opt: [UInt32Enum]?
    let uint64Opt: [UInt64Enum]?
    let stringOpt: [StringEnum]?
    let floatOpt: [FloatEnum]?
    let doubleOpt: [DoubleEnum]?
    let characterOpt: [CharacterEnum]?
    let intOptNil: [IntEnum]?
    let int8OptNil: [Int8Enum]?
    let int16OptNil: [Int16Enum]?
    let int32OptNil: [Int32Enum]?
    let int64OptNil: [Int64Enum]?
    let uintOptNil: [UIntEnum]?
    let uint8OptNil: [UInt8Enum]?
    let uint16OptNil: [UInt16Enum]?
    let uint32OptNil: [UInt32Enum]?
    let uint64OptNil: [UInt64Enum]?
    let stringOptNil: [StringEnum]?
    let floatOptNil: [FloatEnum]?
    let doubleOptNil: [DoubleEnum]?
    let characterOptNil: [CharacterEnum]?

    init(
        int: [IntEnum],
        int8: [Int8Enum],
        int16: [Int16Enum],
        int32: [Int32Enum],
        int64: [Int64Enum],
        uint: [UIntEnum],
        uint8: [UInt8Enum],
        uint16: [UInt16Enum],
        uint32: [UInt32Enum],
        uint64: [UInt64Enum],
        string: [StringEnum],
        float: [FloatEnum],
        double: [DoubleEnum],
        character: [CharacterEnum],
        intOpt: [IntEnum]?,
        int8Opt: [Int8Enum]?,
        int16Opt: [Int16Enum]?,
        int32Opt: [Int32Enum]?,
        int64Opt: [Int64Enum]?,
        uintOpt: [UIntEnum]?,
        uint8Opt: [UInt8Enum]?,
        uint16Opt: [UInt16Enum]?,
        uint32Opt: [UInt32Enum]?,
        uint64Opt: [UInt64Enum]?,
        stringOpt: [StringEnum]?,
        floatOpt: [FloatEnum]?,
        doubleOpt: [DoubleEnum]?,
        characterOpt: [CharacterEnum]?,
        intOptNil: [IntEnum]?,
        int8OptNil: [Int8Enum]?,
        int16OptNil: [Int16Enum]?,
        int32OptNil: [Int32Enum]?,
        int64OptNil: [Int64Enum]?,
        uintOptNil: [UIntEnum]?,
        uint8OptNil: [UInt8Enum]?,
        uint16OptNil: [UInt16Enum]?,
        uint32OptNil: [UInt32Enum]?,
        uint64OptNil: [UInt64Enum]?,
        stringOptNil: [StringEnum]?,
        floatOptNil: [FloatEnum]?,
        doubleOptNil: [DoubleEnum]?,
        characterOptNil: [CharacterEnum]?) {
            self.int = int
            self.int8 = int8
            self.int16 = int16
            self.int32 = int32
            self.int64 = int64
            self.uint = uint
            self.uint8 = uint8
            self.uint16 = uint16
            self.uint32 = uint32
            self.uint64 = uint64
            self.string = string
            self.float = float
            self.double = double
            self.character = character
            self.intOpt = intOpt
            self.int8Opt = int8Opt
            self.int16Opt = int16Opt
            self.int32Opt = int32Opt
            self.int64Opt = int64Opt
            self.uintOpt = uintOpt
            self.uint8Opt = uint8Opt
            self.uint16Opt = uint16Opt
            self.uint32Opt = uint32Opt
            self.uint64Opt = uint64Opt
            self.stringOpt = stringOpt
            self.floatOpt = floatOpt
            self.doubleOpt = doubleOpt
            self.characterOpt = characterOpt
            self.intOptNil = intOptNil
            self.int8OptNil = int8OptNil
            self.int16OptNil = int16OptNil
            self.int32OptNil = int32OptNil
            self.int64OptNil = int64OptNil
            self.uintOptNil = uintOptNil
            self.uint8OptNil = uint8OptNil
            self.uint16OptNil = uint16OptNil
            self.uint32OptNil = uint32OptNil
            self.uint64OptNil = uint64OptNil
            self.stringOptNil = stringOptNil
            self.floatOptNil = floatOptNil
            self.doubleOptNil = doubleOptNil
            self.characterOptNil = characterOptNil
    }

    required init?(_ decoder: Decoder) {
        int = decoder.enumArray("int") ?? []
        int8 = decoder.enumArray("int8") ?? []
        int16 = decoder.enumArray("int16") ?? []
        int32 = decoder.enumArray("int32") ?? []
        int64 = decoder.enumArray("int64") ?? []
        uint = decoder.enumArray("uint") ?? []
        uint8 = decoder.enumArray("uint8") ?? []
        uint16 = decoder.enumArray("uint16") ?? []
        uint32 = decoder.enumArray("uint32") ?? []
        uint64 = decoder.enumArray("uint64") ?? []
        float = decoder.enumArray("float") ?? []
        double = decoder.enumArray("double") ?? []
        string = decoder.enumArray("string") ?? []
        character = decoder.enumArray("character") ?? []

        intOpt = decoder.enumArray("intOpt")
        int8Opt = decoder.enumArray("int8Opt")
        int16Opt = decoder.enumArray("int16Opt")
        int32Opt = decoder.enumArray("int32Opt")
        int64Opt = decoder.enumArray("int64Opt")
        uintOpt = decoder.enumArray("uintOpt")
        uint8Opt = decoder.enumArray("uint8Opt")
        uint16Opt = decoder.enumArray("uint16Opt")
        uint32Opt = decoder.enumArray("uint32Opt")
        uint64Opt = decoder.enumArray("uint64Opt")
        floatOpt = decoder.enumArray("floatOpt")
        doubleOpt = decoder.enumArray("doubleOpt")
        stringOpt = decoder.enumArray("stringOpt")
        characterOpt = decoder.enumArray("characterOpt")

        intOptNil = decoder.enumArray("intOptNil")
        int8OptNil = decoder.enumArray("int8OptNil")
        int16OptNil = decoder.enumArray("int16OptNil")
        int32OptNil = decoder.enumArray("int32OptNil")
        int64OptNil = decoder.enumArray("int64OptNil")
        uintOptNil = decoder.enumArray("uintOptNil")
        uint8OptNil = decoder.enumArray("uint8OptNil")
        uint16OptNil = decoder.enumArray("uint16OptNil")
        uint32OptNil = decoder.enumArray("uint32OptNil")
        uint64OptNil = decoder.enumArray("uint64OptNil")
        floatOptNil = decoder.enumArray("floatOptNil")
        doubleOptNil = decoder.enumArray("doubleOptNil")
        stringOptNil = decoder.enumArray("stringOptNil")
        characterOptNil = decoder.enumArray("characterOptNil")
    }

    func encode(encoder: Encoder) {
        encoder.addEnumArray(int, key: "int")
        encoder.addEnumArray(int8, key: "int8")
        encoder.addEnumArray(int16, key: "int16")
        encoder.addEnumArray(int32, key: "int32")
        encoder.addEnumArray(int64, key: "int64")
        encoder.addEnumArray(uint, key: "uint")
        encoder.addEnumArray(uint8, key: "uint8")
        encoder.addEnumArray(uint16, key: "uint16")
        encoder.addEnumArray(uint32, key: "uint32")
        encoder.addEnumArray(uint64, key: "uint64")
        encoder.addEnumArray(string, key: "string")
        encoder.addEnumArray(float, key: "float")
        encoder.addEnumArray(double, key: "double")
        encoder.addEnumArray(character, key: "character")

        encoder.addEnumArray(intOpt, key: "intOpt")
        encoder.addEnumArray(int8Opt, key: "int8Opt")
        encoder.addEnumArray(int16Opt, key: "int16Opt")
        encoder.addEnumArray(int32Opt, key: "int32Opt")
        encoder.addEnumArray(int64Opt, key: "int64Opt")
        encoder.addEnumArray(uintOpt, key: "uintOpt")
        encoder.addEnumArray(uint8Opt, key: "uint8Opt")
        encoder.addEnumArray(uint16Opt, key: "uint16Opt")
        encoder.addEnumArray(uint32Opt, key: "uint32Opt")
        encoder.addEnumArray(uint64Opt, key: "uint64Opt")
        encoder.addEnumArray(stringOpt, key: "stringOpt")
        encoder.addEnumArray(floatOpt, key: "floatOpt")
        encoder.addEnumArray(doubleOpt, key: "doubleOpt")
        encoder.addEnumArray(characterOpt, key: "characterOpt")
        
        encoder.addEnumArray(intOptNil, key: "intOptNil")
        encoder.addEnumArray(int8OptNil, key: "int8OptNil")
        encoder.addEnumArray(int16OptNil, key: "int16OptNil")
        encoder.addEnumArray(int32OptNil, key: "int32OptNil")
        encoder.addEnumArray(int64OptNil, key: "int64OptNil")
        encoder.addEnumArray(uintOptNil, key: "uintOptNil")
        encoder.addEnumArray(uint8OptNil, key: "uint8OptNil")
        encoder.addEnumArray(uint16OptNil, key: "uint16OptNil")
        encoder.addEnumArray(uint32OptNil, key: "uint32OptNil")
        encoder.addEnumArray(uint64OptNil, key: "uint64OptNil")
        encoder.addEnumArray(stringOptNil, key: "stringOptNil")
        encoder.addEnumArray(floatOptNil, key: "floatOptNil")
        encoder.addEnumArray(doubleOptNil, key: "doubleOptNil")
        encoder.addEnumArray(characterOptNil, key: "characterOptNil")
    }
}