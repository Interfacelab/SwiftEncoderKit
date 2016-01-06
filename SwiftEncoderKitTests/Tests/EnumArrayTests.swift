//
//  EnumArrayTests.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import XCTest

class EnumArrayTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testArrayEncodingDecoding() {
        let fileName = "/tmp/enumArray.plist"

        let model = EnumArrayModel()

        model.int = [.value2, .value3, .value1]
        model.int8 = [.value3, .value3, .value1]
        model.int16 = [.value2, .value3, .value1]
        model.int32 = [.value3, .value3, .value1]
        model.int64 = [.value2, .value3, .value1]

        model.uint = [.value3, .value3, .value1]
        model.uint8 = [.value2, .value3, .value1]
        model.uint16 = [.value3, .value3, .value1]
        model.uint32 = [.value2, .value3, .value1]
        model.uint64 = [.value3, .value3, .value1]

        model.float = [.value2, .value3, .value1]
        model.double = [.value3, .value3, .value1]
        model.string = [.value2, .value3, .value1]
        model.character = [.value3, .value3, .value1]

        model.intOpt = [.value2, .value3, .value1]
        model.int8Opt = [.value3, .value3, .value1]
        model.int16Opt = [.value2, .value3, .value1]
        model.int32Opt = [.value3, .value3, .value1]
        model.int64Opt = [.value2, .value3, .value1]

        model.uintOpt = [.value3, .value3, .value1]
        model.uint8Opt = [.value2, .value3, .value1]
        model.uint16Opt = [.value3, .value3, .value1]
        model.uint32Opt = [.value2, .value3, .value1]
        model.uint64Opt = [.value3, .value3, .value1]

        model.floatOpt = [.value2, .value3, .value1]
        model.doubleOpt = [.value3, .value3, .value1]
        model.stringOpt = [.value2, .value3, .value1]
        model.characterOpt = [.value3, .value3, .value1]

        model.intOptNil = nil
        model.int8OptNil = nil
        model.int16OptNil = nil
        model.int32OptNil = nil
        model.int64OptNil = nil
        model.uintOptNil = nil
        model.uint8OptNil = nil
        model.uint16OptNil = nil
        model.uint32OptNil = nil
        model.uint64OptNil = nil
        model.floatOptNil = nil
        model.doubleOptNil = nil
        model.stringOptNil = nil
        model.characterOptNil = nil

        Encoder(model).writeToFile(fileName)
        let reModel:EnumArrayModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.int == [.value2, .value3, .value1])
            XCTAssert(reModel!.int8 == [.value3, .value3, .value1])
            XCTAssert(reModel!.int16 == [.value2, .value3, .value1])
            XCTAssert(reModel!.int32 == [.value3, .value3, .value1])
            XCTAssert(reModel!.int64 == [.value2, .value3, .value1])
            XCTAssert(reModel!.uint == [.value3, .value3, .value1])
            XCTAssert(reModel!.uint8 == [.value2, .value3, .value1])
            XCTAssert(reModel!.uint16 == [.value3, .value3, .value1])
            XCTAssert(reModel!.uint32 == [.value2, .value3, .value1])
            XCTAssert(reModel!.uint64 == [.value3, .value3, .value1])
            XCTAssert(reModel!.float == [.value2, .value3, .value1])
            XCTAssert(reModel!.double == [.value3, .value3, .value1])
            XCTAssert(reModel!.string == [.value2, .value3, .value1])
            XCTAssert(reModel!.character == [.value3, .value3, .value1])
            XCTAssert(reModel!.intOpt! == [.value2, .value3, .value1])
            XCTAssert(reModel!.int8Opt! == [.value3, .value3, .value1])
            XCTAssert(reModel!.int16Opt! == [.value2, .value3, .value1])
            XCTAssert(reModel!.int32Opt! == [.value3, .value3, .value1])
            XCTAssert(reModel!.int64Opt! == [.value2, .value3, .value1])
            XCTAssert(reModel!.uintOpt! == [.value3, .value3, .value1])
            XCTAssert(reModel!.uint8Opt! == [.value2, .value3, .value1])
            XCTAssert(reModel!.uint16Opt! == [.value3, .value3, .value1])
            XCTAssert(reModel!.uint32Opt! == [.value2, .value3, .value1])
            XCTAssert(reModel!.uint64Opt! == [.value3, .value3, .value1])
            XCTAssert(reModel!.floatOpt! == [.value2, .value3, .value1])
            XCTAssert(reModel!.doubleOpt! == [.value3, .value3, .value1])
            XCTAssert(reModel!.stringOpt! == [.value2, .value3, .value1])
            XCTAssert(reModel!.characterOpt! == [.value3, .value3, .value1])

            XCTAssert(reModel!.intOptNil == nil)
            XCTAssert(reModel!.int8OptNil == nil)
            XCTAssert(reModel!.int16OptNil == nil)
            XCTAssert(reModel!.int32OptNil == nil)
            XCTAssert(reModel!.int64OptNil == nil)
            XCTAssert(reModel!.uintOptNil == nil)
            XCTAssert(reModel!.uint8OptNil == nil)
            XCTAssert(reModel!.uint16OptNil == nil)
            XCTAssert(reModel!.uint32OptNil == nil)
            XCTAssert(reModel!.uint64OptNil == nil)
            XCTAssert(reModel!.floatOptNil == nil)
            XCTAssert(reModel!.doubleOptNil == nil)
            XCTAssert(reModel!.stringOptNil == nil)
            XCTAssert(reModel!.characterOptNil == nil)
        }
    }

    func testConstArrayEncodingDecoding() {
        let fileName = "/tmp/constEnumArray.plist"

        let int: [IntEnum] = [.value2, .value2]
        let int8: [Int8Enum] = [.value3, .value2]
        let int16: [Int16Enum] = [.value2, .value2]
        let int32: [Int32Enum] = [.value3, .value2]
        let int64: [Int64Enum] = [.value2, .value2]
        let uint: [UIntEnum] = [.value3, .value2]
        let uint8: [UInt8Enum] = [.value2, .value2]
        let uint16: [UInt16Enum] = [.value3, .value2]
        let uint32: [UInt32Enum] = [.value2, .value2]
        let uint64: [UInt64Enum] = [.value3, .value2]
        let float: [FloatEnum] = [.value2, .value2]
        let double: [DoubleEnum] = [.value3, .value2]
        let string: [StringEnum] = [.value2, .value2]
        let character: [CharacterEnum] = [.value3, .value2]

        let intOpt: [IntEnum] = [.value2, .value2]
        let int8Opt: [Int8Enum] = [.value3, .value2]
        let int16Opt: [Int16Enum] = [.value2, .value2]
        let int32Opt: [Int32Enum] = [.value3, .value2]
        let int64Opt: [Int64Enum] = [.value2, .value2]
        let uintOpt: [UIntEnum] = [.value3, .value2]
        let uint8Opt: [UInt8Enum] = [.value2, .value2]
        let uint16Opt: [UInt16Enum] = [.value3, .value2]
        let uint32Opt: [UInt32Enum] = [.value2, .value2]
        let uint64Opt: [UInt64Enum] = [.value3, .value2]
        let floatOpt: [FloatEnum] = [.value2, .value2]
        let doubleOpt: [DoubleEnum] = [.value3, .value2]
        let stringOpt: [StringEnum] = [.value2, .value2]
        let characterOpt: [CharacterEnum] = [.value3, .value2]

        let model = ConstEnumArrayModel(int: int,
            int8: int8,
            int16: int16,
            int32: int32,
            int64: int64,
            uint: uint,
            uint8: uint8,
            uint16: uint16,
            uint32: uint32,
            uint64: uint64,
            string: string,
            float: float,
            double: double,
            character: character,
            intOpt: intOpt,
            int8Opt: int8Opt,
            int16Opt: int16Opt,
            int32Opt: int32Opt,
            int64Opt: int64Opt,
            uintOpt: uintOpt,
            uint8Opt: uint8Opt,
            uint16Opt: uint16Opt,
            uint32Opt: uint32Opt,
            uint64Opt: uint64Opt,
            stringOpt: stringOpt,
            floatOpt: floatOpt,
            doubleOpt: doubleOpt,
            characterOpt: characterOpt,
            intOptNil: nil,
            int8OptNil: nil,
            int16OptNil: nil,
            int32OptNil: nil,
            int64OptNil: nil,
            uintOptNil: nil,
            uint8OptNil: nil,
            uint16OptNil: nil,
            uint32OptNil: nil,
            uint64OptNil: nil,
            stringOptNil: nil,
            floatOptNil: nil,
            doubleOptNil: nil,
            characterOptNil: nil)

        Encoder(model).writeToFile(fileName)
        let reModel:ConstEnumArrayModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.int == [.value2, .value2])
            XCTAssert(reModel!.int8 == [.value3, .value2])
            XCTAssert(reModel!.int16 == [.value2, .value2])
            XCTAssert(reModel!.int32 == [.value3, .value2])
            XCTAssert(reModel!.int64 == [.value2, .value2])
            XCTAssert(reModel!.uint == [.value3, .value2])
            XCTAssert(reModel!.uint8 == [.value2, .value2])
            XCTAssert(reModel!.uint16 == [.value3, .value2])
            XCTAssert(reModel!.uint32 == [.value2, .value2])
            XCTAssert(reModel!.uint64 == [.value3, .value2])
            XCTAssert(reModel!.float == [.value2, .value2])
            XCTAssert(reModel!.double == [.value3, .value2])
            XCTAssert(reModel!.string == [.value2, .value2])
            XCTAssert(reModel!.character == [.value3, .value2])

            XCTAssert(reModel!.intOpt! == [.value2, .value2])
            XCTAssert(reModel!.int8Opt! == [.value3, .value2])
            XCTAssert(reModel!.int16Opt! == [.value2, .value2])
            XCTAssert(reModel!.int32Opt! == [.value3, .value2])
            XCTAssert(reModel!.int64Opt! == [.value2, .value2])
            XCTAssert(reModel!.uintOpt! == [.value3, .value2])
            XCTAssert(reModel!.uint8Opt! == [.value2, .value2])
            XCTAssert(reModel!.uint16Opt! == [.value3, .value2])
            XCTAssert(reModel!.uint32Opt! == [.value2, .value2])
            XCTAssert(reModel!.uint64Opt! == [.value3, .value2])
            XCTAssert(reModel!.floatOpt! == [.value2, .value2])
            XCTAssert(reModel!.doubleOpt! == [.value3, .value2])
            XCTAssert(reModel!.stringOpt! == [.value2, .value2])
            XCTAssert(reModel!.characterOpt! == [.value3, .value2])

            XCTAssert(reModel!.intOptNil == nil)
            XCTAssert(reModel!.int8OptNil == nil)
            XCTAssert(reModel!.int16OptNil == nil)
            XCTAssert(reModel!.int32OptNil == nil)
            XCTAssert(reModel!.int64OptNil == nil)
            XCTAssert(reModel!.uintOptNil == nil)
            XCTAssert(reModel!.uint8OptNil == nil)
            XCTAssert(reModel!.uint16OptNil == nil)
            XCTAssert(reModel!.uint32OptNil == nil)
            XCTAssert(reModel!.uint64OptNil == nil)
            XCTAssert(reModel!.floatOptNil == nil)
            XCTAssert(reModel!.doubleOptNil == nil)
            XCTAssert(reModel!.stringOptNil == nil)
            XCTAssert(reModel!.characterOptNil == nil)
        }
    }

}
