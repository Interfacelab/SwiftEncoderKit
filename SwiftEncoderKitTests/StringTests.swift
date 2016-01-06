//
//  StringTests.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/3/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import XCTest

class StringTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testStringEncodingDecoding() {
        let fileName = "/tmp/string.plist"

        let model = StringModel()

        model.string = "Nice"
        model.stringOpt = "Things"
        model.stringOptNil = nil

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = StringModel(decoder)

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

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = StringArrayModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.stringA == ["this", "that", "other"])
            XCTAssert(reModel!.stringAOpt! == ["by", "design"])
            XCTAssert(reModel!.stringAOptNil == nil)
        }
    }

    func testConstStringEncodingDecoding() {
        let fileName = "/tmp/constString.plist"

        let model = ConstStringModel(string: "Nice", stringOpt: "Things", stringOptNil: nil)

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = ConstStringModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.string == "Nice")
            XCTAssert(reModel!.stringOpt! == "Things")
            XCTAssert(reModel!.stringOptNil == nil)
        }
    }

    func testConstArrayEncodingDecoding() {
        let fileName = "/tmp/stringConstArray.plist"

        let model = ConstStringArrayModel(stringA: ["this", "that", "other"],
            stringAOpt: ["by", "design"], stringAOptNil: nil)

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = ConstStringArrayModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.stringA == ["this", "that", "other"])
            XCTAssert(reModel!.stringAOpt! == ["by", "design"])
            XCTAssert(reModel!.stringAOptNil == nil)
        }
    }

}
