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


class ConstSignedIntegerModel: Encodable {
    let int: Int
    let int8: Int8
    let int16: Int16
    let int32: Int32
    let int64: Int64

    let intOpt: Int?
    let int8Opt: Int8?
    let int16Opt: Int16?
    let int32Opt: Int32?
    let int64Opt: Int64?

    let intOptNil: Int?
    let int8OptNil: Int8?
    let int16OptNil: Int16?
    let int32OptNil: Int32?
    let int64OptNil: Int64?

    init(int: Int, int8: Int8, int16: Int16, int32: Int32, int64: Int64, intOpt: Int?,
        int8Opt: Int8?, int16Opt: Int16?, int32Opt: Int32?, int64Opt: Int64?, intOptNil: Int?,
        int8OptNil: Int8?, int16OptNil: Int16?, int32OptNil: Int32?, int64OptNil: Int64?) {
            self.int = int
            self.int8 = int8
            self.int16 = int16
            self.int32 = int32
            self.int64 = int64

            self.intOpt = intOpt
            self.int8Opt = int8Opt
            self.int16Opt = int16Opt
            self.int32Opt = int32Opt
            self.int64Opt = int64Opt

            self.intOptNil = intOptNil
            self.int8OptNil = int8OptNil
            self.int16OptNil = int16OptNil
            self.int32OptNil = int32OptNil
            self.int64OptNil = int64OptNil
    }

    required init?(_ decoder: Decoder) {
        // Because all of our properties are constants and haven't been initialized yet
        // the <-- infix operator won't work here, so we'll use the methods on the
        // decoder to get our values
        
        int = decoder.integer("int") ?? 0
        int8 = decoder.integer("int8") ?? 0
        int16 = decoder.integer("int16") ?? 0
        int32 = decoder.integer("int32") ?? 0
        int64 = decoder.integer("int64") ?? 0

        intOpt = decoder.integer("intOpt")
        int8Opt = decoder.integer("int8Opt")
        int16Opt = decoder.integer("int16Opt")
        int32Opt = decoder.integer("int32Opt")
        int64Opt = decoder.integer("int64Opt")

        intOptNil = decoder.integer("intOptNil")
        int8OptNil = decoder.integer("int8OptNil")
        int16OptNil = decoder.integer("int16OptNil")
        int32OptNil = decoder.integer("int32OptNil")
        int64OptNil = decoder.integer("int64OptNil")
    }

    func encode(encoder: Encoder) {
        encoder.addInteger(int, key: "int")
        encoder.addInteger(int8, key: "int8")
        encoder.addInteger(int16, key: "int16")
        encoder.addInteger(int32, key: "int32")
        encoder.addInteger(int64, key: "int64")

        encoder.addInteger(intOpt, key: "intOpt")
        encoder.addInteger(int8Opt, key: "int8Opt")
        encoder.addInteger(int16Opt, key: "int16Opt")
        encoder.addInteger(int32Opt, key: "int32Opt")
        encoder.addInteger(int64Opt, key: "int64Opt")
        
        encoder.addInteger(intOptNil, key: "intOptNil")
        encoder.addInteger(int8OptNil, key: "int8OptNil")
        encoder.addInteger(int16OptNil, key: "int16OptNil")
        encoder.addInteger(int32OptNil, key: "int32OptNil")
        encoder.addInteger(int64OptNil, key: "int64OptNil")
    }
}
