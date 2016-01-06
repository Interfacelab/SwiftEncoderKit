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

class CMTimeModel: Encodable {
    var time: CMTime = kCMTimeZero
    var timeOpt: CMTime?
    var timeOptNil: CMTime? = kCMTimeZero

    var timeA: [CMTime] = []
    var timeOptA: [CMTime]?
    var timeOptNilA: [CMTime]? = []

    var timeD: [String: CMTime] = [:]
    var timeOptD: [String: CMTime]?
    var timeOptNilD: [String: CMTime]?

    init() {
        
    }

    required init?(_ decoder: Decoder) {
        time <-- decoder["time"]
        timeOpt <-- decoder["timeOpt"]
        timeOptNil <-- decoder["timeOptNil"]

        timeA <-- decoder["timeA"]
        timeOptA <-- decoder["timeOptA"]
        timeOptNilA <-- decoder["timeOptNilA"]

        timeD <-- decoder["timeD"]
        timeOptD <-- decoder["timeOptD"]
        timeOptNilD <-- decoder["timeOptNilD"]
    }

    func encode(encoder: Encoder) {
        time --> encoder["time"]
        timeOpt --> encoder["timeOpt"]
        timeOptNil --> encoder["timeOptNil"]

        timeA --> encoder["timeA"]
        timeOptA --> encoder["timeOptA"]
        timeOptNilA --> encoder["timeOptNilA"]

        timeD --> encoder["timeD"]
        timeOptD --> encoder["timeOptD"]
        timeOptNilD --> encoder["timeOptNilD"]
    }
}
