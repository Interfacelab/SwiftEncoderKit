//
//  CMTimeModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

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
