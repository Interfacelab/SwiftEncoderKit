//
//  EnumModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

class ConstEnumDictionaryModel : Encodable {
    let int: [String: IntEnum]
    let int8: [String: Int8Enum]
    let int16: [String: Int16Enum]
    let int32: [String: Int32Enum]
    let int64: [String: Int64Enum]
    let uint: [String: UIntEnum]
    let uint8: [String: UInt8Enum]
    let uint16: [String: UInt16Enum]
    let uint32: [String: UInt32Enum]
    let uint64: [String: UInt64Enum]
    let string: [String: StringEnum]
    let float: [String: FloatEnum]
    let double: [String: DoubleEnum]
    let character: [String: CharacterEnum]
    let intOpt: [String: IntEnum]?
    let int8Opt: [String: Int8Enum]?
    let int16Opt: [String: Int16Enum]?
    let int32Opt: [String: Int32Enum]?
    let int64Opt: [String: Int64Enum]?
    let uintOpt: [String: UIntEnum]?
    let uint8Opt: [String: UInt8Enum]?
    let uint16Opt: [String: UInt16Enum]?
    let uint32Opt: [String: UInt32Enum]?
    let uint64Opt: [String: UInt64Enum]?
    let stringOpt: [String: StringEnum]?
    let floatOpt: [String: FloatEnum]?
    let doubleOpt: [String: DoubleEnum]?
    let characterOpt: [String: CharacterEnum]?
    let intOptNil: [String: IntEnum]?
    let int8OptNil: [String: Int8Enum]?
    let int16OptNil: [String: Int16Enum]?
    let int32OptNil: [String: Int32Enum]?
    let int64OptNil: [String: Int64Enum]?
    let uintOptNil: [String: UIntEnum]?
    let uint8OptNil: [String: UInt8Enum]?
    let uint16OptNil: [String: UInt16Enum]?
    let uint32OptNil: [String: UInt32Enum]?
    let uint64OptNil: [String: UInt64Enum]?
    let stringOptNil: [String: StringEnum]?
    let floatOptNil: [String: FloatEnum]?
    let doubleOptNil: [String: DoubleEnum]?
    let characterOptNil: [String: CharacterEnum]?

    init(
        int: [String: IntEnum],
        int8: [String: Int8Enum],
        int16: [String: Int16Enum],
        int32: [String: Int32Enum],
        int64: [String: Int64Enum],
        uint: [String: UIntEnum],
        uint8: [String: UInt8Enum],
        uint16: [String: UInt16Enum],
        uint32: [String: UInt32Enum],
        uint64: [String: UInt64Enum],
        string: [String: StringEnum],
        float: [String: FloatEnum],
        double: [String: DoubleEnum],
        character: [String: CharacterEnum],
        intOpt: [String: IntEnum]?,
        int8Opt: [String: Int8Enum]?,
        int16Opt: [String: Int16Enum]?,
        int32Opt: [String: Int32Enum]?,
        int64Opt: [String: Int64Enum]?,
        uintOpt: [String: UIntEnum]?,
        uint8Opt: [String: UInt8Enum]?,
        uint16Opt: [String: UInt16Enum]?,
        uint32Opt: [String: UInt32Enum]?,
        uint64Opt: [String: UInt64Enum]?,
        stringOpt: [String: StringEnum]?,
        floatOpt: [String: FloatEnum]?,
        doubleOpt: [String: DoubleEnum]?,
        characterOpt: [String: CharacterEnum]?,
        intOptNil: [String: IntEnum]?,
        int8OptNil: [String: Int8Enum]?,
        int16OptNil: [String: Int16Enum]?,
        int32OptNil: [String: Int32Enum]?,
        int64OptNil: [String: Int64Enum]?,
        uintOptNil: [String: UIntEnum]?,
        uint8OptNil: [String: UInt8Enum]?,
        uint16OptNil: [String: UInt16Enum]?,
        uint32OptNil: [String: UInt32Enum]?,
        uint64OptNil: [String: UInt64Enum]?,
        stringOptNil: [String: StringEnum]?,
        floatOptNil: [String: FloatEnum]?,
        doubleOptNil: [String: DoubleEnum]?,
        characterOptNil: [String: CharacterEnum]?) {
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
        int = decoder.enumDictionary("int") ?? [:]
        int8 = decoder.enumDictionary("int8") ?? [:]
        int16 = decoder.enumDictionary("int16") ?? [:]
        int32 = decoder.enumDictionary("int32") ?? [:]
        int64 = decoder.enumDictionary("int64") ?? [:]
        uint = decoder.enumDictionary("uint") ?? [:]
        uint8 = decoder.enumDictionary("uint8") ?? [:]
        uint16 = decoder.enumDictionary("uint16") ?? [:]
        uint32 = decoder.enumDictionary("uint32") ?? [:]
        uint64 = decoder.enumDictionary("uint64") ?? [:]
        float = decoder.enumDictionary("float") ?? [:]
        double = decoder.enumDictionary("double") ?? [:]
        string = decoder.enumDictionary("string") ?? [:]
        character = decoder.enumDictionary("character") ?? [:]

        intOpt = decoder.enumDictionary("intOpt")
        int8Opt = decoder.enumDictionary("int8Opt")
        int16Opt = decoder.enumDictionary("int16Opt")
        int32Opt = decoder.enumDictionary("int32Opt")
        int64Opt = decoder.enumDictionary("int64Opt")
        uintOpt = decoder.enumDictionary("uintOpt")
        uint8Opt = decoder.enumDictionary("uint8Opt")
        uint16Opt = decoder.enumDictionary("uint16Opt")
        uint32Opt = decoder.enumDictionary("uint32Opt")
        uint64Opt = decoder.enumDictionary("uint64Opt")
        floatOpt = decoder.enumDictionary("floatOpt")
        doubleOpt = decoder.enumDictionary("doubleOpt")
        stringOpt = decoder.enumDictionary("stringOpt")
        characterOpt = decoder.enumDictionary("characterOpt")

        intOptNil = decoder.enumDictionary("intOptNil")
        int8OptNil = decoder.enumDictionary("int8OptNil")
        int16OptNil = decoder.enumDictionary("int16OptNil")
        int32OptNil = decoder.enumDictionary("int32OptNil")
        int64OptNil = decoder.enumDictionary("int64OptNil")
        uintOptNil = decoder.enumDictionary("uintOptNil")
        uint8OptNil = decoder.enumDictionary("uint8OptNil")
        uint16OptNil = decoder.enumDictionary("uint16OptNil")
        uint32OptNil = decoder.enumDictionary("uint32OptNil")
        uint64OptNil = decoder.enumDictionary("uint64OptNil")
        floatOptNil = decoder.enumDictionary("floatOptNil")
        doubleOptNil = decoder.enumDictionary("doubleOptNil")
        stringOptNil = decoder.enumDictionary("stringOptNil")
        characterOptNil = decoder.enumDictionary("characterOptNil")
    }

    func encode(encoder: Encoder) {
        int --> encoder["int"]
        int8 --> encoder["int8"]
        int16 --> encoder["int16"]
        int32 --> encoder["int32"]
        int64 --> encoder["int64"]
        uint --> encoder["uint"]
        uint8 --> encoder["uint8"]
        uint16 --> encoder["uint16"]
        uint32 --> encoder["uint32"]
        uint64 --> encoder["uint64"]
        string --> encoder["string"]
        float --> encoder["float"]
        double --> encoder["double"]
        character --> encoder["character"]

        intOpt --> encoder["intOpt"]
        int8Opt --> encoder["int8Opt"]
        int16Opt --> encoder["int16Opt"]
        int32Opt --> encoder["int32Opt"]
        int64Opt --> encoder["int64Opt"]
        uintOpt --> encoder["uintOpt"]
        uint8Opt --> encoder["uint8Opt"]
        uint16Opt --> encoder["uint16Opt"]
        uint32Opt --> encoder["uint32Opt"]
        uint64Opt --> encoder["uint64Opt"]
        stringOpt --> encoder["stringOpt"]
        floatOpt --> encoder["floatOpt"]
        doubleOpt --> encoder["doubleOpt"]
        characterOpt --> encoder["characterOpt"]

        intOptNil --> encoder["intOptNil"]
        int8OptNil --> encoder["int8OptNil"]
        int16OptNil --> encoder["int16OptNil"]
        int32OptNil --> encoder["int32OptNil"]
        int64OptNil --> encoder["int64OptNil"]
        uintOptNil --> encoder["uintOptNil"]
        uint8OptNil --> encoder["uint8OptNil"]
        uint16OptNil --> encoder["uint16OptNil"]
        uint32OptNil --> encoder["uint32OptNil"]
        uint64OptNil --> encoder["uint64OptNil"]
        stringOptNil --> encoder["stringOptNil"]
        floatOptNil --> encoder["floatOptNil"]
        doubleOptNil --> encoder["doubleOptNil"]
        characterOptNil --> encoder["characterOptNil"]
    }
}