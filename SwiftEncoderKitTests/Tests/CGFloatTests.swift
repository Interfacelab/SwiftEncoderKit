//
//  CGFloatTests.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/3/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import XCTest

class CGFloatTests: XCTestCase {

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
        let fileName = "/tmp/cgfloat.plist"

        let model = CGFloatModel()

        model.float = CGFloat.infinity
        model.floatOpt = CGFloat.infinity / 2.0
        model.floatOptNil = nil

        Encoder(model).writeToFile(fileName)
        let reModel:CGFloatModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.float == CGFloat.infinity)
            XCTAssert(reModel!.floatOpt! == CGFloat.infinity / 2.0)
            XCTAssert(reModel!.floatOptNil == nil)
        }
    }

    func testConstFloatEncodingDecoding() {
        let fileName = "/tmp/constCGFloat.plist"

        let model = ConstCGFloatModel(float: CGFloat.infinity, floatOpt: CGFloat.infinity / 2.0,
            floatOptNil: nil)

        Encoder(model).writeToFile(fileName)
        let reModel:ConstCGFloatModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.float == CGFloat.infinity)
            XCTAssert(reModel!.floatOpt! == CGFloat.infinity / 2.0)
            XCTAssert(reModel!.floatOptNil == nil)
        }
    }

    // MARK: Array encoding

    func testArrayEncodingDecoding() {
        let fileName = "/tmp/cgfloatArray.plist"

        let model = CGFloatArrayModel()

        model.floatA = [0.0, CGFloat.infinity / 2.0, CGFloat.infinity]
        model.floatAOpt = [20.0, CGFloat.infinity / 3.0, CGFloat.infinity]
        model.floatAOptNil = nil

        Encoder(model).writeToFile(fileName)
        let reModel:CGFloatArrayModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.floatA == [0.0, CGFloat.infinity / 2.0, CGFloat.infinity])
            XCTAssert(reModel!.floatAOpt! == [20.0, CGFloat.infinity / 3.0, CGFloat.infinity])
            XCTAssert(reModel!.floatAOptNil == nil)
        }
    }

    func testConstArrayEncodingDecoding() {
        let fileName = "/tmp/constcgfloatArray.plist"

        let floatA = [0.0, CGFloat.infinity / 2.0, CGFloat.infinity]
        let floatAOpt = [20.0, CGFloat.infinity / 3.0, CGFloat.infinity]

        let model = ConstCGFloatArrayModel(floatA: floatA, floatAOpt: floatAOpt, floatAOptNil: nil)

        Encoder(model).writeToFile(fileName)
        let reModel:ConstCGFloatArrayModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.floatA == [0.0, CGFloat.infinity / 2.0, CGFloat.infinity])
            XCTAssert(reModel!.floatAOpt! == [20.0, CGFloat.infinity / 3.0, CGFloat.infinity])
            XCTAssert(reModel!.floatAOptNil == nil)
        }
    }

    // MARK: Dictionary encoding

    func testDictionaryEncodingDecoding() {
        let fileName = "/tmp/cgfloatDict.plist"

        let model = CGFloatDictionaryModel()

        model.floatD = ["a": 0.0, "b": CGFloat.infinity / 2.0, "c": CGFloat.infinity]
        model.floatDOpt = ["a": 20.0, "b": CGFloat.infinity / 3.0, "c": CGFloat.infinity]
        model.floatDOptNil = nil

        Encoder(model).writeToFile(fileName)
        let reModel:CGFloatDictionaryModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.floatD == ["a": 0.0, "b": CGFloat.infinity / 2.0, "c": CGFloat.infinity])
            XCTAssert(reModel!.floatDOpt! == ["a": 20.0, "b": CGFloat.infinity / 3.0,
                "c": CGFloat.infinity])
            XCTAssert(reModel!.floatDOptNil == nil)
        }
    }

    func testConstDictionaryEncodingDecoding() {
        let fileName = "/tmp/constCGFloatDict.plist"

        let floatD = ["a": 0.0, "b": CGFloat.infinity / 2.0, "c": CGFloat.infinity]
        let floatDOpt = ["a": 20.0, "b": CGFloat.infinity / 3.0, "c": CGFloat.infinity]

        let model = ConstCGFloatDictionaryModel(floatD: floatD, floatDOpt: floatDOpt,
            floatDOptNil: nil)

        Encoder(model).writeToFile(fileName)
        let reModel:ConstCGFloatDictionaryModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.floatD == ["a": 0.0, "b": CGFloat.infinity / 2.0, "c": CGFloat.infinity])
            XCTAssert(reModel!.floatDOpt! == ["a": 20.0, "b": CGFloat.infinity / 3.0,
                "c": CGFloat.infinity])
            XCTAssert(reModel!.floatDOptNil == nil)
        }
    }
}
