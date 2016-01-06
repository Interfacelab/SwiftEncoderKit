//
//  BasicTypesTests.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import XCTest

class StructTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testStructs() {
        let model = EncodableRect(origin: EncodablePoint(x: 150, y: 350),
            size: EncodableSize(width: 1000, height: 2000))

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile("/tmp/struct.plist")

        let decoder=Decoder(path: "/tmp/struct.plist")
        let reModel = EncodableRect(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.origin.x == 150)
            XCTAssert(reModel!.origin.y == 350)
            XCTAssert(reModel!.size.width == 1000)
            XCTAssert(reModel!.size.height == 2000)
        }
    }

    func testImmutableStruct() {
        let model = ImmutableStruct(int: 130, bool: true, string: "Hey Now", float: 666.0,
            double: 124.0, uint: 32, intArray: [12, 24, 36])

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile("/tmp/immutable-struct.plist")

        let decoder=Decoder(path: "/tmp/immutable-struct.plist")
        let reModel = ImmutableStruct(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.int == 130)
            XCTAssert(reModel!.bool == true)
            XCTAssert(reModel!.string == "Hey Now")
            XCTAssert(reModel!.float == 666.0)
            XCTAssert(reModel!.double == 124.0)
            XCTAssert(reModel!.uint == 32)
            XCTAssert(reModel!.intArray == [12, 24, 36])
        }
    }
    
}
