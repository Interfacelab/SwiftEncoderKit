//
//  EnumDictionaryTests.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import XCTest

class EnumDictionaryTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testDictionaryEncodingDecoding() {
        let fileName = "/tmp/enumDict.plist"

        let model = EnumDictionaryModel()

        model.int = ["a": .value2, "b": .value3]
        model.int8 = ["a": .value3, "b": .value3]
        model.int16 = ["a": .value2, "b": .value3]
        model.int32 = ["a": .value3, "b": .value3]
        model.int64 = ["a": .value2, "b": .value3]
        model.uint = ["a": .value3, "b": .value3]
        model.uint8 = ["a": .value2, "b": .value3]
        model.uint16 = ["a": .value3, "b": .value3]
        model.uint32 = ["a": .value2, "b": .value3]
        model.uint64 = ["a": .value3, "b": .value3]
        model.float = ["a": .value2, "b": .value3]
        model.double = ["a": .value3, "b": .value3]
        model.string = ["a": .value2, "b": .value3]
        model.character = ["a": .value3, "b": .value3]

        model.intOpt = ["a": .value2, "b": .value3]
        model.int8Opt = ["a": .value3, "b": .value3]
        model.int16Opt = ["a": .value2, "b": .value3]
        model.int32Opt = ["a": .value3, "b": .value3]
        model.int64Opt = ["a": .value2, "b": .value3]
        model.uintOpt = ["a": .value3, "b": .value3]
        model.uint8Opt = ["a": .value2, "b": .value3]
        model.uint16Opt = ["a": .value3, "b": .value3]
        model.uint32Opt = ["a": .value2, "b": .value3]
        model.uint64Opt = ["a": .value3, "b": .value3]
        model.floatOpt = ["a": .value2, "b": .value3]
        model.doubleOpt = ["a": .value3, "b": .value3]
        model.stringOpt = ["a": .value2, "b": .value3]
        model.characterOpt = ["a": .value3, "b": .value3]

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
        let reModel:EnumDictionaryModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.int == ["a": .value2, "b": .value3])
            XCTAssert(reModel!.int8 == ["a": .value3, "b": .value3])
            XCTAssert(reModel!.int16 == ["a": .value2, "b": .value3])
            XCTAssert(reModel!.int32 == ["a": .value3, "b": .value3])
            XCTAssert(reModel!.int64 == ["a": .value2, "b": .value3])
            XCTAssert(reModel!.uint == ["a": .value3, "b": .value3])
            XCTAssert(reModel!.uint8 == ["a": .value2, "b": .value3])
            XCTAssert(reModel!.uint16 == ["a": .value3, "b": .value3])
            XCTAssert(reModel!.uint32 == ["a": .value2, "b": .value3])
            XCTAssert(reModel!.uint64 == ["a": .value3, "b": .value3])
            XCTAssert(reModel!.float == ["a": .value2, "b": .value3])
            XCTAssert(reModel!.double == ["a": .value3, "b": .value3])
            XCTAssert(reModel!.string == ["a": .value2, "b": .value3])
            XCTAssert(reModel!.character == ["a": .value3, "b": .value3])
            XCTAssert(reModel!.intOpt! == ["a": .value2, "b": .value3])
            XCTAssert(reModel!.int8Opt! == ["a": .value3, "b": .value3])
            XCTAssert(reModel!.int16Opt! == ["a": .value2, "b": .value3])
            XCTAssert(reModel!.int32Opt! == ["a": .value3, "b": .value3])
            XCTAssert(reModel!.int64Opt! == ["a": .value2, "b": .value3])
            XCTAssert(reModel!.uintOpt! == ["a": .value3, "b": .value3])
            XCTAssert(reModel!.uint8Opt! == ["a": .value2, "b": .value3])
            XCTAssert(reModel!.uint16Opt! == ["a": .value3, "b": .value3])
            XCTAssert(reModel!.uint32Opt! == ["a": .value2, "b": .value3])
            XCTAssert(reModel!.uint64Opt! == ["a": .value3, "b": .value3])
            XCTAssert(reModel!.floatOpt! == ["a": .value2, "b": .value3])
            XCTAssert(reModel!.doubleOpt! == ["a": .value3, "b": .value3])
            XCTAssert(reModel!.stringOpt! == ["a": .value2, "b": .value3])
            XCTAssert(reModel!.characterOpt! == ["a": .value3, "b": .value3])

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



    func testConstDictionaryEncodingDecoding() {
        let fileName = "/tmp/constEnumDict.plist"

        let int: [String: IntEnum] = ["a": .value2, "b": .value2]
        let int8: [String: Int8Enum] = ["a": .value3, "b": .value2]
        let int16: [String: Int16Enum] = ["a": .value2, "b": .value2]
        let int32: [String: Int32Enum] = ["a": .value3, "b": .value2]
        let int64: [String: Int64Enum] = ["a": .value2, "b": .value2]
        let uint: [String: UIntEnum] = ["a": .value3, "b": .value2]
        let uint8: [String: UInt8Enum] = ["a": .value2, "b": .value2]
        let uint16: [String: UInt16Enum] = ["a": .value3, "b": .value2]
        let uint32: [String: UInt32Enum] = ["a": .value2, "b": .value2]
        let uint64: [String: UInt64Enum] = ["a": .value3, "b": .value2]
        let float: [String: FloatEnum] = ["a": .value2, "b": .value2]
        let double: [String: DoubleEnum] = ["a": .value3, "b": .value2]
        let string: [String: StringEnum] = ["a": .value2, "b": .value2]
        let character: [String: CharacterEnum] = ["a": .value3, "b": .value2]

        let intOpt: [String: IntEnum] = ["a": .value2, "b": .value2]
        let int8Opt: [String: Int8Enum] = ["a": .value3, "b": .value2]
        let int16Opt: [String: Int16Enum] = ["a": .value2, "b": .value2]
        let int32Opt: [String: Int32Enum] = ["a": .value3, "b": .value2]
        let int64Opt: [String: Int64Enum] = ["a": .value2, "b": .value2]
        let uintOpt: [String: UIntEnum] = ["a": .value3, "b": .value2]
        let uint8Opt: [String: UInt8Enum] = ["a": .value2, "b": .value2]
        let uint16Opt: [String: UInt16Enum] = ["a": .value3, "b": .value2]
        let uint32Opt: [String: UInt32Enum] = ["a": .value2, "b": .value2]
        let uint64Opt: [String: UInt64Enum] = ["a": .value3, "b": .value2]
        let floatOpt: [String: FloatEnum] = ["a": .value2, "b": .value2]
        let doubleOpt: [String: DoubleEnum] = ["a": .value3, "b": .value2]
        let stringOpt: [String: StringEnum] = ["a": .value2, "b": .value2]
        let characterOpt: [String: CharacterEnum] = ["a": .value3, "b": .value2]

        let model = ConstEnumDictionaryModel(int: int,
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
        let reModel:ConstEnumDictionaryModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.int == ["a": .value2, "b": .value2])
            XCTAssert(reModel!.int8 == ["a": .value3, "b": .value2])
            XCTAssert(reModel!.int16 == ["a": .value2, "b": .value2])
            XCTAssert(reModel!.int32 == ["a": .value3, "b": .value2])
            XCTAssert(reModel!.int64 == ["a": .value2, "b": .value2])
            XCTAssert(reModel!.uint == ["a": .value3, "b": .value2])
            XCTAssert(reModel!.uint8 == ["a": .value2, "b": .value2])
            XCTAssert(reModel!.uint16 == ["a": .value3, "b": .value2])
            XCTAssert(reModel!.uint32 == ["a": .value2, "b": .value2])
            XCTAssert(reModel!.uint64 == ["a": .value3, "b": .value2])
            XCTAssert(reModel!.float == ["a": .value2, "b": .value2])
            XCTAssert(reModel!.double == ["a": .value3, "b": .value2])
            XCTAssert(reModel!.string == ["a": .value2, "b": .value2])
            XCTAssert(reModel!.character == ["a": .value3, "b": .value2])

            XCTAssert(reModel!.intOpt! == ["a": .value2, "b": .value2])
            XCTAssert(reModel!.int8Opt! == ["a": .value3, "b": .value2])
            XCTAssert(reModel!.int16Opt! == ["a": .value2, "b": .value2])
            XCTAssert(reModel!.int32Opt! == ["a": .value3, "b": .value2])
            XCTAssert(reModel!.int64Opt! == ["a": .value2, "b": .value2])
            XCTAssert(reModel!.uintOpt! == ["a": .value3, "b": .value2])
            XCTAssert(reModel!.uint8Opt! == ["a": .value2, "b": .value2])
            XCTAssert(reModel!.uint16Opt! == ["a": .value3, "b": .value2])
            XCTAssert(reModel!.uint32Opt! == ["a": .value2, "b": .value2])
            XCTAssert(reModel!.uint64Opt! == ["a": .value3, "b": .value2])
            XCTAssert(reModel!.floatOpt! == ["a": .value2, "b": .value2])
            XCTAssert(reModel!.doubleOpt! == ["a": .value3, "b": .value2])
            XCTAssert(reModel!.stringOpt! == ["a": .value2, "b": .value2])
            XCTAssert(reModel!.characterOpt! == ["a": .value3, "b": .value2])

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
