//
//  StringTests.swift
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

class StringTests: XCTestCase {

    func testStringEncodingDecoding() {

        let fileName = "/tmp/string.plist"

        let model = StringModel()

        model.string = "Nice"
        model.stringOpt = "Things"
        model.stringOptNil = nil

        Encoder(model).writeToFile(fileName)
        let reModel: StringModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.string == "Nice")
            XCTAssert(reModel!.stringOpt! == "Things")
            XCTAssert(reModel!.stringOptNil == nil)
        }
    }

    func testConstStringEncodingDecoding() {
        let fileName = "/tmp/constString.plist"

        let model = ConstStringModel(string: "Nice", stringOpt: "Things", stringOptNil: nil)

        Encoder(model).writeToFile(fileName)
        let reModel: ConstStringModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.string == "Nice")
            XCTAssert(reModel!.stringOpt! == "Things")
            XCTAssert(reModel!.stringOptNil == nil)
        }
    }

    func testArrayEncodingDecoding() {
        let fileName = "/tmp/stringArray.plist"

        let model = StringArrayModel()

        model.stringA = ["this", "that", "other"]
        model.stringAOpt = ["by", "design"]
        model.stringAOptNil = nil

        Encoder(model).writeToFile(fileName)
        let reModel: StringArrayModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.stringA == ["this", "that", "other"])
            XCTAssert(reModel!.stringAOpt! == ["by", "design"])
            XCTAssert(reModel!.stringAOptNil == nil)
        }
    }

    func testConstArrayEncodingDecoding() {
        let fileName = "/tmp/stringConstArray.plist"

        let model = ConstStringArrayModel(stringA: ["this", "that", "other"],
            stringAOpt: ["by", "design"], stringAOptNil: nil)

        Encoder(model).writeToFile(fileName)
        let reModel: ConstStringArrayModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.stringA == ["this", "that", "other"])
            XCTAssert(reModel!.stringAOpt! == ["by", "design"])
            XCTAssert(reModel!.stringAOptNil == nil)
        }
    }

    func testDictionaryEncodingDecoding() {
        let fileName = "/tmp/stringDict.plist"

        let model = StringDictionaryModel()

        model.stringD = ["A": "this", "B": "that", "C": "other"]
        model.stringDOpt = ["A": "by", "B": "design"]
        model.stringDOptNil = nil

        Encoder(model).writeToFile(fileName)
        let reModel: StringDictionaryModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.stringD == ["A": "this", "B": "that", "C": "other"])
            XCTAssert(reModel!.stringDOpt! == ["A": "by", "B": "design"])
            XCTAssert(reModel!.stringDOptNil == nil)
        }
    }

    func testConstDictionaryEncodingDecoding() {
        let fileName = "/tmp/constStringDict.plist"

        let stringD = ["A": "this", "B": "that", "C": "other"]
        let stringDOpt = ["A": "by", "B": "design"]

        let model = ConstStringDictionaryModel(stringD: stringD, stringDOpt: stringDOpt,
            stringDOptNil: nil)

        Encoder(model).writeToFile(fileName)
        let reModel: ConstStringDictionaryModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.stringD == ["A": "this", "B": "that", "C": "other"])
            XCTAssert(reModel!.stringDOpt! == ["A": "by", "B": "design"])
            XCTAssert(reModel!.stringDOptNil == nil)
        }
    }

}
