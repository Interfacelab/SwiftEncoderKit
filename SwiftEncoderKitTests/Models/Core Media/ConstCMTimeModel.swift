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

class ConstCMTimeModel: Encodable {
    let time: CMTime
    let timeOpt: CMTime?
    let timeOptNil: CMTime?

    let timeA: [CMTime]
    let timeOptA: [CMTime]?
    let timeOptNilA: [CMTime]?

    let timeD: [String: CMTime]
    let timeOptD: [String: CMTime]?
    let timeOptNilD: [String: CMTime]?

    init(time: CMTime,
        timeOpt: CMTime?,
        timeOptNil: CMTime?,
        timeA: [CMTime],
        timeOptA: [CMTime]?,
        timeOptNilA: [CMTime]?,
        timeD: [String: CMTime],
        timeOptD: [String: CMTime]?,
        timeOptNilD: [String: CMTime]?) {
            self.time = time
            self.timeOpt = timeOpt
            self.timeOptNil = timeOptNil
            self.timeA = timeA
            self.timeOptA = timeOptA
            self.timeOptNilA = timeOptNilA
            self.timeD = timeD
            self.timeOptD = timeOptD
            self.timeOptNilD = timeOptNilD
    }

    required init?(_ decoder: Decoder) {
        time = decoder.encodable("time")!
        timeOpt = decoder.encodable("timeOpt")
        timeOptNil = decoder.encodable("timeOptNil")

        timeA = decoder.encodableArray("timeA")!
        timeOptA = decoder.encodableArray("timeOptA")
        timeOptNilA = decoder.encodableArray("timeOptNilA")

        timeD = decoder.encodableDictionary("timeD")!
        timeOptD = decoder.encodableDictionary("timeOptD")
        timeOptNilD = decoder.encodableDictionary("timeOptNilD")
    }

    func encode(encoder: Encoder) {
        encoder.addEncodable(time, key: "time")
        encoder.addEncodable(timeOpt, key: "timeOpt")
        encoder.addEncodable(timeOptNil, key: "timeOptNil")

        encoder.addEncodableArray(timeA, key: "timeA")
        encoder.addEncodableArray(timeOptA, key: "timeOptA")
        encoder.addEncodableArray(timeOptNilA, key: "timeOptNilA")

        encoder.addEncodableDictionary(timeD, key: "timeD")
        encoder.addEncodableDictionary(timeOptD, key: "timeOptD")
        encoder.addEncodableDictionary(timeOptNilD, key: "timeOptNilD")
    }
}
