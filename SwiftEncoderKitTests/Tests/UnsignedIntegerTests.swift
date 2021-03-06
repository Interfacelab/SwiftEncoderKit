//
//  UnsignedIntegerTests.swift
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


import XCTest

class UnsignedIntegerTests: XCTestCase {

    func testIntegerEncodingDecoding() {
        let fileName = "/tmp/unsigned.plist"
        let model = UnsignedIntegerModel()

        model.uint = UInt.max
        model.uint8 = UInt8.max
        model.uint16 = UInt16.max
        model.uint32 = UInt32.max
        model.uint64 = UInt64.max

        model.uintOpt = UInt.max
        model.uint8Opt = UInt8.max
        model.uint16Opt = UInt16.max
        model.uint32Opt = UInt32.max
        model.uint64Opt = UInt64.max

        model.uintOptNil = nil
        model.uint8OptNil = nil
        model.uint16OptNil = nil
        model.uint32OptNil = nil
        model.uint64OptNil = nil

        Encoder(model).writeToFile(fileName)
        let reModel: UnsignedIntegerModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.uint == UInt.max)
            XCTAssert(reModel!.uint8 == UInt8.max)
            XCTAssert(reModel!.uint16 == UInt16.max)
            XCTAssert(reModel!.uint32 == UInt32.max)
            XCTAssert(reModel!.uint64 == UInt64.max)

            XCTAssert(reModel!.uintOpt! == UInt.max)
            XCTAssert(reModel!.uint8Opt! == UInt8.max)
            XCTAssert(reModel!.uint16Opt! == UInt16.max)
            XCTAssert(reModel!.uint32Opt! == UInt32.max)
            XCTAssert(reModel!.uint64Opt! == UInt64.max)

            XCTAssert(reModel!.uintOptNil == nil)
            XCTAssert(reModel!.uint8OptNil == nil)
            XCTAssert(reModel!.uint16OptNil == nil)
            XCTAssert(reModel!.uint32OptNil == nil)
            XCTAssert(reModel!.uint64OptNil == nil)
        }
    }

    func testArrayEncodingDecoding() {
        let fileName = "/tmp/uuintArray.plist"

        let model = UnsignedIntegerArrayModel()

        model.uintA = [0, UInt.max / 2, UInt.max]
        model.uint8A = [0, UInt8.max / 2, UInt8.max]
        model.uint16A = [0, UInt16.max / 2, UInt16.max]
        model.uint32A = [0, UInt32.max / 2, UInt32.max]
        model.uint64A = [0, UInt64.max / 2, UInt64.max]

        model.uintAOpt = [0, UInt.max / 2, UInt.max]
        model.uint8AOpt = [0, UInt8.max / 2, UInt8.max]
        model.uint16AOpt = [0, UInt16.max / 2, UInt16.max]
        model.uint32AOpt = [0, UInt32.max / 2, UInt32.max]
        model.uint64AOpt = [0, UInt64.max / 2, UInt64.max]

        model.uintAOptNil = nil
        model.uint8AOptNil = nil
        model.uint16AOptNil = nil
        model.uint32AOptNil = nil
        model.uint64AOptNil = nil

        Encoder(model).writeToFile(fileName)
        let reModel: UnsignedIntegerArrayModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.uintA == [0, UInt.max / 2, UInt.max])
            XCTAssert(reModel!.uint8A == [0, UInt8.max / 2, UInt8.max])
            XCTAssert(reModel!.uint16A == [0, UInt16.max / 2, UInt16.max])
            XCTAssert(reModel!.uint32A == [0, UInt32.max / 2, UInt32.max])
            XCTAssert(reModel!.uint64A == [0, UInt64.max / 2, UInt64.max])

            XCTAssert(reModel!.uintAOpt! == [0, UInt.max / 2, UInt.max])
            XCTAssert(reModel!.uint8AOpt! == [0, UInt8.max / 2, UInt8.max])
            XCTAssert(reModel!.uint16AOpt! == [0, UInt16.max / 2, UInt16.max])
            XCTAssert(reModel!.uint32AOpt! == [0, UInt32.max / 2, UInt32.max])
            XCTAssert(reModel!.uint64AOpt! == [0, UInt64.max / 2, UInt64.max])

            XCTAssert(reModel!.uintAOptNil == nil)
            XCTAssert(reModel!.uint8AOptNil == nil)
            XCTAssert(reModel!.uint16AOptNil == nil)
            XCTAssert(reModel!.uint32AOptNil == nil)
            XCTAssert(reModel!.uint64AOptNil == nil)
        }
    }

    func testConstIntegerEncodingDecoding() {
        let fileName = "/tmp/constUnsigned.plist"
        let model = ConstUnsignedIntegerModel(uint: UInt.max, uint8: UInt8.max, uint16: UInt16.max,
            uint32: UInt32.max, uint64: UInt64.max, uintOpt: UInt.max, uint8Opt: UInt8.max,
            uint16Opt: UInt16.max, uint32Opt: UInt32.max, uint64Opt: UInt64.max, uintOptNil: nil,
            uint8OptNil: nil, uint16OptNil: nil, uint32OptNil: nil, uint64OptNil: nil)

        Encoder(model).writeToFile(fileName)
        let reModel: ConstUnsignedIntegerModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.uint == UInt.max)
            XCTAssert(reModel!.uint8 == UInt8.max)
            XCTAssert(reModel!.uint16 == UInt16.max)
            XCTAssert(reModel!.uint32 == UInt32.max)
            XCTAssert(reModel!.uint64 == UInt64.max)

            XCTAssert(reModel!.uintOpt! == UInt.max)
            XCTAssert(reModel!.uint8Opt! == UInt8.max)
            XCTAssert(reModel!.uint16Opt! == UInt16.max)
            XCTAssert(reModel!.uint32Opt! == UInt32.max)
            XCTAssert(reModel!.uint64Opt! == UInt64.max)

            XCTAssert(reModel!.uintOptNil == nil)
            XCTAssert(reModel!.uint8OptNil == nil)
            XCTAssert(reModel!.uint16OptNil == nil)
            XCTAssert(reModel!.uint32OptNil == nil)
            XCTAssert(reModel!.uint64OptNil == nil)
        }
    }

    func testConstArrayEncodingDecoding() {
        let fileName = "/tmp/constUIntArray.plist"

        let uintA = [0, UInt.max / 2, UInt.max]
        let uint8A = [0, UInt8.max / 2, UInt8.max]
        let uint16A = [0, UInt16.max / 2, UInt16.max]
        let uint32A = [0, UInt32.max / 2, UInt32.max]
        let uint64A = [0, UInt64.max / 2, UInt64.max]

        let model = ConstUnsignedIntegerArrayModel(uintA: uintA, uint8A: uint8A, uint16A: uint16A,
            uint32A: uint32A, uint64A: uint64A, uintAOpt: uintA, uint8AOpt: uint8A,
            uint16AOpt: uint16A, uint32AOpt: uint32A, uint64AOpt: uint64A, uintAOptNil: nil,
            uint8AOptNil: nil, uint16AOptNil: nil, uint32AOptNil: nil, uint64AOptNil: nil)

        Encoder(model).writeToFile(fileName)
        let reModel: ConstUnsignedIntegerArrayModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.uintA == [0, UInt.max / 2, UInt.max])
            XCTAssert(reModel!.uint8A == [0, UInt8.max / 2, UInt8.max])
            XCTAssert(reModel!.uint16A == [0, UInt16.max / 2, UInt16.max])
            XCTAssert(reModel!.uint32A == [0, UInt32.max / 2, UInt32.max])
            XCTAssert(reModel!.uint64A == [0, UInt64.max / 2, UInt64.max])

            XCTAssert(reModel!.uintAOpt! == [0, UInt.max / 2, UInt.max])
            XCTAssert(reModel!.uint8AOpt! == [0, UInt8.max / 2, UInt8.max])
            XCTAssert(reModel!.uint16AOpt! == [0, UInt16.max / 2, UInt16.max])
            XCTAssert(reModel!.uint32AOpt! == [0, UInt32.max / 2, UInt32.max])
            XCTAssert(reModel!.uint64AOpt! == [0, UInt64.max / 2, UInt64.max])
            
            XCTAssert(reModel!.uintAOptNil == nil)
            XCTAssert(reModel!.uint8AOptNil == nil)
            XCTAssert(reModel!.uint16AOptNil == nil)
            XCTAssert(reModel!.uint32AOptNil == nil)
            XCTAssert(reModel!.uint64AOptNil == nil)
        }
    }

    func testDictionaryEncodingDecoding() {
        let fileName = "/tmp/uintDict.plist"

        let model = UnsignedIntegerDictionaryModel()

        model.uint = ["a": 0, "b": UInt.max / 2, "c": UInt.max]
        model.uint8 = ["d": 0, "e": UInt8.max / 2, "f": UInt8.max]
        model.uint16 = ["e": 0, "g": UInt16.max / 2, "h": UInt16.max]
        model.uint32 = ["f": 0, "i": UInt32.max / 2, "j": UInt32.max]
        model.uint64 = ["g": 0, "h": UInt64.max / 2, "k": UInt64.max]

        model.uintOpt = ["a": 0, "b": UInt.max / 3, "c": UInt.max]
        model.uint8Opt = ["d": 0, "e": UInt8.max / 3, "f": UInt8.max]
        model.uint16Opt = ["e": 0, "g": UInt16.max / 3, "h": UInt16.max]
        model.uint32Opt = ["f": 0, "i": UInt32.max / 3, "j": UInt32.max]
        model.uint64Opt = ["g": 0, "h": UInt64.max / 3, "k": UInt64.max]

        model.uintOptNil = nil
        model.uint8OptNil = nil
        model.uint16OptNil = nil
        model.uint32OptNil = nil
        model.uint64OptNil = nil

        Encoder(model).writeToFile(fileName)
        let reModel: UnsignedIntegerDictionaryModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.uint == ["a": 0, "b": UInt.max / 2, "c": UInt.max])
            XCTAssert(reModel!.uint8 == ["d": 0, "e": UInt8.max / 2, "f": UInt8.max])
            XCTAssert(reModel!.uint16 == ["e": 0, "g": UInt16.max / 2, "h": UInt16.max])
            XCTAssert(reModel!.uint32 == ["f": 0, "i": UInt32.max / 2, "j": UInt32.max])
            XCTAssert(reModel!.uint64 == ["g": 0, "h": UInt64.max / 2, "k": UInt64.max])

            XCTAssert(reModel!.uintOpt! == ["a": 0, "b": UInt.max / 3, "c": UInt.max])
            XCTAssert(reModel!.uint8Opt! == ["d": 0, "e": UInt8.max / 3, "f": UInt8.max])
            XCTAssert(reModel!.uint16Opt! == ["e": 0, "g": UInt16.max / 3, "h": UInt16.max])
            XCTAssert(reModel!.uint32Opt! == ["f": 0, "i": UInt32.max / 3, "j": UInt32.max])
            XCTAssert(reModel!.uint64Opt! == ["g": 0, "h": UInt64.max / 3, "k": UInt64.max])

            XCTAssert(reModel!.uintOptNil == nil)
            XCTAssert(reModel!.uint8OptNil == nil)
            XCTAssert(reModel!.uint16OptNil == nil)
            XCTAssert(reModel!.uint32OptNil == nil)
            XCTAssert(reModel!.uint64OptNil == nil)
        }
    }

    func testConstDictionaryEncodingDecoding() {
        let fileName = "/tmp/constIntDict.plist"

        let uint = ["a": 0, "b": UInt.max / 2, "c": UInt.max]
        let uint8 = ["d": 0, "e": UInt8.max / 2, "f": UInt8.max]
        let uint16 = ["e": 0, "g": UInt16.max / 2, "h": UInt16.max]
        let uint32 = ["f": 0, "i": UInt32.max / 2, "j": UInt32.max]
        let uint64 = ["g": 0, "h": UInt64.max / 2, "k": UInt64.max]

        let uintOpt = ["a": 0, "b": UInt.max / 3, "c": UInt.max]
        let uint8Opt = ["d": 0, "e": UInt8.max / 3, "f": UInt8.max]
        let uint16Opt = ["e": 0, "g": UInt16.max / 3, "h": UInt16.max]
        let uint32Opt = ["f": 0, "i": UInt32.max / 3, "j": UInt32.max]
        let uint64Opt = ["g": 0, "h": UInt64.max / 3, "k": UInt64.max]

        let model = ConstUnsignedIntegerDictionaryModel(uint: uint, uint8: uint8, uint16: uint16,
            uint32: uint32, uint64: uint64, uintOpt: uintOpt, uint8Opt: uint8Opt,
            uint16Opt: uint16Opt, uint32Opt: uint32Opt, uint64Opt: uint64Opt, uintOptNil: nil,
            uint8OptNil: nil, uint16OptNil: nil, uint32OptNil: nil, uint64OptNil: nil)

        Encoder(model).writeToFile(fileName)
        let reModel: ConstUnsignedIntegerDictionaryModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.uint == ["a": 0, "b": UInt.max / 2, "c": UInt.max])
            XCTAssert(reModel!.uint8 == ["d": 0, "e": UInt8.max / 2, "f": UInt8.max])
            XCTAssert(reModel!.uint16 == ["e": 0, "g": UInt16.max / 2, "h": UInt16.max])
            XCTAssert(reModel!.uint32 == ["f": 0, "i": UInt32.max / 2, "j": UInt32.max])
            XCTAssert(reModel!.uint64 == ["g": 0, "h": UInt64.max / 2, "k": UInt64.max])

            XCTAssert(reModel!.uintOpt! == ["a": 0, "b": UInt.max / 3, "c": UInt.max])
            XCTAssert(reModel!.uint8Opt! == ["d": 0, "e": UInt8.max / 3, "f": UInt8.max])
            XCTAssert(reModel!.uint16Opt! == ["e": 0, "g": UInt16.max / 3, "h": UInt16.max])
            XCTAssert(reModel!.uint32Opt! == ["f": 0, "i": UInt32.max / 3, "j": UInt32.max])
            XCTAssert(reModel!.uint64Opt! == ["g": 0, "h": UInt64.max / 3, "k": UInt64.max])

            XCTAssert(reModel!.uintOptNil == nil)
            XCTAssert(reModel!.uint8OptNil == nil)
            XCTAssert(reModel!.uint16OptNil == nil)
            XCTAssert(reModel!.uint32OptNil == nil)
            XCTAssert(reModel!.uint64OptNil == nil)
        }
    }
}
