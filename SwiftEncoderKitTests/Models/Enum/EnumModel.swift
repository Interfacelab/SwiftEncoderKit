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

    var intOpt: IntEnum?
    var int8Opt: Int8Enum?
    var int16Opt: Int16Enum?
    var int32Opt: Int32Enum?
    var int64Opt: Int64Enum?
    var uintOpt: UIntEnum?
    var uint8Opt: UInt8Enum?
    var uint16Opt: UInt16Enum?
    var uint32Opt: UInt32Enum?
    var uint64Opt: UInt64Enum?
    var stringOpt: StringEnum?
    var floatOpt: FloatEnum?
    var doubleOpt: DoubleEnum?
    var characterOpt: CharacterEnum?

    var intOptNil: IntEnum? = .value1
    var int8OptNil: Int8Enum? = .value1
    var int16OptNil: Int16Enum? = .value1
    var int32OptNil: Int32Enum? = .value1
    var int64OptNil: Int64Enum? = .value1
    var uintOptNil: UIntEnum? = .value1
    var uint8OptNil: UInt8Enum? = .value1
    var uint16OptNil: UInt16Enum? = .value1
    var uint32OptNil: UInt32Enum? = .value1
    var uint64OptNil: UInt64Enum? = .value1
    var stringOptNil: StringEnum? = .value1
    var floatOptNil: FloatEnum? = .value1
    var doubleOptNil: DoubleEnum? = .value1
    var characterOptNil: CharacterEnum? = .value1

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