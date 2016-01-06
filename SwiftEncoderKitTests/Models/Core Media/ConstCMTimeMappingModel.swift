//
//  CMTimeModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

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
        timeMap --> encoder["timeMap"]
        timeMapOpt --> encoder["timeMapOpt"]
        timeMapOptNil --> encoder["timeMapOptNil"]

        timeMapA --> encoder["timeMapA"]
        timeMapOptA --> encoder["timeMapOptA"]
        timeMapOptNilA --> encoder["timeMapOptNilA"]

        timeMapD --> encoder["timeMapD"]
        timeMapOptD --> encoder["timeMapOptD"]
        timeMapOptNilD --> encoder["timeMapOptNilD"]
    }
}