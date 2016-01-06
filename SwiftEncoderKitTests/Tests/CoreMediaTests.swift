//
//  CMTimeTests.swift
//  SwiftEncoderKit
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


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

        Encoder(model).writeToFile(fileName)
        let reModel:CMTimeModel? = Decoder(path: fileName).decodedObject()

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

        Encoder(model).writeToFile(fileName)
        let reModel:ConstCMTimeModel? = Decoder(path: fileName).decodedObject()

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

        Encoder(model).writeToFile(fileName)
        let reModel:CMTimeRangeModel? = Decoder(path: fileName).decodedObject()

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

        Encoder(model).writeToFile(fileName)
        let reModel:ConstCMTimeRangeModel? = Decoder(path: fileName).decodedObject()

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

    func testCMTimeMappingEncodingDecoding() {
        let fileName = "/tmp/cmtimemapping.plist"

        let model = CMTimeMappingModel()

        let source = CMTimeRange(start: CMTime(seconds: 12.0, preferredTimescale: 3000),
            duration: CMTime(seconds: 28.0, preferredTimescale: 3000))

        let target = CMTimeRange(start: CMTime(seconds: 12.0, preferredTimescale: 3000),
            duration: CMTime(seconds: 56.0, preferredTimescale: 3000))

        model.timeMap = CMTimeMapping(source: source, target: target)
        model.timeMapOpt = CMTimeMapping(source: target, target: source)
        model.timeMapOptNil = nil

        model.timeMapA = [CMTimeMapping(source: source, target: target),
            CMTimeMapping(source: target, target: source)]
        model.timeMapOptA = [CMTimeMapping(source: target, target: source),
            CMTimeMapping(source: source, target: target)]
        model.timeMapOptNilA = nil

        model.timeMapD = ["a": CMTimeMapping(source: source, target: target),
            "b": CMTimeMapping(source: target, target: source)]
        model.timeMapOptD = ["c": CMTimeMapping(source: target, target: source),
            "d": CMTimeMapping(source: source, target: target)]
        model.timeMapOptNilD = nil

        Encoder(model).writeToFile(fileName)
        let reModel:CMTimeMappingModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.timeMap.source == source)
            XCTAssert(reModel!.timeMap.target == target)
            XCTAssert(reModel!.timeMapOpt!.source == target)
            XCTAssert(reModel!.timeMapOpt!.target == source)
            XCTAssert(reModel!.timeMapOptNil == nil)

            XCTAssert(reModel!.timeMapA[0].source == source)
            XCTAssert(reModel!.timeMapA[0].target == target)
            XCTAssert(reModel!.timeMapA[1].source == target)
            XCTAssert(reModel!.timeMapA[1].target == source)

            XCTAssert(reModel!.timeMapOptA![0].source == target)
            XCTAssert(reModel!.timeMapOptA![0].target == source)
            XCTAssert(reModel!.timeMapOptA![1].source == source)
            XCTAssert(reModel!.timeMapOptA![1].target == target)

            XCTAssert(reModel!.timeMapOptNilA == nil)

            XCTAssert(reModel!.timeMapD["a"]!.source == source)
            XCTAssert(reModel!.timeMapD["a"]!.target == target)
            XCTAssert(reModel!.timeMapD["b"]!.source == target)
            XCTAssert(reModel!.timeMapD["b"]!.target == source)

            XCTAssert(reModel!.timeMapOptD!["c"]!.source == target)
            XCTAssert(reModel!.timeMapOptD!["c"]!.target == source)
            XCTAssert(reModel!.timeMapOptD!["d"]!.source == source)
            XCTAssert(reModel!.timeMapOptD!["d"]!.target == target)

            XCTAssert(reModel!.timeMapOptNilD == nil)
        }
    }

    func testConstCMTimeMappingEncodingDecoding() {
        let fileName = "/tmp/const-cmtimemapping.plist"


        let source = CMTimeRange(start: CMTime(seconds: 12.0, preferredTimescale: 3000),
            duration: CMTime(seconds: 28.0, preferredTimescale: 3000))

        let target = CMTimeRange(start: CMTime(seconds: 12.0, preferredTimescale: 3000),
            duration: CMTime(seconds: 56.0, preferredTimescale: 3000))

        let timeMap = CMTimeMapping(source: source, target: target)
        let timeMapOpt = CMTimeMapping(source: target, target: source)

        let timeMapA = [CMTimeMapping(source: source, target: target),
            CMTimeMapping(source: target, target: source)]
        let timeMapOptA = [CMTimeMapping(source: target, target: source),
            CMTimeMapping(source: source, target: target)]

        let timeMapD = ["a": CMTimeMapping(source: source, target: target),
            "b": CMTimeMapping(source: target, target: source)]
        let timeMapOptD = ["c": CMTimeMapping(source: target, target: source),
            "d": CMTimeMapping(source: source, target: target)]

        let model = ConstCMTimeMappingModel(timeMap: timeMap,
            timeMapOpt: timeMapOpt,
            timeMapOptNil: nil,
            timeMapA: timeMapA,
            timeMapOptA: timeMapOptA,
            timeMapOptNilA: nil,
            timeMapD: timeMapD,
            timeMapOptD: timeMapOptD,
            timeMapOptNilD: nil)

        Encoder(model).writeToFile(fileName)
        let reModel:ConstCMTimeMappingModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.timeMap.source == source)
            XCTAssert(reModel!.timeMap.target == target)
            XCTAssert(reModel!.timeMapOpt!.source == target)
            XCTAssert(reModel!.timeMapOpt!.target == source)
            XCTAssert(reModel!.timeMapOptNil == nil)

            XCTAssert(reModel!.timeMapA[0].source == source)
            XCTAssert(reModel!.timeMapA[0].target == target)
            XCTAssert(reModel!.timeMapA[1].source == target)
            XCTAssert(reModel!.timeMapA[1].target == source)

            XCTAssert(reModel!.timeMapOptA![0].source == target)
            XCTAssert(reModel!.timeMapOptA![0].target == source)
            XCTAssert(reModel!.timeMapOptA![1].source == source)
            XCTAssert(reModel!.timeMapOptA![1].target == target)

            XCTAssert(reModel!.timeMapOptNilA == nil)

            XCTAssert(reModel!.timeMapD["a"]!.source == source)
            XCTAssert(reModel!.timeMapD["a"]!.target == target)
            XCTAssert(reModel!.timeMapD["b"]!.source == target)
            XCTAssert(reModel!.timeMapD["b"]!.target == source)

            XCTAssert(reModel!.timeMapOptD!["c"]!.source == target)
            XCTAssert(reModel!.timeMapOptD!["c"]!.target == source)
            XCTAssert(reModel!.timeMapOptD!["d"]!.source == source)
            XCTAssert(reModel!.timeMapOptD!["d"]!.target == target)
            
            XCTAssert(reModel!.timeMapOptNilD == nil)
        }
    }
}
