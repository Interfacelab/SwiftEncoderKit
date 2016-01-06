//
//  CMTimeModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

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
