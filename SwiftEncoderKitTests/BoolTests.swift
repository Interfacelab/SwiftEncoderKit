//
//  BoolTests.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/3/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import XCTest

class BoolTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testBoolEncodingDecoding() {
        let fileName = "/tmp/bool.plist"

        let model = BoolModel()

        model.bool = true
        model.boolOpt = true
        model.boolOptNil = nil

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = BoolModel(decoder)

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

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = BoolArrayModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.boolA == [true, true, false, false, true])
            XCTAssert(reModel!.boolAOpt! == [true, true, false])
            XCTAssert(reModel!.boolAOptNil == nil)
        }
    }

    func testConstBoolEncodingDecoding() {
        let fileName = "/tmp/constBool.plist"

        let model = ConstBoolModel(bool: true, boolOpt: true, boolOptNil: nil)

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = ConstBoolModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.bool == true)
            XCTAssert(reModel!.boolOpt! == true)
            XCTAssert(reModel!.boolOptNil == nil)
        }
    }

    func testConstArrayEncodingDecoding() {
        let fileName = "/tmp/boolConstArray.plist"

        let model = ConstBoolArrayModel(boolA: [true, true, false, false, true],
            boolAOpt: [true, true, false], boolAOptNil: nil)

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = ConstBoolArrayModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.boolA == [true, true, false, false, true])
            XCTAssert(reModel!.boolAOpt! == [true, true, false])
            XCTAssert(reModel!.boolAOptNil == nil)
        }
    }

}
