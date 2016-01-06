//
//  EnumModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

class EnumDictionaryModel : Encodable {
    var int: [String: IntEnum] = [:]
    var int8: [String: Int8Enum] = [:]
    var int16: [String: Int16Enum] = [:]
    var int32: [String: Int32Enum] = [:]
    var int64: [String: Int64Enum] = [:]
    var uint: [String: UIntEnum] = [:]
    var uint8: [String: UInt8Enum] = [:]
    var uint16: [String: UInt16Enum] = [:]
    var uint32: [String: UInt32Enum] = [:]
    var uint64: [String: UInt64Enum] = [:]
    var string: [String: StringEnum] = [:]
    var float: [String: FloatEnum] = [:]
    var double: [String: DoubleEnum] = [:]
    var character: [String: CharacterEnum] = [:]
    var intOpt: [String: IntEnum]?
    var int8Opt: [String: Int8Enum]?
    var int16Opt: [String: Int16Enum]?
    var int32Opt: [String: Int32Enum]?
    var int64Opt: [String: Int64Enum]?
    var uintOpt: [String: UIntEnum]?
    var uint8Opt: [String: UInt8Enum]?
    var uint16Opt: [String: UInt16Enum]?
    var uint32Opt: [String: UInt32Enum]?
    var uint64Opt: [String: UInt64Enum]?
    var stringOpt: [String: StringEnum]?
    var floatOpt: [String: FloatEnum]?
    var doubleOpt: [String: DoubleEnum]?
    var characterOpt: [String: CharacterEnum]?
    var intOptNil: [String: IntEnum]? = [:]
    var int8OptNil: [String: Int8Enum]? = [:]
    var int16OptNil: [String: Int16Enum]? = [:]
    var int32OptNil: [String: Int32Enum]? = [:]
    var int64OptNil: [String: Int64Enum]? = [:]
    var uintOptNil: [String: UIntEnum]? = [:]
    var uint8OptNil: [String: UInt8Enum]? = [:]
    var uint16OptNil: [String: UInt16Enum]? = [:]
    var uint32OptNil: [String: UInt32Enum]? = [:]
    var uint64OptNil: [String: UInt64Enum]? = [:]
    var stringOptNil: [String: StringEnum]? = [:]
    var floatOptNil: [String: FloatEnum]? = [:]
    var doubleOptNil: [String: DoubleEnum]? = [:]
    var characterOptNil: [String: CharacterEnum]? = [:]

    init() {

    }

    required init?(_ decoder: Decoder) {
        int <-- decoder["int"]
        int8 <-- decoder["int8"]
        int16 <-- decoder["int16"]
        int32 <-- decoder["int32"]
        int64 <-- decoder["int64"]
        uint <-- decoder["uint"]
        uint8 <-- decoder["uint8"]
        uint16 <-- decoder["uint16"]
        uint32 <-- decoder["uint32"]
        uint64 <-- decoder["uint64"]
        float <-- decoder["float"]
        double <-- decoder["double"]
        string <-- decoder["string"]
        character <-- decoder["character"]

        intOpt <-- decoder["intOpt"]
        int8Opt <-- decoder["int8Opt"]
        int16Opt <-- decoder["int16Opt"]
        int32Opt <-- decoder["int32Opt"]
        int64Opt <-- decoder["int64Opt"]
        uintOpt <-- decoder["uintOpt"]
        uint8Opt <-- decoder["uint8Opt"]
        uint16Opt <-- decoder["uint16Opt"]
        uint32Opt <-- decoder["uint32Opt"]
        uint64Opt <-- decoder["uint64Opt"]
        floatOpt <-- decoder["floatOpt"]
        doubleOpt <-- decoder["doubleOpt"]
        stringOpt <-- decoder["stringOpt"]
        characterOpt <-- decoder["characterOpt"]

        intOptNil <-- decoder["intOptNil"]
        int8OptNil <-- decoder["int8OptNil"]
        int16OptNil <-- decoder["int16OptNil"]
        int32OptNil <-- decoder["int32OptNil"]
        int64OptNil <-- decoder["int64OptNil"]
        uintOptNil <-- decoder["uintOptNil"]
        uint8OptNil <-- decoder["uint8OptNil"]
        uint16OptNil <-- decoder["uint16OptNil"]
        uint32OptNil <-- decoder["uint32OptNil"]
        uint64OptNil <-- decoder["uint64OptNil"]
        floatOptNil <-- decoder["floatOptNil"]
        doubleOptNil <-- decoder["doubleOptNil"]
        stringOptNil <-- decoder["stringOptNil"]
        characterOptNil <-- decoder["characterOptNil"]
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