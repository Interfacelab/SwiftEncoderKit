//
//  EnumTests.swift
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

class EnumTests: XCTestCase {

    func testEnumEncodingDecoding() {
        let fileName = "/tmp/enum.plist"

        let model = EnumModel()

        model.int = .Value2
        model.int8 = .Value3
        model.int16 = .Value2
        model.int32 = .Value3
        model.int64 = .Value2
        model.uint = .Value3
        model.uint8 = .Value2
        model.uint16 = .Value3
        model.uint32 = .Value2
        model.uint64 = .Value3
        model.float = .Value2
        model.double = .Value3
        model.string = .Value2
        model.character = .Value3

        model.intOpt = .Value2
        model.int8Opt = .Value3
        model.int16Opt = .Value2
        model.int32Opt = .Value3
        model.int64Opt = .Value2
        model.uintOpt = .Value3
        model.uint8Opt = .Value2
        model.uint16Opt = .Value3
        model.uint32Opt = .Value2
        model.uint64Opt = .Value3
        model.floatOpt = .Value2
        model.doubleOpt = .Value3
        model.stringOpt = .Value2
        model.characterOpt = .Value3

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
        let reModel: EnumModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.int == .Value2)
            XCTAssert(reModel!.int8 == .Value3)
            XCTAssert(reModel!.int16 == .Value2)
            XCTAssert(reModel!.int32 == .Value3)
            XCTAssert(reModel!.int64 == .Value2)
            XCTAssert(reModel!.uint == .Value3)
            XCTAssert(reModel!.uint8 == .Value2)
            XCTAssert(reModel!.uint16 == .Value3)
            XCTAssert(reModel!.uint32 == .Value2)
            XCTAssert(reModel!.uint64 == .Value3)
            XCTAssert(reModel!.float == .Value2)
            XCTAssert(reModel!.double == .Value3)
            XCTAssert(reModel!.string == .Value2)
            XCTAssert(reModel!.character == .Value3)

            XCTAssert(reModel!.intOpt! == .Value2)
            XCTAssert(reModel!.int8Opt! == .Value3)
            XCTAssert(reModel!.int16Opt! == .Value2)
            XCTAssert(reModel!.int32Opt! == .Value3)
            XCTAssert(reModel!.int64Opt! == .Value2)
            XCTAssert(reModel!.uintOpt! == .Value3)
            XCTAssert(reModel!.uint8Opt! == .Value2)
            XCTAssert(reModel!.uint16Opt! == .Value3)
            XCTAssert(reModel!.uint32Opt! == .Value2)
            XCTAssert(reModel!.uint64Opt! == .Value3)
            XCTAssert(reModel!.floatOpt! == .Value2)
            XCTAssert(reModel!.doubleOpt! == .Value3)
            XCTAssert(reModel!.stringOpt! == .Value2)
            XCTAssert(reModel!.characterOpt! == .Value3)

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

    func testConstEnumEncodingDecoding() {
        let fileName = "/tmp/constEnum.plist"

        let int: IntEnum = .Value2
        let int8: Int8Enum = .Value3
        let int16: Int16Enum = .Value2
        let int32: Int32Enum = .Value3
        let int64: Int64Enum = .Value2
        let uint: UIntEnum = .Value3
        let uint8: UInt8Enum = .Value2
        let uint16: UInt16Enum = .Value3
        let uint32: UInt32Enum = .Value2
        let uint64: UInt64Enum = .Value3
        let float: FloatEnum = .Value2
        let double: DoubleEnum = .Value3
        let string: StringEnum = .Value2
        let character: CharacterEnum = .Value3

        let intOpt: IntEnum = .Value2
        let int8Opt: Int8Enum = .Value3
        let int16Opt: Int16Enum = .Value2
        let int32Opt: Int32Enum = .Value3
        let int64Opt: Int64Enum = .Value2
        let uintOpt: UIntEnum = .Value3
        let uint8Opt: UInt8Enum = .Value2
        let uint16Opt: UInt16Enum = .Value3
        let uint32Opt: UInt32Enum = .Value2
        let uint64Opt: UInt64Enum = .Value3
        let floatOpt: FloatEnum = .Value2
        let doubleOpt: DoubleEnum = .Value3
        let stringOpt: StringEnum = .Value2
        let characterOpt: CharacterEnum = .Value3

        let model = ConstEnumModel(int: int,
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
        let reModel: ConstEnumModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.int == .Value2)
            XCTAssert(reModel!.int8 == .Value3)
            XCTAssert(reModel!.int16 == .Value2)
            XCTAssert(reModel!.int32 == .Value3)
            XCTAssert(reModel!.int64 == .Value2)
            XCTAssert(reModel!.uint == .Value3)
            XCTAssert(reModel!.uint8 == .Value2)
            XCTAssert(reModel!.uint16 == .Value3)
            XCTAssert(reModel!.uint32 == .Value2)
            XCTAssert(reModel!.uint64 == .Value3)
            XCTAssert(reModel!.float == .Value2)
            XCTAssert(reModel!.double == .Value3)
            XCTAssert(reModel!.string == .Value2)
            XCTAssert(reModel!.character == .Value3)

            XCTAssert(reModel!.intOpt! == .Value2)
            XCTAssert(reModel!.int8Opt! == .Value3)
            XCTAssert(reModel!.int16Opt! == .Value2)
            XCTAssert(reModel!.int32Opt! == .Value3)
            XCTAssert(reModel!.int64Opt! == .Value2)
            XCTAssert(reModel!.uintOpt! == .Value3)
            XCTAssert(reModel!.uint8Opt! == .Value2)
            XCTAssert(reModel!.uint16Opt! == .Value3)
            XCTAssert(reModel!.uint32Opt! == .Value2)
            XCTAssert(reModel!.uint64Opt! == .Value3)
            XCTAssert(reModel!.floatOpt! == .Value2)
            XCTAssert(reModel!.doubleOpt! == .Value3)
            XCTAssert(reModel!.stringOpt! == .Value2)
            XCTAssert(reModel!.characterOpt! == .Value3)

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
