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


class ConstUnsignedIntegerModel: Encodable {
    let uint: UInt
    let uint8: UInt8
    let uint16: UInt16
    let uint32: UInt32
    let uint64: UInt64

    let uintOpt: UInt?
    let uint8Opt: UInt8?
    let uint16Opt: UInt16?
    let uint32Opt: UInt32?
    let uint64Opt: UInt64?

    let uintOptNil: UInt?
    let uint8OptNil: UInt8?
    let uint16OptNil: UInt16?
    let uint32OptNil: UInt32?
    let uint64OptNil: UInt64?

    init(uint: UInt, uint8: UInt8, uint16: UInt16, uint32: UInt32, uint64: UInt64, uintOpt: UInt?,
        uint8Opt: UInt8?, uint16Opt: UInt16?, uint32Opt: UInt32?, uint64Opt: UInt64?, uintOptNil: UInt?,
        uint8OptNil: UInt8?, uint16OptNil: UInt16?, uint32OptNil: UInt32?, uint64OptNil: UInt64?) {
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
        
        uint = decoder.unsignedInteger("uint") ?? 0
        uint8 = decoder.unsignedInteger("uint8") ?? 0
        uint16 = decoder.unsignedInteger("uint16") ?? 0
        uint32 = decoder.unsignedInteger("uint32") ?? 0
        uint64 = decoder.unsignedInteger("uint64") ?? 0

        uintOpt = decoder.unsignedInteger("uintOpt")
        uint8Opt = decoder.unsignedInteger("uint8Opt")
        uint16Opt = decoder.unsignedInteger("uint16Opt")
        uint32Opt = decoder.unsignedInteger("uint32Opt")
        uint64Opt = decoder.unsignedInteger("uint64Opt")

        uintOptNil = decoder.unsignedInteger("uintOptNil")
        uint8OptNil = decoder.unsignedInteger("uint8OptNil")
        uint16OptNil = decoder.unsignedInteger("uint16OptNil")
        uint32OptNil = decoder.unsignedInteger("uint32OptNil")
        uint64OptNil = decoder.unsignedInteger("uint64OptNil")
    }

    func encode(encoder: Encoder) {
        encoder.addUnsignedInteger(uint, key: "uint")
        encoder.addUnsignedInteger(uint8, key: "uint8")
        encoder.addUnsignedInteger(uint16, key: "uint16")
        encoder.addUnsignedInteger(uint32, key: "uint32")
        encoder.addUnsignedInteger(uint64, key: "uint64")
        
        encoder.addUnsignedInteger(uintOpt, key: "uintOpt")
        encoder.addUnsignedInteger(uint8Opt, key: "uint8Opt")
        encoder.addUnsignedInteger(uint16Opt, key: "uint16Opt")
        encoder.addUnsignedInteger(uint32Opt, key: "uint32Opt")
        encoder.addUnsignedInteger(uint64Opt, key: "uint64Opt")

        encoder.addUnsignedInteger(uintOptNil, key: "uintOptNil")
        encoder.addUnsignedInteger(uint8OptNil, key: "uint8OptNil")
        encoder.addUnsignedInteger(uint16OptNil, key: "uint16OptNil")
        encoder.addUnsignedInteger(uint32OptNil, key: "uint32OptNil")
        encoder.addUnsignedInteger(uint64OptNil, key: "uint64OptNil")
    }
}
