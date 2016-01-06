//
//  SignedIntegerTests.swift
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

class SignedIntegerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIntegerEncodingDecoding() {
        let fileName = "/tmp/signed.plist"
        let model = SignedIntegerModel()

        model.int = Int.max
        model.int8 = Int8.max
        model.int16 = Int16.max
        model.int32 = Int32.max
        model.int64 = Int64.max

        model.intOpt = Int.max
        model.int8Opt = Int8.max
        model.int16Opt = Int16.max
        model.int32Opt = Int32.max
        model.int64Opt = Int64.max

        model.intOptNil = nil
        model.int8OptNil = nil
        model.int16OptNil = nil
        model.int32OptNil = nil
        model.int64OptNil = nil

        Encoder(model).writeToFile(fileName)
        let reModel:SignedIntegerModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.int == Int.max)
            XCTAssert(reModel!.int8 == Int8.max)
            XCTAssert(reModel!.int16 == Int16.max)
            XCTAssert(reModel!.int32 == Int32.max)
            XCTAssert(reModel!.int64 == Int64.max)

            XCTAssert(reModel!.intOpt! == Int.max)
            XCTAssert(reModel!.int8Opt! == Int8.max)
            XCTAssert(reModel!.int16Opt! == Int16.max)
            XCTAssert(reModel!.int32Opt! == Int32.max)
            XCTAssert(reModel!.int64Opt! == Int64.max)

            XCTAssert(reModel!.intOptNil == nil)
            XCTAssert(reModel!.int8OptNil == nil)
            XCTAssert(reModel!.int16OptNil == nil)
            XCTAssert(reModel!.int32OptNil == nil)
            XCTAssert(reModel!.int64OptNil == nil)
        }
    }

    func testArrayEncodingDecoding() {
        let fileName = "/tmp/intArray.plist"

        let model = SignedIntegerArrayModel()

        model.intA = [0, Int.max / 2, Int.max]
        model.int8A = [0, Int8.max / 2, Int8.max]
        model.int16A = [0, Int16.max / 2, Int16.max]
        model.int32A = [0, Int32.max / 2, Int32.max]
        model.int64A = [0, Int64.max / 2, Int64.max]

        model.intAOpt = [0, Int.max / 2, Int.max]
        model.int8AOpt = [0, Int8.max / 2, Int8.max]
        model.int16AOpt = [0, Int16.max / 2, Int16.max]
        model.int32AOpt = [0, Int32.max / 2, Int32.max]
        model.int64AOpt = [0, Int64.max / 2, Int64.max]

        model.intAOptNil = nil
        model.int8AOptNil = nil
        model.int16AOptNil = nil
        model.int32AOptNil = nil
        model.int64AOptNil = nil

        Encoder(model).writeToFile(fileName)
        let reModel:SignedIntegerArrayModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.intA == [0, Int.max / 2, Int.max])
            XCTAssert(reModel!.int8A == [0, Int8.max / 2, Int8.max])
            XCTAssert(reModel!.int16A == [0, Int16.max / 2, Int16.max])
            XCTAssert(reModel!.int32A == [0, Int32.max / 2, Int32.max])
            XCTAssert(reModel!.int64A == [0, Int64.max / 2, Int64.max])

            XCTAssert(reModel!.intAOpt! == [0, Int.max / 2, Int.max])
            XCTAssert(reModel!.int8AOpt! == [0, Int8.max / 2, Int8.max])
            XCTAssert(reModel!.int16AOpt! == [0, Int16.max / 2, Int16.max])
            XCTAssert(reModel!.int32AOpt! == [0, Int32.max / 2, Int32.max])
            XCTAssert(reModel!.int64AOpt! == [0, Int64.max / 2, Int64.max])

            XCTAssert(reModel!.intAOptNil == nil)
            XCTAssert(reModel!.int8AOptNil == nil)
            XCTAssert(reModel!.int16AOptNil == nil)
            XCTAssert(reModel!.int32AOptNil == nil)
            XCTAssert(reModel!.int64AOptNil == nil)
        }
    }

    func testConstIntegerEncodingDecoding() {
        let fileName = "/tmp/const.plist"
        let model = ConstSignedIntegerModel(int: Int.max, int8: Int8.max, int16: Int16.max,
            int32: Int32.max, int64: Int64.max, intOpt: Int.max, int8Opt: Int8.max,
            int16Opt: Int16.max, int32Opt: Int32.max, int64Opt: Int64.max, intOptNil: nil,
            int8OptNil: nil, int16OptNil: nil, int32OptNil: nil, int64OptNil: nil)

        Encoder(model).writeToFile(fileName)
        let reModel:ConstSignedIntegerModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.int == Int.max)
            XCTAssert(reModel!.int8 == Int8.max)
            XCTAssert(reModel!.int16 == Int16.max)
            XCTAssert(reModel!.int32 == Int32.max)
            XCTAssert(reModel!.int64 == Int64.max)

            XCTAssert(reModel!.intOpt! == Int.max)
            XCTAssert(reModel!.int8Opt! == Int8.max)
            XCTAssert(reModel!.int16Opt! == Int16.max)
            XCTAssert(reModel!.int32Opt! == Int32.max)
            XCTAssert(reModel!.int64Opt! == Int64.max)

            XCTAssert(reModel!.intOptNil == nil)
            XCTAssert(reModel!.int8OptNil == nil)
            XCTAssert(reModel!.int16OptNil == nil)
            XCTAssert(reModel!.int32OptNil == nil)
            XCTAssert(reModel!.int64OptNil == nil)
        }
    }

    func testConstArrayEncodingDecoding() {
        let fileName = "/tmp/constIntArray.plist"

        let intA = [0, Int.max / 2, Int.max]
        let int8A = [0, Int8.max / 2, Int8.max]
        let int16A = [0, Int16.max / 2, Int16.max]
        let int32A = [0, Int32.max / 2, Int32.max]
        let int64A = [0, Int64.max / 2, Int64.max]


        let model = ConstSignedIntegerArrayModel(intA: intA, int8A: int8A, int16A: int16A,
            int32A: int32A, int64A: int64A, intAOpt: intA, int8AOpt: int8A, int16AOpt: int16A,
            int32AOpt: int32A, int64AOpt: int64A, intAOptNil: nil, int8AOptNil: nil,
            int16AOptNil: nil, int32AOptNil: nil, int64AOptNil: nil)

        Encoder(model).writeToFile(fileName)
        let reModel:ConstSignedIntegerArrayModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.intA == [0, Int.max / 2, Int.max])
            XCTAssert(reModel!.int8A == [0, Int8.max / 2, Int8.max])
            XCTAssert(reModel!.int16A == [0, Int16.max / 2, Int16.max])
            XCTAssert(reModel!.int32A == [0, Int32.max / 2, Int32.max])
            XCTAssert(reModel!.int64A == [0, Int64.max / 2, Int64.max])

            XCTAssert(reModel!.intAOpt! == [0, Int.max / 2, Int.max])
            XCTAssert(reModel!.int8AOpt! == [0, Int8.max / 2, Int8.max])
            XCTAssert(reModel!.int16AOpt! == [0, Int16.max / 2, Int16.max])
            XCTAssert(reModel!.int32AOpt! == [0, Int32.max / 2, Int32.max])
            XCTAssert(reModel!.int64AOpt! == [0, Int64.max / 2, Int64.max])

            XCTAssert(reModel!.intAOptNil == nil)
            XCTAssert(reModel!.int8AOptNil == nil)
            XCTAssert(reModel!.int16AOptNil == nil)
            XCTAssert(reModel!.int32AOptNil == nil)
            XCTAssert(reModel!.int64AOptNil == nil)
        }
    }

    func testDictionaryEncodingDecoding() {
        let fileName = "/tmp/intDict.plist"

        let model = SignedIntegerDictionaryModel()

        model.int = ["a": 0, "b": Int.max / 2, "c": Int.max]
        model.int8 = ["d": 0, "e": Int8.max / 2, "f": Int8.max]
        model.int16 = ["e": 0, "g": Int16.max / 2, "h": Int16.max]
        model.int32 = ["f": 0, "i": Int32.max / 2, "j": Int32.max]
        model.int64 = ["g": 0, "h": Int64.max / 2, "k": Int64.max]

        model.intOpt = ["a": 0, "b": Int.max / 3, "c": Int.max]
        model.int8Opt = ["d": 0, "e": Int8.max / 3, "f": Int8.max]
        model.int16Opt = ["e": 0, "g": Int16.max / 3, "h": Int16.max]
        model.int32Opt = ["f": 0, "i": Int32.max / 3, "j": Int32.max]
        model.int64Opt = ["g": 0, "h": Int64.max / 3, "k": Int64.max]

        model.intOptNil = nil
        model.int8OptNil = nil
        model.int16OptNil = nil
        model.int32OptNil = nil
        model.int64OptNil = nil

        Encoder(model).writeToFile(fileName)
        let reModel:SignedIntegerDictionaryModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.int == ["a": 0, "b": Int.max / 2, "c": Int.max])
            XCTAssert(reModel!.int8 == ["d": 0, "e": Int8.max / 2, "f": Int8.max])
            XCTAssert(reModel!.int16 == ["e": 0, "g": Int16.max / 2, "h": Int16.max])
            XCTAssert(reModel!.int32 == ["f": 0, "i": Int32.max / 2, "j": Int32.max])
            XCTAssert(reModel!.int64 == ["g": 0, "h": Int64.max / 2, "k": Int64.max])

            XCTAssert(reModel!.intOpt! == ["a": 0, "b": Int.max / 3, "c": Int.max])
            XCTAssert(reModel!.int8Opt! == ["d": 0, "e": Int8.max / 3, "f": Int8.max])
            XCTAssert(reModel!.int16Opt! == ["e": 0, "g": Int16.max / 3, "h": Int16.max])
            XCTAssert(reModel!.int32Opt! == ["f": 0, "i": Int32.max / 3, "j": Int32.max])
            XCTAssert(reModel!.int64Opt! == ["g": 0, "h": Int64.max / 3, "k": Int64.max])

            XCTAssert(reModel!.intOptNil == nil)
            XCTAssert(reModel!.int8OptNil == nil)
            XCTAssert(reModel!.int16OptNil == nil)
            XCTAssert(reModel!.int32OptNil == nil)
            XCTAssert(reModel!.int64OptNil == nil)
        }
    }

    func testConstDictionaryEncodingDecoding() {
        let fileName = "/tmp/constIntDict.plist"

        let int = ["a": 0, "b": Int.max / 2, "c": Int.max]
        let int8 = ["d": 0, "e": Int8.max / 2, "f": Int8.max]
        let int16 = ["e": 0, "g": Int16.max / 2, "h": Int16.max]
        let int32 = ["f": 0, "i": Int32.max / 2, "j": Int32.max]
        let int64 = ["g": 0, "h": Int64.max / 2, "k": Int64.max]

        let intOpt = ["a": 0, "b": Int.max / 3, "c": Int.max]
        let int8Opt = ["d": 0, "e": Int8.max / 3, "f": Int8.max]
        let int16Opt = ["e": 0, "g": Int16.max / 3, "h": Int16.max]
        let int32Opt = ["f": 0, "i": Int32.max / 3, "j": Int32.max]
        let int64Opt = ["g": 0, "h": Int64.max / 3, "k": Int64.max]

        let model = ConstSignedIntegerDictionaryModel(int: int, int8: int8, int16: int16,
            int32: int32, int64: int64, intOpt: intOpt, int8Opt: int8Opt, int16Opt: int16Opt,
            int32Opt: int32Opt, int64Opt: int64Opt, intOptNil: nil, int8OptNil: nil,
            int16OptNil: nil, int32OptNil: nil, int64OptNil: nil)

        Encoder(model).writeToFile(fileName)
        let reModel:ConstSignedIntegerDictionaryModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.int == ["a": 0, "b": Int.max / 2, "c": Int.max])
            XCTAssert(reModel!.int8 == ["d": 0, "e": Int8.max / 2, "f": Int8.max])
            XCTAssert(reModel!.int16 == ["e": 0, "g": Int16.max / 2, "h": Int16.max])
            XCTAssert(reModel!.int32 == ["f": 0, "i": Int32.max / 2, "j": Int32.max])
            XCTAssert(reModel!.int64 == ["g": 0, "h": Int64.max / 2, "k": Int64.max])

            XCTAssert(reModel!.intOpt! == ["a": 0, "b": Int.max / 3, "c": Int.max])
            XCTAssert(reModel!.int8Opt! == ["d": 0, "e": Int8.max / 3, "f": Int8.max])
            XCTAssert(reModel!.int16Opt! == ["e": 0, "g": Int16.max / 3, "h": Int16.max])
            XCTAssert(reModel!.int32Opt! == ["f": 0, "i": Int32.max / 3, "j": Int32.max])
            XCTAssert(reModel!.int64Opt! == ["g": 0, "h": Int64.max / 3, "k": Int64.max])

            XCTAssert(reModel!.intOptNil == nil)
            XCTAssert(reModel!.int8OptNil == nil)
            XCTAssert(reModel!.int16OptNil == nil)
            XCTAssert(reModel!.int32OptNil == nil)
            XCTAssert(reModel!.int64OptNil == nil)
        }
    }
}
