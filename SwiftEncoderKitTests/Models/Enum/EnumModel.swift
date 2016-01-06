//
//  EnumModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

class EnumModel : Encodable {
    var int: IntEnum = .value1
    var int8: Int8Enum = .value1
    var int16: Int16Enum = .value1
    var int32: Int32Enum = .value1
    var int64: Int64Enum = .value1

    var uint: UIntEnum = .value1
    var uint8: UInt8Enum = .value1
    var uint16: UInt16Enum = .value1
    var uint32: UInt32Enum = .value1
    var uint64: UInt64Enum = .value1

    var string: StringEnum = .value1
    var float: FloatEnum = .value1
    var double: DoubleEnum = .value1
    var character: CharacterEnum = .value1

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
    }
}