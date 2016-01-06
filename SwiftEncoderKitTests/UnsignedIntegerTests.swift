//
//  UnsignedIntegerTests.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import XCTest

class UnsignedIntegerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testUnsignedIntegerEncodingDecoding() {
        let model = UnsignedIntegerModel()

        model.uint = UInt.max
        model.uint8 = UInt8.max
        model.uint16 = UInt16.max
        model.uint32 = UInt32.max
        model.uint64 = UInt64.max

        model.uintOpt = UInt.max
        model.uint8Opt = UInt8.max
        model.uint16Opt = UInt16.max
        model.uint32Opt = UInt32.max
        model.uint64Opt = UInt64.max

        model.uintOptNil = nil
        model.uint8OptNil = nil
        model.uint16OptNil = nil
        model.uint32OptNil = nil
        model.uint64OptNil = nil

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile("/tmp/unsigned.plist")

        let decoder=Decoder(path: "/tmp/unsigned.plist")
        let reModel = UnsignedIntegerModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.uint == UInt.max)
            XCTAssert(reModel!.uint8 == UInt8.max)
            XCTAssert(reModel!.uint16 == UInt16.max)
            XCTAssert(reModel!.uint32 == UInt32.max)
            XCTAssert(reModel!.uint64 == UInt64.max)

            XCTAssert(reModel!.uintOpt! == UInt.max)
            XCTAssert(reModel!.uint8Opt! == UInt8.max)
            XCTAssert(reModel!.uint16Opt! == UInt16.max)
            XCTAssert(reModel!.uint32Opt! == UInt32.max)
            XCTAssert(reModel!.uint64Opt! == UInt64.max)

            XCTAssert(reModel!.uintOptNil == nil)
            XCTAssert(reModel!.uint8OptNil == nil)
            XCTAssert(reModel!.uint16OptNil == nil)
            XCTAssert(reModel!.uint32OptNil == nil)
            XCTAssert(reModel!.uint64OptNil == nil)
        }
    }

    func testUnsignedIntegerArrayEncodingDecoding() {
        let model = UnsignedIntegerModel()

        model.uintA = [0, UInt.max / 2, UInt.max]
        model.uint8A = [0, UInt8.max / 2, UInt8.max]
        model.uint16A = [0, UInt16.max / 2, UInt16.max]
        model.uint32A = [0, UInt32.max / 2, UInt32.max]
        model.uint64A = [0, UInt64.max / 2, UInt64.max]

        model.uintAOpt = [0, UInt.max / 2, UInt.max]
        model.uint8AOpt = [0, UInt8.max / 2, UInt8.max]
        model.uint16AOpt = [0, UInt16.max / 2, UInt16.max]
        model.uint32AOpt = [0, UInt32.max / 2, UInt32.max]
        model.uint64AOpt = [0, UInt64.max / 2, UInt64.max]

        model.uintAOptNil = nil
        model.uint8AOptNil = nil
        model.uint16AOptNil = nil
        model.uint32AOptNil = nil
        model.uint64AOptNil = nil

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile("/tmp/uintArray.plist")

        let decoder=Decoder(path: "/tmp/uintArray.plist")
        let reModel = UnsignedIntegerModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.uintA == model.uintA)
            XCTAssert(reModel!.uint8A == model.uint8A)
            XCTAssert(reModel!.uint16A == model.uint16A)
            XCTAssert(reModel!.uint32A == model.uint32A)
            XCTAssert(reModel!.uint64A == model.uint64A)

            XCTAssert(reModel!.uintAOpt! == model.uintAOpt!)
            XCTAssert(reModel!.uint8AOpt! == model.uint8AOpt!)
            XCTAssert(reModel!.uint16AOpt! == model.uint16AOpt!)
            XCTAssert(reModel!.uint32AOpt! == model.uint32AOpt!)
            XCTAssert(reModel!.uint64AOpt! == model.uint64AOpt!)

            XCTAssert(reModel!.uintAOptNil == nil)
            XCTAssert(reModel!.uint8AOptNil == nil)
            XCTAssert(reModel!.uint16AOptNil == nil)
            XCTAssert(reModel!.uint32AOptNil == nil)
            XCTAssert(reModel!.uint64AOptNil == nil)
        }
    }
    
}
