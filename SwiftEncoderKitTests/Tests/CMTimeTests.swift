//
//  CMTimeTests.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import XCTest

import AVFoundation

class CMTimeTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCMTimeEncodingDecoding() {
        let fileName = "/tmp/cmtime.plist"

        let model = CMTimeModel()

        model.time = CMTime(seconds: 10.0, preferredTimescale: 3000)
        model.timeOpt = CMTime(seconds: 20.0, preferredTimescale: 3000)

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = CMTimeModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.time == CMTime(seconds: 10.0, preferredTimescale: 3000))
            XCTAssert(reModel!.timeOpt! == CMTime(seconds: 20.0, preferredTimescale: 3000))
        }
    }

}
