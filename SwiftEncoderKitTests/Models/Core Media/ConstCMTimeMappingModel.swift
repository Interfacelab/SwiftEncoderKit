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

class ConstCMTimeMappingModel: Encodable {
    let timeMap: CMTimeMapping
    let timeMapOpt: CMTimeMapping?
    let timeMapOptNil: CMTimeMapping?

    let timeMapA: [CMTimeMapping]
    let timeMapOptA: [CMTimeMapping]?
    let timeMapOptNilA: [CMTimeMapping]?

    let timeMapD: [String: CMTimeMapping]
    let timeMapOptD: [String: CMTimeMapping]?
    let timeMapOptNilD: [String: CMTimeMapping]?

    init(timeMap: CMTimeMapping,
        timeMapOpt: CMTimeMapping?,
        timeMapOptNil: CMTimeMapping?,
        timeMapA: [CMTimeMapping],
        timeMapOptA: [CMTimeMapping]?,
        timeMapOptNilA: [CMTimeMapping]?,
        timeMapD: [String: CMTimeMapping],
        timeMapOptD: [String: CMTimeMapping]?,
        timeMapOptNilD: [String: CMTimeMapping]?) {
            self.timeMap = timeMap
            self.timeMapOpt = timeMapOpt
            self.timeMapOptNil = timeMapOptNil
            self.timeMapA = timeMapA
            self.timeMapOptA = timeMapOptA
            self.timeMapOptNilA = timeMapOptNilA
            self.timeMapD = timeMapD
            self.timeMapOptD = timeMapOptD
            self.timeMapOptNilD = timeMapOptNilD
    }

    required init?(_ decoder: Decoder) {
        timeMap = decoder.encodable("timeMap")!
        timeMapOpt = decoder.encodable("timeMapOpt")
        timeMapOptNil = decoder.encodable("timeMapOptNil")
        
        timeMapA = decoder.encodableArray("timeMapA")!
        timeMapOptA = decoder.encodableArray("timeMapOptA")
        timeMapOptNilA = decoder.encodableArray("timeMapOptNilA")

        timeMapD = decoder.encodableDictionary("timeMapD")!
        timeMapOptD = decoder.encodableDictionary("timeMapOptD")
        timeMapOptNilD = decoder.encodableDictionary("timeMapOptNilD")
    }

    func encode(encoder: Encoder) {
        encoder.addEncodable(timeMap, key: "timeMap")
        encoder.addEncodable(timeMapOpt, key: "timeMapOpt")
        encoder.addEncodable(timeMapOptNil, key: "timeMapOptNil")

        encoder.addEncodableArray(timeMapA, key: "timeMapA")
        encoder.addEncodableArray(timeMapOptA, key: "timeMapOptA")
        encoder.addEncodableArray(timeMapOptNilA, key: "timeMapOptNilA")

        encoder.addEncodableDictionary(timeMapD, key: "timeMapD")
        encoder.addEncodableDictionary(timeMapOptD, key: "timeMapOptD")
        encoder.addEncodableDictionary(timeMapOptNilD, key: "timeMapOptNilD")
    }
}
