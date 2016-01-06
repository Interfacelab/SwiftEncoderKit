//
//  BoolTests.swift
//  SwiftEncoderKit
//
//  Created by Jon Gilkison on 1/3/16.
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

class BoolTests: XCTestCase {

    func testBoolEncodingDecoding() {
        let fileName = "/tmp/bool.plist"

        let model = BoolModel()

        model.bool = true
        model.boolOpt = true
        model.boolOptNil = nil

        Encoder(model).writeToFile(fileName)
        let reModel: BoolModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.bool == true)
            XCTAssert(reModel!.boolOpt! == true)
            XCTAssert(reModel!.boolOptNil == nil)
        }
    }

    func testConstBoolEncodingDecoding() {
        let fileName = "/tmp/constBool.plist"

        let model = ConstBoolModel(bool: true, boolOpt: true, boolOptNil: nil)

        Encoder(model).writeToFile(fileName)
        let reModel: ConstBoolModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.bool == true)
            XCTAssert(reModel!.boolOpt! == true)
            XCTAssert(reModel!.boolOptNil == nil)
        }
    }

    func testArrayEncodingDecoding() {
        let fileName = "/tmp/boolArray.plist"

        let model = BoolArrayModel()

        model.boolA = [true, true, false, false, true]
        model.boolAOpt = [true, true, false]
        model.boolAOptNil = nil

        Encoder(model).writeToFile(fileName)
        let reModel: BoolArrayModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.boolA == [true, true, false, false, true])
            XCTAssert(reModel!.boolAOpt! == [true, true, false])
            XCTAssert(reModel!.boolAOptNil == nil)
        }
    }

    func testConstArrayEncodingDecoding() {
        let fileName = "/tmp/boolConstArray.plist"

        let model = ConstBoolArrayModel(boolA: [true, true, false, false, true],
            boolAOpt: [true, true, false], boolAOptNil: nil)

        Encoder(model).writeToFile(fileName)
        let reModel: ConstBoolArrayModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.boolA == [true, true, false, false, true])
            XCTAssert(reModel!.boolAOpt! == [true, true, false])
            XCTAssert(reModel!.boolAOptNil == nil)
        }
    }

    func testDictionaryEncodingDecoding() {
        let fileName = "/tmp/boolDict.plist"

        let model = BoolDictionaryModel()

        model.boolD = ["a": true, "b": true, "c": false]
        model.boolDOpt = ["d": true, "e": true, "f": false]
        model.boolDOptNil = nil

        Encoder(model).writeToFile(fileName)
        let reModel: BoolDictionaryModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.boolD == ["a": true, "b": true, "c": false])
            XCTAssert(reModel!.boolDOpt! == ["d": true, "e": true, "f": false])
            XCTAssert(reModel!.boolDOptNil == nil)
        }
    }

    func testConstDictionaryEncodingDecoding() {
        let fileName = "/tmp/boolDict.plist"

        let boolD = ["a": true, "b": true, "c": false]
        let boolDOpt = ["d": true, "e": true, "f": false]

        let model = ConstBoolDictionaryModel(boolD: boolD, boolDOpt: boolDOpt, boolDOptNil: nil)

        Encoder(model).writeToFile(fileName)
        let reModel: ConstBoolDictionaryModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.boolD == ["a": true, "b": true, "c": false])
            XCTAssert(reModel!.boolDOpt! == ["d": true, "e": true, "f": false])
            XCTAssert(reModel!.boolDOptNil == nil)
        }
    }

}
