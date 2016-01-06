//
//  NSCodingTests.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import XCTest

class NSCodingTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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
    
}
