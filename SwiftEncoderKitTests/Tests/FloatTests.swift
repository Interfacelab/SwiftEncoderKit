//
//  FloatTests.swift
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

class FloatTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    // MARK: Basic encoding

    func testFloatEncodingDecoding() {
        let fileName = "/tmp/float.plist"

        let model = FloatModel()

        model.float = Float.infinity
        model.floatOpt = Float.infinity / 2.0
        model.floatOptNil = nil

        model.double = Double.infinity
        model.doubleOpt = Double.infinity / 2.0
        model.doubleOptNil = nil

        Encoder(model).writeToFile(fileName)
        let reModel:FloatModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.float == Float.infinity)
            XCTAssert(reModel!.floatOpt! == Float.infinity / 2.0)
            XCTAssert(reModel!.floatOptNil == nil)

            XCTAssert(reModel!.double == Double.infinity)
            XCTAssert(reModel!.doubleOpt! == Double.infinity / 2.0)
            XCTAssert(reModel!.doubleOptNil == nil)
        }
    }

    func testConstFloatEncodingDecoding() {
        let fileName = "/tmp/constFloat.plist"

        let model = ConstFloatModel(float: Float.infinity, floatOpt: Float.infinity / 2.0,
            floatOptNil: nil, double: Double.infinity, doubleOpt: Double.infinity / 2.0,
            doubleOptNil: nil)

        Encoder(model).writeToFile(fileName)
        let reModel:ConstFloatModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.float == Float.infinity)
            XCTAssert(reModel!.floatOpt! == Float.infinity / 2.0)
            XCTAssert(reModel!.floatOptNil == nil)

            XCTAssert(reModel!.double == Double.infinity)
            XCTAssert(reModel!.doubleOpt! == Double.infinity / 2.0)
            XCTAssert(reModel!.doubleOptNil == nil)
        }
    }

    // MARK: Array encoding

    func testArrayEncodingDecoding() {
        let fileName = "/tmp/floatArray.plist"

        let model = FloatArrayModel()

        model.floatA = [0.0, Float.infinity / 2.0, Float.infinity]
        model.floatAOpt = [20.0, Float.infinity / 3.0, Float.infinity]
        model.floatAOptNil = nil

        model.doubleA = [0.0, Double.infinity / 2.0, Double.infinity]
        model.doubleAOpt = [20.0, Double.infinity / 3.0, Double.infinity]
        model.doubleAOptNil = nil

        Encoder(model).writeToFile(fileName)
        let reModel:FloatArrayModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.floatA == [0.0, Float.infinity / 2.0, Float.infinity])
            XCTAssert(reModel!.floatAOpt! == [20.0, Float.infinity / 3.0, Float.infinity])
            XCTAssert(reModel!.floatAOptNil == nil)

            XCTAssert(reModel!.doubleA == [0.0, Double.infinity / 2.0, Double.infinity])
            XCTAssert(reModel!.doubleAOpt! == [20.0, Double.infinity / 3.0, Double.infinity])
            XCTAssert(reModel!.doubleAOptNil == nil)
        }
    }

    func testConstArrayEncodingDecoding() {
        let fileName = "/tmp/floatArray.plist"

        let floatA = [0.0, Float.infinity / 2.0, Float.infinity]
        let floatAOpt = [20.0, Float.infinity / 3.0, Float.infinity]
        let doubleA = [0.0, Double.infinity / 2.0, Double.infinity]
        let doubleAOpt = [20.0, Double.infinity / 3.0, Double.infinity]

        let model = ConstFloatArrayModel(floatA: floatA, floatAOpt: floatAOpt, floatAOptNil: nil,
            doubleA: doubleA, doubleAOpt: doubleAOpt, doubleAOptNil: nil)

        Encoder(model).writeToFile(fileName)
        let reModel:ConstFloatArrayModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.floatA == [0.0, Float.infinity / 2.0, Float.infinity])
            XCTAssert(reModel!.floatAOpt! == [20.0, Float.infinity / 3.0, Float.infinity])
            XCTAssert(reModel!.floatAOptNil == nil)

            XCTAssert(reModel!.doubleA == [0.0, Double.infinity / 2.0, Double.infinity])
            XCTAssert(reModel!.doubleAOpt! == [20.0, Double.infinity / 3.0, Double.infinity])
            XCTAssert(reModel!.doubleAOptNil == nil)
        }
    }

    // MARK: Dictionary encoding

    func testDictionaryEncodingDecoding() {
        let fileName = "/tmp/floatDict.plist"

        let model = FloatDictionaryModel()

        model.floatD = ["a": 0.0, "b": Float.infinity / 2.0, "c": Float.infinity]
        model.floatDOpt = ["a": 20.0, "b": Float.infinity / 3.0, "c": Float.infinity]
        model.floatDOptNil = nil

        model.doubleD = ["a": 0.0, "b": Double.infinity / 2.0, "c": Double.infinity]
        model.doubleDOpt = ["a": 20.0, "b": Double.infinity / 3.0, "c": Double.infinity]
        model.doubleDOptNil = nil

        Encoder(model).writeToFile(fileName)
        let reModel:FloatDictionaryModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.floatD == ["a": 0.0, "b": Float.infinity / 2.0, "c": Float.infinity])
            XCTAssert(reModel!.floatDOpt! == ["a": 20.0, "b": Float.infinity / 3.0,
                "c": Float.infinity])
            XCTAssert(reModel!.floatDOptNil == nil)

            XCTAssert(reModel!.doubleD == ["a": 0.0, "b": Double.infinity / 2.0,
                "c": Double.infinity])
            XCTAssert(reModel!.doubleDOpt! == ["a": 20.0, "b": Double.infinity / 3.0,
                "c": Double.infinity])
            XCTAssert(reModel!.doubleDOptNil == nil)
        }
    }

    func testConstDictionaryEncodingDecoding() {
        let fileName = "/tmp/constFloatDict.plist"

        let floatD = ["a": 0.0, "b": Float.infinity / 2.0, "c": Float.infinity]
        let floatDOpt = ["a": 20.0, "b": Float.infinity / 3.0, "c": Float.infinity]

        let doubleD = ["a": 0.0, "b": Double.infinity / 2.0, "c": Double.infinity]
        let doubleDOpt = ["a": 20.0, "b": Double.infinity / 3.0, "c": Double.infinity]

        let model = ConstFloatDictionaryModel(floatD: floatD, floatDOpt: floatDOpt,
            floatDOptNil: nil, doubleD: doubleD, doubleDOpt: doubleDOpt, doubleDOptNil: nil)

        Encoder(model).writeToFile(fileName)
        let reModel:ConstFloatDictionaryModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.floatD == ["a": 0.0, "b": Float.infinity / 2.0, "c": Float.infinity])
            XCTAssert(reModel!.floatDOpt! == ["a": 20.0, "b": Float.infinity / 3.0,
                "c": Float.infinity])
            XCTAssert(reModel!.floatDOptNil == nil)

            XCTAssert(reModel!.doubleD == ["a": 0.0, "b": Double.infinity / 2.0,
                "c": Double.infinity])
            XCTAssert(reModel!.doubleDOpt! == ["a": 20.0, "b": Double.infinity / 3.0,
                "c": Double.infinity])
            XCTAssert(reModel!.doubleDOptNil == nil)
        }
    }
}
