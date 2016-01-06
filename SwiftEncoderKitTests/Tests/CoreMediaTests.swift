//
//  CMTimeTests.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import XCTest

import AVFoundation

class CoreMediaTests: XCTestCase {

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

    func testCMTimeRangeEncodingDecoding() {
        let fileName = "/tmp/cmtimerange.plist"

        let model = CMTimeRangeModel()

        model.timeRange = CMTimeRange(start: CMTime(seconds: 10.0, preferredTimescale: 3000),
            duration: CMTime(seconds: 10.0, preferredTimescale: 3000))

        model.timeRangeOpt = CMTimeRange(start: CMTime(seconds: 20.0, preferredTimescale: 3000),
            duration: CMTime(seconds: 15.0, preferredTimescale: 3000))

        model.timeRangeOptNil = nil

        model.timeRangeA = [
            CMTimeRange(start: CMTime(seconds: 10.0, preferredTimescale: 3000),
                duration: CMTime(seconds: 10.0, preferredTimescale: 3000)),
            CMTimeRange(start: CMTime(seconds: 18.0, preferredTimescale: 3000),
                duration: CMTime(seconds: 18.0, preferredTimescale: 3000))
        ]

        model.timeRangeOptA = [
            CMTimeRange(start: CMTime(seconds: 1.0, preferredTimescale: 3000),
            duration: CMTime(seconds: 19.0, preferredTimescale: 3000)),
            CMTimeRange(start: CMTime(seconds: 38.0, preferredTimescale: 3000),
                duration: CMTime(seconds: 58.0, preferredTimescale: 3000))
        ]

        model.timeRangeOptNilA = nil

        model.timeRangeD = [
            "a": CMTimeRange(start: CMTime(seconds: 10.0, preferredTimescale: 3000),
            duration: CMTime(seconds: 10.0, preferredTimescale: 3000)),
            "b": CMTimeRange(start: CMTime(seconds: 18.0, preferredTimescale: 3000),
                duration: CMTime(seconds: 18.0, preferredTimescale: 3000))
        ]

        model.timeRangeOptD = [
            "a": CMTimeRange(start: CMTime(seconds: 1.0, preferredTimescale: 3000),
            duration: CMTime(seconds: 19.0, preferredTimescale: 3000)),
            "b": CMTimeRange(start: CMTime(seconds: 38.0, preferredTimescale: 3000),
                duration: CMTime(seconds: 58.0, preferredTimescale: 3000))
        ]

        model.timeRangeOptNilD = nil

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = CMTimeRangeModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.timeRange == CMTimeRange(start: CMTime(seconds: 10.0,
                preferredTimescale: 3000), duration: CMTime(seconds: 10.0,
                    preferredTimescale: 3000)))
            XCTAssert(reModel!.timeRangeOpt! == CMTimeRange(start: CMTime(seconds: 20.0,
                preferredTimescale: 3000), duration: CMTime(seconds: 15.0,
                    preferredTimescale: 3000)))
            XCTAssert(reModel!.timeRangeOptNil == nil)

            XCTAssert(reModel!.timeRangeA == [
                CMTimeRange(start: CMTime(seconds: 10.0, preferredTimescale: 3000),
                    duration: CMTime(seconds: 10.0, preferredTimescale: 3000)),
                CMTimeRange(start: CMTime(seconds: 18.0, preferredTimescale: 3000),
                    duration: CMTime(seconds: 18.0, preferredTimescale: 3000))
                ])
            XCTAssert(reModel!.timeRangeOptA! == [
                CMTimeRange(start: CMTime(seconds: 1.0, preferredTimescale: 3000),
                    duration: CMTime(seconds: 19.0, preferredTimescale: 3000)),
                CMTimeRange(start: CMTime(seconds: 38.0, preferredTimescale: 3000),
                    duration: CMTime(seconds: 58.0, preferredTimescale: 3000))
                ])
            XCTAssert(reModel!.timeRangeOptNilA == nil)

            XCTAssert(reModel!.timeRangeD == [
                "a": CMTimeRange(start: CMTime(seconds: 10.0, preferredTimescale: 3000),
                    duration: CMTime(seconds: 10.0, preferredTimescale: 3000)),
                "b": CMTimeRange(start: CMTime(seconds: 18.0, preferredTimescale: 3000),
                    duration: CMTime(seconds: 18.0, preferredTimescale: 3000))
                ])
            XCTAssert(reModel!.timeRangeOptD! == [
                "a": CMTimeRange(start: CMTime(seconds: 1.0, preferredTimescale: 3000),
                    duration: CMTime(seconds: 19.0, preferredTimescale: 3000)),
                "b": CMTimeRange(start: CMTime(seconds: 38.0, preferredTimescale: 3000),
                    duration: CMTime(seconds: 58.0, preferredTimescale: 3000))
                ])
            XCTAssert(reModel!.timeRangeOptNilD == nil)
        }
    }

    func testConstCMTimeRangeEncodingDecoding() {
        let fileName = "/tmp/cmtimerange-const.plist"

        let timeRange = CMTimeRange(start: CMTime(seconds: 10.0, preferredTimescale: 3000),
            duration: CMTime(seconds: 10.0, preferredTimescale: 3000))

        let timeRangeOpt = CMTimeRange(start: CMTime(seconds: 20.0, preferredTimescale: 3000),
            duration: CMTime(seconds: 15.0, preferredTimescale: 3000))

        let timeRangeA = [
            CMTimeRange(start: CMTime(seconds: 10.0, preferredTimescale: 3000),
                duration: CMTime(seconds: 10.0, preferredTimescale: 3000)),
            CMTimeRange(start: CMTime(seconds: 18.0, preferredTimescale: 3000),
                duration: CMTime(seconds: 18.0, preferredTimescale: 3000))
        ]

        let timeRangeOptA = [
            CMTimeRange(start: CMTime(seconds: 1.0, preferredTimescale: 3000),
                duration: CMTime(seconds: 19.0, preferredTimescale: 3000)),
            CMTimeRange(start: CMTime(seconds: 38.0, preferredTimescale: 3000),
                duration: CMTime(seconds: 58.0, preferredTimescale: 3000))
        ]

        let timeRangeD = [
            "a": CMTimeRange(start: CMTime(seconds: 10.0, preferredTimescale: 3000),
                duration: CMTime(seconds: 10.0, preferredTimescale: 3000)),
            "b": CMTimeRange(start: CMTime(seconds: 18.0, preferredTimescale: 3000),
                duration: CMTime(seconds: 18.0, preferredTimescale: 3000))
        ]

        let timeRangeOptD = [
            "a": CMTimeRange(start: CMTime(seconds: 1.0, preferredTimescale: 3000),
                duration: CMTime(seconds: 19.0, preferredTimescale: 3000)),
            "b": CMTimeRange(start: CMTime(seconds: 38.0, preferredTimescale: 3000),
                duration: CMTime(seconds: 58.0, preferredTimescale: 3000))
        ]

        let model = ConstCMTimeRangeModel(timeRange: timeRange,
            timeRangeOpt: timeRangeOpt,
            timeRangeOptNil: nil,
            timeRangeA: timeRangeA,
            timeRangeOptA: timeRangeOptA,
            timeRangeOptNilA: nil,
            timeRangeD: timeRangeD,
            timeRangeOptD: timeRangeOptD,
            timeRangeOptNilD: nil
        )

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = CMTimeRangeModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.timeRange == CMTimeRange(start: CMTime(seconds: 10.0,
                preferredTimescale: 3000), duration: CMTime(seconds: 10.0,
                    preferredTimescale: 3000)))
            XCTAssert(reModel!.timeRangeOpt! == CMTimeRange(start: CMTime(seconds: 20.0,
                preferredTimescale: 3000), duration: CMTime(seconds: 15.0,
                    preferredTimescale: 3000)))
            XCTAssert(reModel!.timeRangeOptNil == nil)

            XCTAssert(reModel!.timeRangeA == [
                CMTimeRange(start: CMTime(seconds: 10.0, preferredTimescale: 3000),
                    duration: CMTime(seconds: 10.0, preferredTimescale: 3000)),
                CMTimeRange(start: CMTime(seconds: 18.0, preferredTimescale: 3000),
                    duration: CMTime(seconds: 18.0, preferredTimescale: 3000))
                ])
            XCTAssert(reModel!.timeRangeOptA! == [
                CMTimeRange(start: CMTime(seconds: 1.0, preferredTimescale: 3000),
                    duration: CMTime(seconds: 19.0, preferredTimescale: 3000)),
                CMTimeRange(start: CMTime(seconds: 38.0, preferredTimescale: 3000),
                    duration: CMTime(seconds: 58.0, preferredTimescale: 3000))
                ])
            XCTAssert(reModel!.timeRangeOptNilA == nil)

            XCTAssert(reModel!.timeRangeD == [
                "a": CMTimeRange(start: CMTime(seconds: 10.0, preferredTimescale: 3000),
                    duration: CMTime(seconds: 10.0, preferredTimescale: 3000)),
                "b": CMTimeRange(start: CMTime(seconds: 18.0, preferredTimescale: 3000),
                    duration: CMTime(seconds: 18.0, preferredTimescale: 3000))
                ])
            XCTAssert(reModel!.timeRangeOptD! == [
                "a": CMTimeRange(start: CMTime(seconds: 1.0, preferredTimescale: 3000),
                    duration: CMTime(seconds: 19.0, preferredTimescale: 3000)),
                "b": CMTimeRange(start: CMTime(seconds: 38.0, preferredTimescale: 3000),
                    duration: CMTime(seconds: 58.0, preferredTimescale: 3000))
                ])
            XCTAssert(reModel!.timeRangeOptNilD == nil)
        }

    }

}
