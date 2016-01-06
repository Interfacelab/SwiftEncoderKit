//
//  CMTimeModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

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
