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
        let model = SignedIntegerModel()

        model.int = Int.max
        model.int8 = Int8.max
        model.int16 = Int16.max
        model.int32 = Int32.max
        model.int64 = Int64.max

        model.intOpt = Int.max
        model.int8Opt = Int8.max
        model.int16Opt = Int16.max
        model.int32Opt = Int32.max
        model.int64Opt = Int64.max

        model.intOptNil = nil
        model.int8OptNil = nil
        model.int16OptNil = nil
        model.int32OptNil = nil
        model.int64OptNil = nil

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile("/tmp/signed.plist")

        let decoder=Decoder(path: "/tmp/signed.plist")
        let reModel = SignedIntegerModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.int == Int.max)
            XCTAssert(reModel!.int8 == Int8.max)
            XCTAssert(reModel!.int16 == Int16.max)
            XCTAssert(reModel!.int32 == Int32.max)
            XCTAssert(reModel!.int64 == Int64.max)

            XCTAssert(reModel!.intOpt! == Int.max)
            XCTAssert(reModel!.int8Opt! == Int8.max)
            XCTAssert(reModel!.int16Opt! == Int16.max)
            XCTAssert(reModel!.int32Opt! == Int32.max)
            XCTAssert(reModel!.int64Opt! == Int64.max)

            XCTAssert(reModel!.intOptNil == nil)
            XCTAssert(reModel!.int8OptNil == nil)
            XCTAssert(reModel!.int16OptNil == nil)
            XCTAssert(reModel!.int32OptNil == nil)
            XCTAssert(reModel!.int64OptNil == nil)
        }
    }

    func testSignedIntegerArrayEncodingDecoding() {
        let model = SignedIntegerModel()

        model.intA = [0, Int.max / 2, Int.max]
        model.int8A = [0, Int8.max / 2, Int8.max]
        model.int16A = [0, Int16.max / 2, Int16.max]
        model.int32A = [0, Int32.max / 2, Int32.max]
        model.int64A = [0, Int64.max / 2, Int64.max]

        model.intAOpt = [0, Int.max / 2, Int.max]
        model.int8AOpt = [0, Int8.max / 2, Int8.max]
        model.int16AOpt = [0, Int16.max / 2, Int16.max]
        model.int32AOpt = [0, Int32.max / 2, Int32.max]
        model.int64AOpt = [0, Int64.max / 2, Int64.max]

        model.intAOptNil = nil
        model.int8AOptNil = nil
        model.int16AOptNil = nil
        model.int32AOptNil = nil
        model.int64AOptNil = nil

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile("/tmp/intArray.plist")

        let decoder=Decoder(path: "/tmp/intArray.plist")
        let reModel = SignedIntegerModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.intA == model.intA)
            XCTAssert(reModel!.int8A == model.int8A)
            XCTAssert(reModel!.int16A == model.int16A)
            XCTAssert(reModel!.int32A == model.int32A)
            XCTAssert(reModel!.int64A == model.int64A)

            XCTAssert(reModel!.intAOpt! == model.intAOpt!)
            XCTAssert(reModel!.int8AOpt! == model.int8AOpt!)
            XCTAssert(reModel!.int16AOpt! == model.int16AOpt!)
            XCTAssert(reModel!.int32AOpt! == model.int32AOpt!)
            XCTAssert(reModel!.int64AOpt! == model.int64AOpt!)

            XCTAssert(reModel!.intAOptNil == nil)
            XCTAssert(reModel!.int8AOptNil == nil)
            XCTAssert(reModel!.int16AOptNil == nil)
            XCTAssert(reModel!.int32AOptNil == nil)
            XCTAssert(reModel!.int64AOptNil == nil)
        }
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

    func testImageEncodingDecoding() {
        let model = ImageModel()

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile("/tmp/image.plist")

        let decoder=Decoder(path: "/tmp/image.plist")
        let reModel = ImageModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(CGSizeEqualToSize(reModel!.image.size, model.image.size))
            XCTAssert(reModel!.imageOpt != nil)
            XCTAssert(CGSizeEqualToSize(reModel!.imageOpt!.size, model.imageOpt!.size))
            XCTAssert(reModel!.imageOptNil == nil)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
