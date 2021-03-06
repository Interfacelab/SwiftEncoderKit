//
//  EnumDictionaryTests.swift
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


import XCTest

class EnumDictionaryTests: XCTestCase {

    func testDictionaryEncodingDecoding() {
        let fileName = "/tmp/enumDict.plist"

        let model = EnumDictionaryModel()

        model.int = ["a": .Value2, "b": .Value3]
        model.int8 = ["a": .Value3, "b": .Value3]
        model.int16 = ["a": .Value2, "b": .Value3]
        model.int32 = ["a": .Value3, "b": .Value3]
        model.int64 = ["a": .Value2, "b": .Value3]
        model.uint = ["a": .Value3, "b": .Value3]
        model.uint8 = ["a": .Value2, "b": .Value3]
        model.uint16 = ["a": .Value3, "b": .Value3]
        model.uint32 = ["a": .Value2, "b": .Value3]
        model.uint64 = ["a": .Value3, "b": .Value3]
        model.float = ["a": .Value2, "b": .Value3]
        model.double = ["a": .Value3, "b": .Value3]
        model.string = ["a": .Value2, "b": .Value3]
        model.character = ["a": .Value3, "b": .Value3]

        model.intOpt = ["a": .Value2, "b": .Value3]
        model.int8Opt = ["a": .Value3, "b": .Value3]
        model.int16Opt = ["a": .Value2, "b": .Value3]
        model.int32Opt = ["a": .Value3, "b": .Value3]
        model.int64Opt = ["a": .Value2, "b": .Value3]
        model.uintOpt = ["a": .Value3, "b": .Value3]
        model.uint8Opt = ["a": .Value2, "b": .Value3]
        model.uint16Opt = ["a": .Value3, "b": .Value3]
        model.uint32Opt = ["a": .Value2, "b": .Value3]
        model.uint64Opt = ["a": .Value3, "b": .Value3]
        model.floatOpt = ["a": .Value2, "b": .Value3]
        model.doubleOpt = ["a": .Value3, "b": .Value3]
        model.stringOpt = ["a": .Value2, "b": .Value3]
        model.characterOpt = ["a": .Value3, "b": .Value3]

        model.intOptNil = nil
        model.int8OptNil = nil
        model.int16OptNil = nil
        model.int32OptNil = nil
        model.int64OptNil = nil
        model.uintOptNil = nil
        model.uint8OptNil = nil
        model.uint16OptNil = nil
        model.uint32OptNil = nil
        model.uint64OptNil = nil
        model.floatOptNil = nil
        model.doubleOptNil = nil
        model.stringOptNil = nil
        model.characterOptNil = nil

        Encoder(model).writeToFile(fileName)
        let reModel: EnumDictionaryModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.int == ["a": .Value2, "b": .Value3])
            XCTAssert(reModel!.int8 == ["a": .Value3, "b": .Value3])
            XCTAssert(reModel!.int16 == ["a": .Value2, "b": .Value3])
            XCTAssert(reModel!.int32 == ["a": .Value3, "b": .Value3])
            XCTAssert(reModel!.int64 == ["a": .Value2, "b": .Value3])
            XCTAssert(reModel!.uint == ["a": .Value3, "b": .Value3])
            XCTAssert(reModel!.uint8 == ["a": .Value2, "b": .Value3])
            XCTAssert(reModel!.uint16 == ["a": .Value3, "b": .Value3])
            XCTAssert(reModel!.uint32 == ["a": .Value2, "b": .Value3])
            XCTAssert(reModel!.uint64 == ["a": .Value3, "b": .Value3])
            XCTAssert(reModel!.float == ["a": .Value2, "b": .Value3])
            XCTAssert(reModel!.double == ["a": .Value3, "b": .Value3])
            XCTAssert(reModel!.string == ["a": .Value2, "b": .Value3])
            XCTAssert(reModel!.character == ["a": .Value3, "b": .Value3])
            XCTAssert(reModel!.intOpt! == ["a": .Value2, "b": .Value3])
            XCTAssert(reModel!.int8Opt! == ["a": .Value3, "b": .Value3])
            XCTAssert(reModel!.int16Opt! == ["a": .Value2, "b": .Value3])
            XCTAssert(reModel!.int32Opt! == ["a": .Value3, "b": .Value3])
            XCTAssert(reModel!.int64Opt! == ["a": .Value2, "b": .Value3])
            XCTAssert(reModel!.uintOpt! == ["a": .Value3, "b": .Value3])
            XCTAssert(reModel!.uint8Opt! == ["a": .Value2, "b": .Value3])
            XCTAssert(reModel!.uint16Opt! == ["a": .Value3, "b": .Value3])
            XCTAssert(reModel!.uint32Opt! == ["a": .Value2, "b": .Value3])
            XCTAssert(reModel!.uint64Opt! == ["a": .Value3, "b": .Value3])
            XCTAssert(reModel!.floatOpt! == ["a": .Value2, "b": .Value3])
            XCTAssert(reModel!.doubleOpt! == ["a": .Value3, "b": .Value3])
            XCTAssert(reModel!.stringOpt! == ["a": .Value2, "b": .Value3])
            XCTAssert(reModel!.characterOpt! == ["a": .Value3, "b": .Value3])

            XCTAssert(reModel!.intOptNil == nil)
            XCTAssert(reModel!.int8OptNil == nil)
            XCTAssert(reModel!.int16OptNil == nil)
            XCTAssert(reModel!.int32OptNil == nil)
            XCTAssert(reModel!.int64OptNil == nil)
            XCTAssert(reModel!.uintOptNil == nil)
            XCTAssert(reModel!.uint8OptNil == nil)
            XCTAssert(reModel!.uint16OptNil == nil)
            XCTAssert(reModel!.uint32OptNil == nil)
            XCTAssert(reModel!.uint64OptNil == nil)
            XCTAssert(reModel!.floatOptNil == nil)
            XCTAssert(reModel!.doubleOptNil == nil)
            XCTAssert(reModel!.stringOptNil == nil)
            XCTAssert(reModel!.characterOptNil == nil)
        }
    }



    func testConstDictionaryEncodingDecoding() {
        let fileName = "/tmp/constEnumDict.plist"

        let int: [String: IntEnum] = ["a": .Value2, "b": .Value2]
        let int8: [String: Int8Enum] = ["a": .Value3, "b": .Value2]
        let int16: [String: Int16Enum] = ["a": .Value2, "b": .Value2]
        let int32: [String: Int32Enum] = ["a": .Value3, "b": .Value2]
        let int64: [String: Int64Enum] = ["a": .Value2, "b": .Value2]
        let uint: [String: UIntEnum] = ["a": .Value3, "b": .Value2]
        let uint8: [String: UInt8Enum] = ["a": .Value2, "b": .Value2]
        let uint16: [String: UInt16Enum] = ["a": .Value3, "b": .Value2]
        let uint32: [String: UInt32Enum] = ["a": .Value2, "b": .Value2]
        let uint64: [String: UInt64Enum] = ["a": .Value3, "b": .Value2]
        let float: [String: FloatEnum] = ["a": .Value2, "b": .Value2]
        let double: [String: DoubleEnum] = ["a": .Value3, "b": .Value2]
        let string: [String: StringEnum] = ["a": .Value2, "b": .Value2]
        let character: [String: CharacterEnum] = ["a": .Value3, "b": .Value2]

        let intOpt: [String: IntEnum] = ["a": .Value2, "b": .Value2]
        let int8Opt: [String: Int8Enum] = ["a": .Value3, "b": .Value2]
        let int16Opt: [String: Int16Enum] = ["a": .Value2, "b": .Value2]
        let int32Opt: [String: Int32Enum] = ["a": .Value3, "b": .Value2]
        let int64Opt: [String: Int64Enum] = ["a": .Value2, "b": .Value2]
        let uintOpt: [String: UIntEnum] = ["a": .Value3, "b": .Value2]
        let uint8Opt: [String: UInt8Enum] = ["a": .Value2, "b": .Value2]
        let uint16Opt: [String: UInt16Enum] = ["a": .Value3, "b": .Value2]
        let uint32Opt: [String: UInt32Enum] = ["a": .Value2, "b": .Value2]
        let uint64Opt: [String: UInt64Enum] = ["a": .Value3, "b": .Value2]
        let floatOpt: [String: FloatEnum] = ["a": .Value2, "b": .Value2]
        let doubleOpt: [String: DoubleEnum] = ["a": .Value3, "b": .Value2]
        let stringOpt: [String: StringEnum] = ["a": .Value2, "b": .Value2]
        let characterOpt: [String: CharacterEnum] = ["a": .Value3, "b": .Value2]

        let model = ConstEnumDictionaryModel(int: int,
            int8: int8,
            int16: int16,
            int32: int32,
            int64: int64,
            uint: uint,
            uint8: uint8,
            uint16: uint16,
            uint32: uint32,
            uint64: uint64,
            string: string,
            float: float,
            double: double,
            character: character,
            intOpt: intOpt,
            int8Opt: int8Opt,
            int16Opt: int16Opt,
            int32Opt: int32Opt,
            int64Opt: int64Opt,
            uintOpt: uintOpt,
            uint8Opt: uint8Opt,
            uint16Opt: uint16Opt,
            uint32Opt: uint32Opt,
            uint64Opt: uint64Opt,
            stringOpt: stringOpt,
            floatOpt: floatOpt,
            doubleOpt: doubleOpt,
            characterOpt: characterOpt,
            intOptNil: nil,
            int8OptNil: nil,
            int16OptNil: nil,
            int32OptNil: nil,
            int64OptNil: nil,
            uintOptNil: nil,
            uint8OptNil: nil,
            uint16OptNil: nil,
            uint32OptNil: nil,
            uint64OptNil: nil,
            stringOptNil: nil,
            floatOptNil: nil,
            doubleOptNil: nil,
            characterOptNil: nil)

        Encoder(model).writeToFile(fileName)
        let reModel: ConstEnumDictionaryModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.int == ["a": .Value2, "b": .Value2])
            XCTAssert(reModel!.int8 == ["a": .Value3, "b": .Value2])
            XCTAssert(reModel!.int16 == ["a": .Value2, "b": .Value2])
            XCTAssert(reModel!.int32 == ["a": .Value3, "b": .Value2])
            XCTAssert(reModel!.int64 == ["a": .Value2, "b": .Value2])
            XCTAssert(reModel!.uint == ["a": .Value3, "b": .Value2])
            XCTAssert(reModel!.uint8 == ["a": .Value2, "b": .Value2])
            XCTAssert(reModel!.uint16 == ["a": .Value3, "b": .Value2])
            XCTAssert(reModel!.uint32 == ["a": .Value2, "b": .Value2])
            XCTAssert(reModel!.uint64 == ["a": .Value3, "b": .Value2])
            XCTAssert(reModel!.float == ["a": .Value2, "b": .Value2])
            XCTAssert(reModel!.double == ["a": .Value3, "b": .Value2])
            XCTAssert(reModel!.string == ["a": .Value2, "b": .Value2])
            XCTAssert(reModel!.character == ["a": .Value3, "b": .Value2])

            XCTAssert(reModel!.intOpt! == ["a": .Value2, "b": .Value2])
            XCTAssert(reModel!.int8Opt! == ["a": .Value3, "b": .Value2])
            XCTAssert(reModel!.int16Opt! == ["a": .Value2, "b": .Value2])
            XCTAssert(reModel!.int32Opt! == ["a": .Value3, "b": .Value2])
            XCTAssert(reModel!.int64Opt! == ["a": .Value2, "b": .Value2])
            XCTAssert(reModel!.uintOpt! == ["a": .Value3, "b": .Value2])
            XCTAssert(reModel!.uint8Opt! == ["a": .Value2, "b": .Value2])
            XCTAssert(reModel!.uint16Opt! == ["a": .Value3, "b": .Value2])
            XCTAssert(reModel!.uint32Opt! == ["a": .Value2, "b": .Value2])
            XCTAssert(reModel!.uint64Opt! == ["a": .Value3, "b": .Value2])
            XCTAssert(reModel!.floatOpt! == ["a": .Value2, "b": .Value2])
            XCTAssert(reModel!.doubleOpt! == ["a": .Value3, "b": .Value2])
            XCTAssert(reModel!.stringOpt! == ["a": .Value2, "b": .Value2])
            XCTAssert(reModel!.characterOpt! == ["a": .Value3, "b": .Value2])

            XCTAssert(reModel!.intOptNil == nil)
            XCTAssert(reModel!.int8OptNil == nil)
            XCTAssert(reModel!.int16OptNil == nil)
            XCTAssert(reModel!.int32OptNil == nil)
            XCTAssert(reModel!.int64OptNil == nil)
            XCTAssert(reModel!.uintOptNil == nil)
            XCTAssert(reModel!.uint8OptNil == nil)
            XCTAssert(reModel!.uint16OptNil == nil)
            XCTAssert(reModel!.uint32OptNil == nil)
            XCTAssert(reModel!.uint64OptNil == nil)
            XCTAssert(reModel!.floatOptNil == nil)
            XCTAssert(reModel!.doubleOptNil == nil)
            XCTAssert(reModel!.stringOptNil == nil)
            XCTAssert(reModel!.characterOptNil == nil)
        }
    }

}
