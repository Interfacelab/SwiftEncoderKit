//
//  APITests.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/4/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import XCTest

class APITests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testAPI() {
        let fileName = "/tmp/api.plist"

        let model = APIModel()

        model.int = Int.max
        model.uint = UInt.max
        model.float = Float.infinity
        model.double = Double.infinity
        model.string = "This String"
        model.color = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        model.bool = true

        model.intNotEncoded = Int.max / 2
        model.uintNotEncoded = UInt.max / 2
        model.floatNotEncoded = Float.infinity / 2.0
        model.doubleNotEncoded =  Double.infinity / 2.0
        model.stringNotEncoded = "Not this string"
        model.colorNotEncoded = UIColor.greenColor()
        model.boolNotEncoded = true

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = APIModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.int == Int.max)
            XCTAssert(reModel!.uint == UInt.max)
            XCTAssert(reModel!.float == Float.infinity)
            XCTAssert(reModel!.double == Double.infinity)
            XCTAssert(reModel!.string == "This String")
            XCTAssert(reModel!.bool == true)
            XCTAssert(reModel!.intNotEncoded == nil)
            XCTAssert(reModel!.uintNotEncoded == nil)
            XCTAssert(reModel!.floatNotEncoded == nil)
            XCTAssert(reModel!.doubleNotEncoded == nil)
            XCTAssert(reModel!.stringNotEncoded == nil)
            XCTAssert(reModel!.colorNotEncoded == nil)
            XCTAssert(reModel!.boolNotEncoded == nil)

            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0

            reModel!.color.getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 1.0)
            XCTAssert(g == 0.0)
            XCTAssert(b == 0.0)
            XCTAssert(a == 1.0)
        }
    }

    func testAPIArray() {
        let fileName = "/tmp/api-array.plist"

        let model = APIArrayModel()

        model.intA = [0, Int.max]
        model.uintA = [0, UInt.max]
        model.floatA = [0, Float.infinity]
        model.doubleA = [0, Double.infinity]
        model.stringA = ["That String", "This String"]
        model.colorA = [UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0,
            green: 1.0, blue: 0.0, alpha: 1.0)]
        model.boolA = [true, false, true]

        model.intANotEncoded = [0, Int.max]
        model.uintANotEncoded = [0, UInt.max]
        model.floatANotEncoded = [0, Float.infinity]
        model.doubleANotEncoded = [0, Double.infinity]
        model.stringANotEncoded = ["That String", "This String"]
        model.colorA = [UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0,
            green: 1.0, blue: 0.0, alpha: 1.0)]
        model.boolANotEncoded = [true, false, true]

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = APIArrayModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.intA == [0, Int.max])
            XCTAssert(reModel!.uintA == [0, UInt.max])
            XCTAssert(reModel!.floatA == [0, Float.infinity])
            XCTAssert(reModel!.doubleA == [0, Double.infinity])
            XCTAssert(reModel!.stringA == ["That String", "This String"])
            XCTAssert(reModel!.boolA == [true, false, true])

            XCTAssert(reModel!.intANotEncoded == nil)
            XCTAssert(reModel!.uintANotEncoded == nil)
            XCTAssert(reModel!.floatANotEncoded == nil)
            XCTAssert(reModel!.doubleANotEncoded == nil)
            XCTAssert(reModel!.stringANotEncoded == nil)
            XCTAssert(reModel!.colorANotEncoded == nil)
            XCTAssert(reModel!.boolANotEncoded == nil)

            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0

            reModel!.colorA[0].getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 1.0)
            XCTAssert(g == 0.0)
            XCTAssert(b == 0.0)
            XCTAssert(a == 1.0)

            reModel!.colorA[1].getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 1.0)
            XCTAssert(g == 1.0)
            XCTAssert(b == 0.0)
            XCTAssert(a == 1.0)
        }
    }

}
