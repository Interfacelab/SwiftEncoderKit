//
//  Shave_iOSTests.swift
//  Shave iOSTests
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//

import XCTest

class SignedIntegerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIntegerEncodingDecoding() {
        let fileName = "/tmp/signed.plist"
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
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
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

    func testArrayEncodingDecoding() {
        let fileName = "/tmp/intArray.plist"

        let model = SignedIntegerArrayModel()

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
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = SignedIntegerArrayModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.intA == [0, Int.max / 2, Int.max])
            XCTAssert(reModel!.int8A == [0, Int8.max / 2, Int8.max])
            XCTAssert(reModel!.int16A == [0, Int16.max / 2, Int16.max])
            XCTAssert(reModel!.int32A == [0, Int32.max / 2, Int32.max])
            XCTAssert(reModel!.int64A == [0, Int64.max / 2, Int64.max])

            XCTAssert(reModel!.intAOpt! == [0, Int.max / 2, Int.max])
            XCTAssert(reModel!.int8AOpt! == [0, Int8.max / 2, Int8.max])
            XCTAssert(reModel!.int16AOpt! == [0, Int16.max / 2, Int16.max])
            XCTAssert(reModel!.int32AOpt! == [0, Int32.max / 2, Int32.max])
            XCTAssert(reModel!.int64AOpt! == [0, Int64.max / 2, Int64.max])

            XCTAssert(reModel!.intAOptNil == nil)
            XCTAssert(reModel!.int8AOptNil == nil)
            XCTAssert(reModel!.int16AOptNil == nil)
            XCTAssert(reModel!.int32AOptNil == nil)
            XCTAssert(reModel!.int64AOptNil == nil)
        }
    }

    func testConstIntegerEncodingDecoding() {
        let fileName = "/tmp/const.plist"
        let model = ConstSignedIntegerModel(int: Int.max, int8: Int8.max, int16: Int16.max,
            int32: Int32.max, int64: Int64.max, intOpt: Int.max, int8Opt: Int8.max,
            int16Opt: Int16.max, int32Opt: Int32.max, int64Opt: Int64.max, intOptNil: nil,
            int8OptNil: nil, int16OptNil: nil, int32OptNil: nil, int64OptNil: nil)

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = ConstSignedIntegerModel(decoder)

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

    func testConstArrayEncodingDecoding() {
        let fileName = "/tmp/constIntArray.plist"

        let intA = [0, Int.max / 2, Int.max]
        let int8A = [0, Int8.max / 2, Int8.max]
        let int16A = [0, Int16.max / 2, Int16.max]
        let int32A = [0, Int32.max / 2, Int32.max]
        let int64A = [0, Int64.max / 2, Int64.max]

        let model = ConstSignedIntegerArrayModel(intA: intA, int8A: int8A, int16A: int16A,
            int32A: int32A, int64A: int64A, intAOpt: intA, int8AOpt: int8A, int16AOpt: int16A,
            int32AOpt: int32A, int64AOpt: int64A, intAOptNil: nil, int8AOptNil: nil,
            int16AOptNil: nil, int32AOptNil: nil, int64AOptNil: nil)

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = ConstSignedIntegerArrayModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.intA == [0, Int.max / 2, Int.max])
            XCTAssert(reModel!.int8A == [0, Int8.max / 2, Int8.max])
            XCTAssert(reModel!.int16A == [0, Int16.max / 2, Int16.max])
            XCTAssert(reModel!.int32A == [0, Int32.max / 2, Int32.max])
            XCTAssert(reModel!.int64A == [0, Int64.max / 2, Int64.max])

            XCTAssert(reModel!.intAOpt! == [0, Int.max / 2, Int.max])
            XCTAssert(reModel!.int8AOpt! == [0, Int8.max / 2, Int8.max])
            XCTAssert(reModel!.int16AOpt! == [0, Int16.max / 2, Int16.max])
            XCTAssert(reModel!.int32AOpt! == [0, Int32.max / 2, Int32.max])
            XCTAssert(reModel!.int64AOpt! == [0, Int64.max / 2, Int64.max])

            XCTAssert(reModel!.intAOptNil == nil)
            XCTAssert(reModel!.int8AOptNil == nil)
            XCTAssert(reModel!.int16AOptNil == nil)
            XCTAssert(reModel!.int32AOptNil == nil)
            XCTAssert(reModel!.int64AOptNil == nil)
        }
    }
}
