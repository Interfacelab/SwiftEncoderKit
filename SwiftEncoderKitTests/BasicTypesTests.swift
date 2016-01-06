//
//  BasicTypesTests.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import XCTest

class BasicTypesTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFloatTypes() {
        let model = BasicTypesModel()

        model.float = Float.infinity
        model.floatOpt = FLT_MAX / 2.0
        model.floatOptNil = nil

        model.double = Double.infinity
        model.doubleOpt = DBL_MAX / 2.0
        model.doubleOptNil = nil

        model.floatA = [0.0, FLT_MAX / 2.0, Float.infinity]
        model.floatAOpt = [0.0, FLT_MAX / 2.0, Float.infinity]
        model.floatAOptNil = nil

        model.doubleA = [0.0, DBL_MAX / 2.0, Double.infinity]
        model.doubleAOpt = [0.0, DBL_MAX / 2.0, Double.infinity]
        model.doubleAOptNil = nil

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile("/tmp/float.plist")

        let decoder=Decoder(path: "/tmp/float.plist")
        let reModel = BasicTypesModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.float == Float.infinity)
            XCTAssert(reModel!.floatOpt == FLT_MAX / 2.0)
            XCTAssert(reModel!.floatOptNil == nil)

            XCTAssert(reModel!.double == Double.infinity)
            XCTAssert(reModel!.doubleOpt == DBL_MAX / 2.0)
            XCTAssert(reModel!.doubleOptNil == nil)

            XCTAssert(reModel!.floatA == [0.0, FLT_MAX / 2.0, Float.infinity])
            XCTAssert(reModel!.floatAOpt! == [0.0, FLT_MAX / 2.0, Float.infinity])
            XCTAssert(reModel!.floatAOptNil == nil)

            XCTAssert(reModel!.doubleA == [0.0, DBL_MAX / 2.0, Double.infinity])
            XCTAssert(reModel!.doubleAOpt! == [0.0, DBL_MAX / 2.0, Double.infinity])
            XCTAssert(reModel!.doubleAOptNil == nil)
        }
    }

    func testStringTypes() {
        let model = BasicTypesModel()

        model.string = "We hold"
        model.stringOpt = "these truths"
        model.stringOptNil = nil

        model.stringA = ["a","b","a","c","a"]
        model.stringAOpt = ["c","d","e","a","f"]
        model.stringAOptNil = nil

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile("/tmp/string.plist")

        let decoder=Decoder(path: "/tmp/string.plist")
        let reModel = BasicTypesModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.string == "We hold")
            XCTAssert(reModel!.stringOpt! == "these truths")
            XCTAssert(reModel!.stringOptNil == nil)

            XCTAssert(reModel!.stringA == ["a","b","a","c","a"])
            XCTAssert(reModel!.stringAOpt! == ["c","d","e","a","f"])
            XCTAssert(reModel!.stringAOptNil == nil)
        }
    }

}
