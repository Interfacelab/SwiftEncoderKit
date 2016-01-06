//
//  FloatTests.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/3/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

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


    func testFloatEncodingDecoding() {
        let fileName = "/tmp/float.plist"

        let model = FloatModel()

        model.float = Float.infinity
        model.floatOpt = Float.infinity / 2.0
        model.floatOptNil = nil

        model.double = Double.infinity
        model.doubleOpt = Double.infinity / 2.0
        model.doubleOptNil = nil

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = FloatModel(decoder)

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

    func testArrayEncodingDecoding() {
        let fileName = "/tmp/floatArray.plist"

        let model = FloatArrayModel()

        model.floatA = [0.0, Float.infinity / 2.0, Float.infinity]
        model.floatAOpt = [20.0, Float.infinity / 3.0, Float.infinity]
        model.floatAOptNil = nil

        model.doubleA = [0.0, Double.infinity / 2.0, Double.infinity]
        model.doubleAOpt = [20.0, Double.infinity / 3.0, Double.infinity]
        model.doubleAOptNil = nil

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = FloatArrayModel(decoder)

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

    func testConstFloatEncodingDecoding() {
        let fileName = "/tmp/constFloat.plist"

        let model = ConstFloatModel(float: Float.infinity, floatOpt: Float.infinity / 2.0,
            floatOptNil: nil, double: Double.infinity, doubleOpt: Double.infinity / 2.0,
            doubleOptNil: nil)

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = ConstFloatModel(decoder)

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

    func testConstArrayEncodingDecoding() {
        let fileName = "/tmp/floatArray.plist"

        let floatA = [0.0, Float.infinity / 2.0, Float.infinity]
        let floatAOpt = [20.0, Float.infinity / 3.0, Float.infinity]
        let doubleA = [0.0, Double.infinity / 2.0, Double.infinity]
        let doubleAOpt = [20.0, Double.infinity / 3.0, Double.infinity]

        let model = ConstFloatArrayModel(floatA: floatA, floatAOpt: floatAOpt, floatAOptNil: nil,
            doubleA: doubleA, doubleAOpt: doubleAOpt, doubleAOptNil: nil)

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = ConstFloatArrayModel(decoder)

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

}
