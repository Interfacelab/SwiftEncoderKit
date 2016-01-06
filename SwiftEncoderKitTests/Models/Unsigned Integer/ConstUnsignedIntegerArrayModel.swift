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


class ConstUnsignedIntegerArrayModel: Encodable {
    let uintA: [UInt]
    let uint8A: [UInt8]
    let uint16A: [UInt16]
    let uint32A: [UInt32]
    let uint64A: [UInt64]

    let uintAOpt: [UInt]?
    let uint8AOpt: [UInt8]?
    let uint16AOpt: [UInt16]?
    let uint32AOpt: [UInt32]?
    let uint64AOpt: [UInt64]?

    let uintAOptNil: [UInt]?
    let uint8AOptNil: [UInt8]?
    let uint16AOptNil: [UInt16]?
    let uint32AOptNil: [UInt32]?
    let uint64AOptNil: [UInt64]?

    init(uintA: [UInt], uint8A: [UInt8], uint16A: [UInt16], uint32A: [UInt32], uint64A: [UInt64],
        uintAOpt: [UInt]?, uint8AOpt: [UInt8]?, uint16AOpt: [UInt16]?, uint32AOpt: [UInt32]?,
        uint64AOpt: [UInt64]?, uintAOptNil: [UInt]?, uint8AOptNil: [UInt8]?,
        uint16AOptNil: [UInt16]?, uint32AOptNil: [UInt32]?, uint64AOptNil: [UInt64]?) {
            self.uintA = uintA
            self.uint8A = uint8A
            self.uint16A = uint16A
            self.uint32A = uint32A
            self.uint64A = uint64A

            self.uintAOpt = uintAOpt
            self.uint8AOpt = uint8AOpt
            self.uint16AOpt = uint16AOpt
            self.uint32AOpt = uint32AOpt
            self.uint64AOpt = uint64AOpt

            self.uintAOptNil = uintAOptNil
            self.uint8AOptNil = uint8AOptNil
            self.uint16AOptNil = uint16AOptNil
            self.uint32AOptNil = uint32AOptNil
            self.uint64AOptNil = uint64AOptNil
    }

    required init?(_ decoder: Decoder) {
        // Because all of our properties are constants and haven't been initialized yet
        // the <-- infix operator won't work here, so we'll use the methods on the
        // decoder to get our values
        
        uintA = decoder.unsignedIntegerArray("uintA") ?? []
        uint8A = decoder.unsignedIntegerArray("uint8A") ?? []
        uint16A = decoder.unsignedIntegerArray("uint16A") ?? []
        uint32A = decoder.unsignedIntegerArray("uint32A") ?? []
        uint64A = decoder.unsignedIntegerArray("uint64A") ?? []

        uintAOpt = decoder.unsignedIntegerArray("uintAOpt")
        uint8AOpt = decoder.unsignedIntegerArray("uint8AOpt")
        uint16AOpt = decoder.unsignedIntegerArray("uint16AOpt")
        uint32AOpt = decoder.unsignedIntegerArray("uint32AOpt")
        uint64AOpt = decoder.unsignedIntegerArray("uint64AOpt")

        uintAOptNil = decoder.unsignedIntegerArray("uintAOptNil")
        uint8AOptNil = decoder.unsignedIntegerArray("uint8AOptNil")
        uint16AOptNil = decoder.unsignedIntegerArray("uint16AOptNil")
        uint32AOptNil = decoder.unsignedIntegerArray("uint32AOptNil")
        uint64AOptNil = decoder.unsignedIntegerArray("uint64AOptNil")
    }

    func encode(encoder: Encoder) {
        encoder.addUnsignedIntegerArray(uintA, key: "uintA")
        encoder.addUnsignedIntegerArray(uint8A, key: "uint8A")
        encoder.addUnsignedIntegerArray(uint16A, key: "uint16A")
        encoder.addUnsignedIntegerArray(uint32A, key: "uint32A")
        encoder.addUnsignedIntegerArray(uint64A, key: "uint64A")

        encoder.addUnsignedIntegerArray(uintAOpt, key: "uintAOpt")
        encoder.addUnsignedIntegerArray(uint8AOpt, key: "uint8AOpt")
        encoder.addUnsignedIntegerArray(uint16AOpt, key: "uint16AOpt")
        encoder.addUnsignedIntegerArray(uint32AOpt, key: "uint32AOpt")
        encoder.addUnsignedIntegerArray(uint64AOpt, key: "uint64AOpt")

        encoder.addUnsignedIntegerArray(uintAOptNil, key: "uintAOptNil")
        encoder.addUnsignedIntegerArray(uint8AOptNil, key: "uint8AOptNil")
        encoder.addUnsignedIntegerArray(uint16AOptNil, key: "uint16AOptNil")
        encoder.addUnsignedIntegerArray(uint32AOptNil, key: "uint32AOptNil")
        encoder.addUnsignedIntegerArray(uint64AOptNil, key: "uint64AOptNil")
    }
}
