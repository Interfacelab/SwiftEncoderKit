//
//  CMTimeModel.swift
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


import AVFoundation

class ConstCMTimeRangeModel: Encodable {
    let timeRange: CMTimeRange
    let timeRangeOpt: CMTimeRange?
    let timeRangeOptNil: CMTimeRange?

    let timeRangeA: [CMTimeRange]
    let timeRangeOptA: [CMTimeRange]?
    let timeRangeOptNilA: [CMTimeRange]?

    let timeRangeD: [String: CMTimeRange]
    let timeRangeOptD: [String: CMTimeRange]?
    let timeRangeOptNilD: [String: CMTimeRange]?

    init(timeRange: CMTimeRange,
        timeRangeOpt: CMTimeRange?,
        timeRangeOptNil: CMTimeRange?,
        timeRangeA: [CMTimeRange],
        timeRangeOptA: [CMTimeRange]?,
        timeRangeOptNilA: [CMTimeRange]?,
        timeRangeD: [String: CMTimeRange],
        timeRangeOptD: [String: CMTimeRange]?,
        timeRangeOptNilD: [String: CMTimeRange]?) {
            self.timeRange = timeRange
            self.timeRangeOpt = timeRangeOpt
            self.timeRangeOptNil = timeRangeOptNil
            self.timeRangeA = timeRangeA
            self.timeRangeOptA = timeRangeOptA
            self.timeRangeOptNilA = timeRangeOptNilA
            self.timeRangeD = timeRangeD
            self.timeRangeOptD = timeRangeOptD
            self.timeRangeOptNilD = timeRangeOptNilD
    }

    required init?(_ decoder: Decoder) {
        timeRange = decoder.encodable("timeRange")!
        timeRangeOpt = decoder.encodable("timeRangeOpt")
        timeRangeOptNil = decoder.encodable("timeRangeOptNil")

        timeRangeA = decoder.encodableArray("timeRangeA")!
        timeRangeOptA = decoder.encodableArray("timeRangeOptA")
        timeRangeOptNilA = decoder.encodableArray("timeRangeOptNilA")

        timeRangeD = decoder.encodableDictionary("timeRangeD")!
        timeRangeOptD = decoder.encodableDictionary("timeRangeOptD")
        timeRangeOptNilD = decoder.encodableDictionary("timeRangeOptNilD")
    }

    func encode(encoder: Encoder) {
        encoder.addEncodable(timeRange, key: "timeRange")
        encoder.addEncodable(timeRangeOpt, key: "timeRangeOpt")
        encoder.addEncodable(timeRangeOptNil, key: "timeRangeOptNil")

        encoder.addEncodableArray(timeRangeA, key: "timeRangeA")
        encoder.addEncodableArray(timeRangeOptA, key: "timeRangeOptA")
        encoder.addEncodableArray(timeRangeOptNilA, key: "timeRangeOptNilA")

        encoder.addEncodableDictionary(timeRangeD, key: "timeRangeD")
        encoder.addEncodableDictionary(timeRangeOptD, key: "timeRangeOptD")
        encoder.addEncodableDictionary(timeRangeOptNilD, key: "timeRangeOptNilD")
    }
}
