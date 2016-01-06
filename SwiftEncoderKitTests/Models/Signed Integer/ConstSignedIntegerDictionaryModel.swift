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


class ConstSignedIntegerDictionaryModel: Encodable {
    let int: [String: Int]
    let int8: [String: Int8]
    let int16: [String: Int16]
    let int32: [String: Int32]
    let int64: [String: Int64]

    let intOpt: [String: Int]?
    let int8Opt: [String: Int8]?
    let int16Opt: [String: Int16]?
    let int32Opt: [String: Int32]?
    let int64Opt: [String: Int64]?

    let intOptNil: [String: Int]?
    let int8OptNil: [String: Int8]?
    let int16OptNil: [String: Int16]?
    let int32OptNil: [String: Int32]?
    let int64OptNil: [String: Int64]?

    init(int: [String: Int], int8: [String: Int8], int16: [String: Int16], int32: [String: Int32],
        int64: [String: Int64], intOpt: [String: Int]?, int8Opt: [String: Int8]?,
        int16Opt: [String: Int16]?, int32Opt: [String: Int32]?, int64Opt: [String: Int64]?,
        intOptNil: [String: Int]?, int8OptNil: [String: Int8]?, int16OptNil: [String: Int16]?,
        int32OptNil: [String: Int32]?, int64OptNil: [String: Int64]?) {
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

        int = decoder.integerDictionary("int") ?? [:]
        int8 = decoder.integerDictionary("int8") ?? [:]
        int16 = decoder.integerDictionary("int16") ?? [:]
        int32 = decoder.integerDictionary("int32") ?? [:]
        int64 = decoder.integerDictionary("int64") ?? [:]

        intOpt = decoder.integerDictionary("intOpt")
        int8Opt = decoder.integerDictionary("int8Opt")
        int16Opt = decoder.integerDictionary("int16Opt")
        int32Opt = decoder.integerDictionary("int32Opt")
        int64Opt = decoder.integerDictionary("int64Opt")

        intOptNil = decoder.integerDictionary("intOptNil")
        int8OptNil = decoder.integerDictionary("int8OptNil")
        int16OptNil = decoder.integerDictionary("int16OptNil")
        int32OptNil = decoder.integerDictionary("int32OptNil")
        int64OptNil = decoder.integerDictionary("int64OptNil")

    }

    func encode(encoder: Encoder) {
        encoder.addIntegerDictionary(int, key: "int")
        encoder.addIntegerDictionary(int8, key: "int8")
        encoder.addIntegerDictionary(int16, key: "int16")
        encoder.addIntegerDictionary(int32, key: "int32")
        encoder.addIntegerDictionary(int64, key: "int64")

        encoder.addIntegerDictionary(intOpt, key: "intOpt")
        encoder.addIntegerDictionary(int8Opt, key: "int8Opt")
        encoder.addIntegerDictionary(int16Opt, key: "int16Opt")
        encoder.addIntegerDictionary(int32Opt, key: "int32Opt")
        encoder.addIntegerDictionary(int64Opt, key: "int64Opt")

        encoder.addIntegerDictionary(intOptNil, key: "intOptNil")
        encoder.addIntegerDictionary(int8OptNil, key: "int8OptNil")
        encoder.addIntegerDictionary(int16OptNil, key: "int16OptNil")
        encoder.addIntegerDictionary(int32OptNil, key: "int32OptNil")
        encoder.addIntegerDictionary(int64OptNil, key: "int64OptNil")
    }
}
