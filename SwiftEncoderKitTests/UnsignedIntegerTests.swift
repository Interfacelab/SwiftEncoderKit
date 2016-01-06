//
//  Shave_iOSTests.swift
//  Shave iOSTests
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
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

    func testIntegerEncodingDecoding() {
        let fileName = "/tmp/unsigned.plist"
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
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
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

    func testArrayEncodingDecoding() {
        let fileName = "/tmp/uuintArray.plist"

        let model = UnsignedIntegerArrayModel()

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
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = UnsignedIntegerArrayModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.uintA == [0, UInt.max / 2, UInt.max])
            XCTAssert(reModel!.uint8A == [0, UInt8.max / 2, UInt8.max])
            XCTAssert(reModel!.uint16A == [0, UInt16.max / 2, UInt16.max])
            XCTAssert(reModel!.uint32A == [0, UInt32.max / 2, UInt32.max])
            XCTAssert(reModel!.uint64A == [0, UInt64.max / 2, UInt64.max])

            XCTAssert(reModel!.uintAOpt! == [0, UInt.max / 2, UInt.max])
            XCTAssert(reModel!.uint8AOpt! == [0, UInt8.max / 2, UInt8.max])
            XCTAssert(reModel!.uint16AOpt! == [0, UInt16.max / 2, UInt16.max])
            XCTAssert(reModel!.uint32AOpt! == [0, UInt32.max / 2, UInt32.max])
            XCTAssert(reModel!.uint64AOpt! == [0, UInt64.max / 2, UInt64.max])

            XCTAssert(reModel!.uintAOptNil == nil)
            XCTAssert(reModel!.uint8AOptNil == nil)
            XCTAssert(reModel!.uint16AOptNil == nil)
            XCTAssert(reModel!.uint32AOptNil == nil)
            XCTAssert(reModel!.uint64AOptNil == nil)
        }
    }

    func testConstIntegerEncodingDecoding() {
        let fileName = "/tmp/constUnsigned.plist"
        let model = ConstUnsignedIntegerModel(uint: UInt.max, uint8: UInt8.max, uint16: UInt16.max,
            uint32: UInt32.max, uint64: UInt64.max, uintOpt: UInt.max, uint8Opt: UInt8.max,
            uint16Opt: UInt16.max, uint32Opt: UInt32.max, uint64Opt: UInt64.max, uintOptNil: nil,
            uint8OptNil: nil, uint16OptNil: nil, uint32OptNil: nil, uint64OptNil: nil)

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = ConstUnsignedIntegerModel(decoder)

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

    func testConstArrayEncodingDecoding() {
        let fileName = "/tmp/constUIntArray.plist"

        let uintA = [0, UInt.max / 2, UInt.max]
        let uint8A = [0, UInt8.max / 2, UInt8.max]
        let uint16A = [0, UInt16.max / 2, UInt16.max]
        let uint32A = [0, UInt32.max / 2, UInt32.max]
        let uint64A = [0, UInt64.max / 2, UInt64.max]

        let model = ConstUnsignedIntegerArrayModel(uintA: uintA, uint8A: uint8A, uint16A: uint16A,
            uint32A: uint32A, uint64A: uint64A, uintAOpt: uintA, uint8AOpt: uint8A,
            uint16AOpt: uint16A, uint32AOpt: uint32A, uint64AOpt: uint64A, uintAOptNil: nil,
            uint8AOptNil: nil, uint16AOptNil: nil, uint32AOptNil: nil, uint64AOptNil: nil)

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = ConstUnsignedIntegerArrayModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.uintA == [0, UInt.max / 2, UInt.max])
            XCTAssert(reModel!.uint8A == [0, UInt8.max / 2, UInt8.max])
            XCTAssert(reModel!.uint16A == [0, UInt16.max / 2, UInt16.max])
            XCTAssert(reModel!.uint32A == [0, UInt32.max / 2, UInt32.max])
            XCTAssert(reModel!.uint64A == [0, UInt64.max / 2, UInt64.max])

            XCTAssert(reModel!.uintAOpt! == [0, UInt.max / 2, UInt.max])
            XCTAssert(reModel!.uint8AOpt! == [0, UInt8.max / 2, UInt8.max])
            XCTAssert(reModel!.uint16AOpt! == [0, UInt16.max / 2, UInt16.max])
            XCTAssert(reModel!.uint32AOpt! == [0, UInt32.max / 2, UInt32.max])
            XCTAssert(reModel!.uint64AOpt! == [0, UInt64.max / 2, UInt64.max])
            
            XCTAssert(reModel!.uintAOptNil == nil)
            XCTAssert(reModel!.uint8AOptNil == nil)
            XCTAssert(reModel!.uint16AOptNil == nil)
            XCTAssert(reModel!.uint32AOptNil == nil)
            XCTAssert(reModel!.uint64AOptNil == nil)
        }
    }
}
