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
import UIKit

class SignedIntegerTests: XCTestCase {
    
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
    
}
