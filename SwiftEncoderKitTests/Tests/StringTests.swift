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

    func testDictionaryEncodingDecoding() {
        let fileName = "/tmp/stringDict.plist"

        let model = StringDictionaryModel()

        model.stringD = ["A": "this", "B": "that", "C": "other"]
        model.stringDOpt = ["A": "by", "B": "design"]
        model.stringDOptNil = nil

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = StringDictionaryModel(decoder)

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

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = ConstStringDictionaryModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.stringD == ["A": "this", "B": "that", "C": "other"])
            XCTAssert(reModel!.stringDOpt! == ["A": "by", "B": "design"])
            XCTAssert(reModel!.stringDOptNil == nil)
        }
    }

}
