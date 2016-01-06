//
//  CMTimeModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

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
