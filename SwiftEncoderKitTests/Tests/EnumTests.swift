//
//  EnumTests.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import XCTest

class EnumTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testEnumEncodingDecoding() {
        let fileName = "/tmp/enum.plist"

        let model = EnumModel()

        model.int = .value2
        model.int8 = .value3
        model.int16 = .value2
        model.int32 = .value3
        model.int64 = .value2
        model.uint = .value3
        model.uint8 = .value2
        model.uint16 = .value3
        model.uint32 = .value2
        model.uint64 = .value3
        model.float = .value2
        model.double = .value3
        model.string = .value2
        model.character = .value3

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = EnumModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.int == .value2)
            XCTAssert(reModel!.int8 == .value3)
            XCTAssert(reModel!.int16 == .value2)
            XCTAssert(reModel!.int32 == .value3)
            XCTAssert(reModel!.int64 == .value2)
            XCTAssert(reModel!.uint == .value3)
            XCTAssert(reModel!.uint8 == .value2)
            XCTAssert(reModel!.uint16 == .value3)
            XCTAssert(reModel!.uint32 == .value2)
            XCTAssert(reModel!.uint64 == .value3)
            XCTAssert(reModel!.float == .value2)
            XCTAssert(reModel!.double == .value3)
            XCTAssert(reModel!.string == .value2)
            XCTAssert(reModel!.character == .value3)
        }
    }

}
