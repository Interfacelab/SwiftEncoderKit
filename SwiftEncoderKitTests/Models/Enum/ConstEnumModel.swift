//
//  EnumModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

class ConstEnumModel : Encodable {
    let int: IntEnum
    let int8: Int8Enum
    let int16: Int16Enum
    let int32: Int32Enum
    let int64: Int64Enum
    let uint: UIntEnum
    let uint8: UInt8Enum
    let uint16: UInt16Enum
    let uint32: UInt32Enum
    let uint64: UInt64Enum
    let string: StringEnum
    let float: FloatEnum
    let double: DoubleEnum
    let character: CharacterEnum

    let intOpt: IntEnum?
    let int8Opt: Int8Enum?
    let int16Opt: Int16Enum?
    let int32Opt: Int32Enum?
    let int64Opt: Int64Enum?
    let uintOpt: UIntEnum?
    let uint8Opt: UInt8Enum?
    let uint16Opt: UInt16Enum?
    let uint32Opt: UInt32Enum?
    let uint64Opt: UInt64Enum?
    let stringOpt: StringEnum?
    let floatOpt: FloatEnum?
    let doubleOpt: DoubleEnum?
    let characterOpt: CharacterEnum?

    let intOptNil: IntEnum?
    let int8OptNil: Int8Enum?
    let int16OptNil: Int16Enum?
    let int32OptNil: Int32Enum?
    let int64OptNil: Int64Enum?
    let uintOptNil: UIntEnum?
    let uint8OptNil: UInt8Enum?
    let uint16OptNil: UInt16Enum?
    let uint32OptNil: UInt32Enum?
    let uint64OptNil: UInt64Enum?
    let stringOptNil: StringEnum?
    let floatOptNil: FloatEnum?
    let doubleOptNil: DoubleEnum?
    let characterOptNil: CharacterEnum?

    init(int: IntEnum,
        int8: Int8Enum,
        int16: Int16Enum,
        int32: Int32Enum,
        int64: Int64Enum,
        uint: UIntEnum,
        uint8: UInt8Enum,
        uint16: UInt16Enum,
        uint32: UInt32Enum,
        uint64: UInt64Enum,
        string: StringEnum,
        float: FloatEnum,
        double: DoubleEnum,
        character: CharacterEnum,
        intOpt: IntEnum?,
        int8Opt: Int8Enum?,
        int16Opt: Int16Enum?,
        int32Opt: Int32Enum?,
        int64Opt: Int64Enum?,
        uintOpt: UIntEnum?,
        uint8Opt: UInt8Enum?,
        uint16Opt: UInt16Enum?,
        uint32Opt: UInt32Enum?,
        uint64Opt: UInt64Enum?,
        stringOpt: StringEnum?,
        floatOpt: FloatEnum?,
        doubleOpt: DoubleEnum?,
        characterOpt: CharacterEnum?,
        intOptNil: IntEnum?,
        int8OptNil: Int8Enum?,
        int16OptNil: Int16Enum?,
        int32OptNil: Int32Enum?,
        int64OptNil: Int64Enum?,
        uintOptNil: UIntEnum?,
        uint8OptNil: UInt8Enum?,
        uint16OptNil: UInt16Enum?,
        uint32OptNil: UInt32Enum?,
        uint64OptNil: UInt64Enum?,
        stringOptNil: StringEnum?, 
        floatOptNil: FloatEnum?, 
        doubleOptNil: DoubleEnum?, 
        characterOptNil: CharacterEnum?) {
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
        int = decoder.enumValue("int") ?? .value1
        int8 = decoder.enumValue("int8") ?? .value1
        int16 = decoder.enumValue("int16") ?? .value1
        int32 = decoder.enumValue("int32") ?? .value1
        int64 = decoder.enumValue("int64") ?? .value1
        uint = decoder.enumValue("uint") ?? .value1
        uint8 = decoder.enumValue("uint8") ?? .value1
        uint16 = decoder.enumValue("uint16") ?? .value1
        uint32 = decoder.enumValue("uint32") ?? .value1
        uint64 = decoder.enumValue("uint64") ?? .value1
        float = decoder.enumValue("float") ?? .value1
        double = decoder.enumValue("double") ?? .value1
        string = decoder.enumValue("string") ?? .value1
        character = decoder.enumValue("character") ?? .value1

        intOpt = decoder.enumValue("intOpt")
        int8Opt = decoder.enumValue("int8Opt")
        int16Opt = decoder.enumValue("int16Opt")
        int32Opt = decoder.enumValue("int32Opt")
        int64Opt = decoder.enumValue("int64Opt")
        uintOpt = decoder.enumValue("uintOpt")
        uint8Opt = decoder.enumValue("uint8Opt")
        uint16Opt = decoder.enumValue("uint16Opt")
        uint32Opt = decoder.enumValue("uint32Opt")
        uint64Opt = decoder.enumValue("uint64Opt")
        floatOpt = decoder.enumValue("floatOpt")
        doubleOpt = decoder.enumValue("doubleOpt")
        stringOpt = decoder.enumValue("stringOpt")
        characterOpt = decoder.enumValue("characterOpt")

        intOptNil = decoder.enumValue("intOptNil")
        int8OptNil = decoder.enumValue("int8OptNil")
        int16OptNil = decoder.enumValue("int16OptNil")
        int32OptNil = decoder.enumValue("int32OptNil")
        int64OptNil = decoder.enumValue("int64OptNil")
        uintOptNil = decoder.enumValue("uintOptNil")
        uint8OptNil = decoder.enumValue("uint8OptNil")
        uint16OptNil = decoder.enumValue("uint16OptNil")
        uint32OptNil = decoder.enumValue("uint32OptNil")
        uint64OptNil = decoder.enumValue("uint64OptNil")
        floatOptNil = decoder.enumValue("floatOptNil")
        doubleOptNil = decoder.enumValue("doubleOptNil")
        stringOptNil = decoder.enumValue("stringOptNil")
        characterOptNil = decoder.enumValue("characterOptNil")
    }

    func encode(encoder: Encoder) {
        encoder.addEnumValue(int, key: "int")
        encoder.addEnumValue(int8, key: "int8")
        encoder.addEnumValue(int16, key: "int16")
        encoder.addEnumValue(int32, key: "int32")
        encoder.addEnumValue(int64, key: "int64")
        encoder.addEnumValue(uint, key: "uint")
        encoder.addEnumValue(uint8, key: "uint8")
        encoder.addEnumValue(uint16, key: "uint16")
        encoder.addEnumValue(uint32, key: "uint32")
        encoder.addEnumValue(uint64, key: "uint64")
        encoder.addEnumValue(string, key: "string")
        encoder.addEnumValue(float, key: "float")
        encoder.addEnumValue(double, key: "double")
        encoder.addEnumValue(character, key: "character")

        encoder.addEnumValue(intOpt, key: "intOpt")
        encoder.addEnumValue(int8Opt, key: "int8Opt")
        encoder.addEnumValue(int16Opt, key: "int16Opt")
        encoder.addEnumValue(int32Opt, key: "int32Opt")
        encoder.addEnumValue(int64Opt, key: "int64Opt")
        encoder.addEnumValue(uintOpt, key: "uintOpt")
        encoder.addEnumValue(uint8Opt, key: "uint8Opt")
        encoder.addEnumValue(uint16Opt, key: "uint16Opt")
        encoder.addEnumValue(uint32Opt, key: "uint32Opt")
        encoder.addEnumValue(uint64Opt, key: "uint64Opt")
        encoder.addEnumValue(stringOpt, key: "stringOpt")
        encoder.addEnumValue(floatOpt, key: "floatOpt")
        encoder.addEnumValue(doubleOpt, key: "doubleOpt")
        encoder.addEnumValue(characterOpt, key: "characterOpt")
        
        encoder.addEnumValue(intOptNil, key: "intOptNil")
        encoder.addEnumValue(int8OptNil, key: "int8OptNil")
        encoder.addEnumValue(int16OptNil, key: "int16OptNil")
        encoder.addEnumValue(int32OptNil, key: "int32OptNil")
        encoder.addEnumValue(int64OptNil, key: "int64OptNil")
        encoder.addEnumValue(uintOptNil, key: "uintOptNil")
        encoder.addEnumValue(uint8OptNil, key: "uint8OptNil")
        encoder.addEnumValue(uint16OptNil, key: "uint16OptNil")
        encoder.addEnumValue(uint32OptNil, key: "uint32OptNil")
        encoder.addEnumValue(uint64OptNil, key: "uint64OptNil")
        encoder.addEnumValue(stringOptNil, key: "stringOptNil")
        encoder.addEnumValue(floatOptNil, key: "floatOptNil")
        encoder.addEnumValue(doubleOptNil, key: "doubleOptNil")
        encoder.addEnumValue(characterOptNil, key: "characterOptNil")
    }
}