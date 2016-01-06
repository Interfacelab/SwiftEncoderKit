//
//  Shave_iOSTests.swift
//  Shave iOSTests
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//

import XCTest
import ObjectMapper
import AVFoundation

class Shave_iOSTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSignedIntegerEncodingDecoding() {
        let model = TestModel()

        model.int = Int.max
        model.int8 = Int8.max
        model.int16 = Int16.max
        model.int32 = Int32.max
        model.int64 = Int64.max

        model.intOpt = Int.max
        model.int8Opt = nil
        model.int16Opt = Int16.max
        model.int32Opt = nil
        model.int64Opt = Int64.max

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile("/tmp/signed.plist")

        let decoder=Decoder(path: "/tmp/signed.plist")
        let reModel = TestModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.int == model.int)
            XCTAssert(reModel!.int8 == model.int8)
            XCTAssert(reModel!.int16 == model.int16)
            XCTAssert(reModel!.int32 == model.int32)
            XCTAssert(reModel!.int64 == model.int64)

            XCTAssert(reModel!.intOpt == model.intOpt)
            XCTAssert(reModel!.int8Opt == nil)
            XCTAssert(reModel!.int16Opt == model.int16Opt)
            XCTAssert(reModel!.int32Opt == nil)
            XCTAssert(reModel!.int64Opt == model.int64Opt)
        }
    }

    func testUnsignedIntegerEncodingDecoding() {
        let model = TestModel()

        model.uint = UInt.max
        model.uint8 = UInt8.max
        model.uint16 = UInt16.max
        model.uint32 = UInt32.max
        model.uint64 = UInt64.max

        model.uintOpt = UInt.max
        model.uint8Opt = nil
        model.uint16Opt = UInt16.max
        model.uint32Opt = nil
        model.uint64Opt = UInt64.max

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile("/tmp/unsigned.plist")

        let decoder=Decoder(path: "/tmp/unsigned.plist")
        let reModel = TestModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.uint == model.uint)
            XCTAssert(reModel!.uint8 == model.uint8)
            XCTAssert(reModel!.uint16 == model.uint16)
            XCTAssert(reModel!.uint32 == model.uint32)
            XCTAssert(reModel!.uint64 == model.uint64)

            XCTAssert(reModel!.uintOpt == model.uintOpt)
            XCTAssert(reModel!.uint8Opt == nil)
            XCTAssert(reModel!.uint16Opt == model.uint16Opt)
            XCTAssert(reModel!.uint32Opt == nil)
            XCTAssert(reModel!.uint64Opt == model.uint64Opt)
        }

        let jsonString = encoder.jsonString

        XCTAssert(jsonString != nil)

        try! jsonString!.writeToFile("/tmp/unsigned.json", atomically: false, encoding: NSUTF8StringEncoding)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
