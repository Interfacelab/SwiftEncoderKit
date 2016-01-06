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

class CMTimeRangeModel: Encodable {
    var timeRange: CMTimeRange = kCMTimeRangeZero
    var timeRangeOpt: CMTimeRange?
    var timeRangeOptNil: CMTimeRange? = kCMTimeRangeZero

    var timeRangeA: [CMTimeRange] = []
    var timeRangeOptA: [CMTimeRange]?
    var timeRangeOptNilA: [CMTimeRange]? = []

    var timeRangeD: [String: CMTimeRange] = [:]
    var timeRangeOptD: [String: CMTimeRange]?
    var timeRangeOptNilD: [String: CMTimeRange]?

    init() {

    }

    required init?(_ decoder: Decoder) {
        timeRange <-- decoder["timeRange"]
        timeRangeOpt <-- decoder["timeRangeOpt"]
        timeRangeOptNil <-- decoder["timeRangeOptNil"]

        timeRangeA <-- decoder["timeRangeA"]
        timeRangeOptA <-- decoder["timeRangeOptA"]
        timeRangeOptNilA <-- decoder["timeRangeOptNilA"]

        timeRangeD <-- decoder["timeRangeD"]
        timeRangeOptD <-- decoder["timeRangeOptD"]
        timeRangeOptNilD <-- decoder["timeRangeOptNilD"]
    }

    func encode(encoder: Encoder) {
        timeRange --> encoder["timeRange"]
        timeRangeOpt --> encoder["timeRangeOpt"]
        timeRangeOptNil --> encoder["timeRangeOptNil"]

        timeRangeA --> encoder["timeRangeA"]
        timeRangeOptA --> encoder["timeRangeOptA"]
        timeRangeOptNilA --> encoder["timeRangeOptNilA"]

        timeRangeD --> encoder["timeRangeD"]
        timeRangeOptD --> encoder["timeRangeOptD"]
        timeRangeOptNilD --> encoder["timeRangeOptNilD"]
    }
}
