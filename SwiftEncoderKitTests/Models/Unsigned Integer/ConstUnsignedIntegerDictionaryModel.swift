//
//  TestModel.swift
//  SwiftEncoderKit
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
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


class ConstUnsignedIntegerDictionaryModel: Encodable {
    let uint: [String: UInt]
    let uint8: [String: UInt8]
    let uint16: [String: UInt16]
    let uint32: [String: UInt32]
    let uint64: [String: UInt64]

    let uintOpt: [String: UInt]?
    let uint8Opt: [String: UInt8]?
    let uint16Opt: [String: UInt16]?
    let uint32Opt: [String: UInt32]?
    let uint64Opt: [String: UInt64]?

    let uintOptNil: [String: UInt]?
    let uint8OptNil: [String: UInt8]?
    let uint16OptNil: [String: UInt16]?
    let uint32OptNil: [String: UInt32]?
    let uint64OptNil: [String: UInt64]?

    init(uint: [String: UInt], uint8: [String: UInt8], uint16: [String: UInt16],
        uint32: [String: UInt32], uint64: [String: UInt64], uintOpt: [String: UInt]?,
        uint8Opt: [String: UInt8]?, uint16Opt: [String: UInt16]?, uint32Opt: [String: UInt32]?,
        uint64Opt: [String: UInt64]?, uintOptNil: [String: UInt]?, uint8OptNil: [String: UInt8]?,
        uint16OptNil: [String: UInt16]?, uint32OptNil: [String: UInt32]?,
        uint64OptNil: [String: UInt64]?) {
            self.uint = uint
            self.uint8 = uint8
            self.uint16 = uint16
            self.uint32 = uint32
            self.uint64 = uint64

            self.uintOpt = uintOpt
            self.uint8Opt = uint8Opt
            self.uint16Opt = uint16Opt
            self.uint32Opt = uint32Opt
            self.uint64Opt = uint64Opt

            self.uintOptNil = uintOptNil
            self.uint8OptNil = uint8OptNil
            self.uint16OptNil = uint16OptNil
            self.uint32OptNil = uint32OptNil
            self.uint64OptNil = uint64OptNil
    }

    required init?(_ decoder: Decoder) {
        // Because all of our properties are constants and haven't been initialized yet
        // the <-- infix operator won't work here, so we'll use the methods on the
        // decoder to get our values

        uint = decoder.unsignedIntegerDictionary("uint") ?? [:]
        uint8 = decoder.unsignedIntegerDictionary("uint8") ?? [:]
        uint16 = decoder.unsignedIntegerDictionary("uint16") ?? [:]
        uint32 = decoder.unsignedIntegerDictionary("uint32") ?? [:]
        uint64 = decoder.unsignedIntegerDictionary("uint64") ?? [:]

        uintOpt = decoder.unsignedIntegerDictionary("uintOpt")
        uint8Opt = decoder.unsignedIntegerDictionary("uint8Opt")
        uint16Opt = decoder.unsignedIntegerDictionary("uint16Opt")
        uint32Opt = decoder.unsignedIntegerDictionary("uint32Opt")
        uint64Opt = decoder.unsignedIntegerDictionary("uint64Opt")

        uintOptNil = decoder.unsignedIntegerDictionary("uintOptNil")
        uint8OptNil = decoder.unsignedIntegerDictionary("uint8OptNil")
        uint16OptNil = decoder.unsignedIntegerDictionary("uint16OptNil")
        uint32OptNil = decoder.unsignedIntegerDictionary("uint32OptNil")
        uint64OptNil = decoder.unsignedIntegerDictionary("uint64OptNil")

    }

    func encode(encoder: Encoder) {
        encoder.addUnsignedIntegerDictionary(uint, key: "uint")
        encoder.addUnsignedIntegerDictionary(uint8, key: "uint8")
        encoder.addUnsignedIntegerDictionary(uint16, key: "uint16")
        encoder.addUnsignedIntegerDictionary(uint32, key: "uint32")
        encoder.addUnsignedIntegerDictionary(uint64, key: "uint64")

        encoder.addUnsignedIntegerDictionary(uintOpt, key: "uintOpt")
        encoder.addUnsignedIntegerDictionary(uint8Opt, key: "uint8Opt")
        encoder.addUnsignedIntegerDictionary(uint16Opt, key: "uint16Opt")
        encoder.addUnsignedIntegerDictionary(uint32Opt, key: "uint32Opt")
        encoder.addUnsignedIntegerDictionary(uint64Opt, key: "uint64Opt")
        
        encoder.addUnsignedIntegerDictionary(uintOptNil, key: "uintOptNil")
        encoder.addUnsignedIntegerDictionary(uint8OptNil, key: "uint8OptNil")
        encoder.addUnsignedIntegerDictionary(uint16OptNil, key: "uint16OptNil")
        encoder.addUnsignedIntegerDictionary(uint32OptNil, key: "uint32OptNil")
        encoder.addUnsignedIntegerDictionary(uint64OptNil, key: "uint64OptNil")
    }
}
