//
//  CMTimeTests.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import XCTest

import AVFoundation

class AVFoundationTests: XCTestCase {

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
        model.timeOptNil = nil

        model.timeA = [CMTime(seconds: 15.0, preferredTimescale: 3000),
            CMTime(seconds: 20.0, preferredTimescale: 3000)]
        model.timeOptA = [CMTime(seconds: 15.0, preferredTimescale: 3000),
            CMTime(seconds: 20.0, preferredTimescale: 3000)]
        model.timeOptNilA = nil

        model.timeD = ["a": CMTime(seconds: 14.0, preferredTimescale: 3000),
            "b": CMTime(seconds: 29.0, preferredTimescale: 3000)]
        model.timeOptD = ["a": CMTime(seconds: 24.0, preferredTimescale: 3000),
            "b": CMTime(seconds: 19.0, preferredTimescale: 3000)]
        model.timeOptNilD = nil

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = CMTimeModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.time == CMTime(seconds: 10.0, preferredTimescale: 3000))
            XCTAssert(reModel!.timeOpt! == CMTime(seconds: 20.0, preferredTimescale: 3000))
            XCTAssert(reModel!.timeOptNil == nil)

            XCTAssert(reModel!.timeA == [CMTime(seconds: 15.0, preferredTimescale: 3000),
                CMTime(seconds: 20.0, preferredTimescale: 3000)])
            XCTAssert(reModel!.timeOptA! == [CMTime(seconds: 15.0, preferredTimescale: 3000),
                CMTime(seconds: 20.0, preferredTimescale: 3000)])
            XCTAssert(reModel!.timeOptNilA == nil)

            XCTAssert(reModel!.timeD == ["a": CMTime(seconds: 14.0, preferredTimescale: 3000),
                "b": CMTime(seconds: 29.0, preferredTimescale: 3000)])
            XCTAssert(reModel!.timeOptD! == ["a": CMTime(seconds: 24.0, preferredTimescale: 3000),
                "b": CMTime(seconds: 19.0, preferredTimescale: 3000)])
            XCTAssert(reModel!.timeOptNilD == nil)
        }
    }

    func testConstCMTimeEncodingDecoding() {
        let fileName = "/tmp/constcmtime.plist"

        let time = CMTime(seconds: 10.0, preferredTimescale: 3000)
        let timeOpt = CMTime(seconds: 20.0, preferredTimescale: 3000)

        let timeA = [CMTime(seconds: 15.0, preferredTimescale: 3000),
            CMTime(seconds: 20.0, preferredTimescale: 3000)]
        let timeOptA = [CMTime(seconds: 15.0, preferredTimescale: 3000),
            CMTime(seconds: 20.0, preferredTimescale: 3000)]

        let timeD = ["a": CMTime(seconds: 14.0, preferredTimescale: 3000),
            "b": CMTime(seconds: 29.0, preferredTimescale: 3000)]
        let timeOptD = ["a": CMTime(seconds: 24.0, preferredTimescale: 3000),
            "b": CMTime(seconds: 19.0, preferredTimescale: 3000)]

        let model = ConstCMTimeModel(time: time,
            timeOpt: timeOpt,
            timeOptNil: nil,
            timeA: timeA,
            timeOptA: timeOptA,
            timeOptNilA: nil,
            timeD: timeD,
            timeOptD: timeOptD,
            timeOptNilD: nil
        )

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = ConstCMTimeModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.time == CMTime(seconds: 10.0, preferredTimescale: 3000))
            XCTAssert(reModel!.timeOpt! == CMTime(seconds: 20.0, preferredTimescale: 3000))
            XCTAssert(reModel!.timeOptNil == nil)

            XCTAssert(reModel!.timeA == [CMTime(seconds: 15.0, preferredTimescale: 3000),
                CMTime(seconds: 20.0, preferredTimescale: 3000)])
            XCTAssert(reModel!.timeOptA! == [CMTime(seconds: 15.0, preferredTimescale: 3000),
                CMTime(seconds: 20.0, preferredTimescale: 3000)])
            XCTAssert(reModel!.timeOptNilA == nil)

            XCTAssert(reModel!.timeD == ["a": CMTime(seconds: 14.0, preferredTimescale: 3000),
                "b": CMTime(seconds: 29.0, preferredTimescale: 3000)])
            XCTAssert(reModel!.timeOptD! == ["a": CMTime(seconds: 24.0, preferredTimescale: 3000),
                "b": CMTime(seconds: 19.0, preferredTimescale: 3000)])
            XCTAssert(reModel!.timeOptNilD == nil)
        }
    }

}
