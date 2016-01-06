//
//  CMTimeModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import AVFoundation

class CMTimeMappingModel: Encodable {
    var timeMap: CMTimeMapping = kCMTimeMappingInvalid
    var timeMapOpt: CMTimeMapping?
    var timeMapOptNil: CMTimeMapping? = kCMTimeMappingInvalid

    var timeMapA: [CMTimeMapping] = []
    var timeMapOptA: [CMTimeMapping]?
    var timeMapOptNilA: [CMTimeMapping]? = []

    var timeMapD: [String: CMTimeMapping] = [:]
    var timeMapOptD: [String: CMTimeMapping]?
    var timeMapOptNilD: [String: CMTimeMapping]?

    init() {

    }

    required init?(_ decoder: Decoder) {
        timeMap <-- decoder["timeMap"]
        timeMapOpt <-- decoder["timeMapOpt"]
        timeMapOptNil <-- decoder["timeMapOptNil"]

        timeMapA <-- decoder["timeMapA"]
        timeMapOptA <-- decoder["timeMapOptA"]
        timeMapOptNilA <-- decoder["timeMapOptNilA"]

        timeMapD <-- decoder["timeMapD"]
        timeMapOptD <-- decoder["timeMapOptD"]
        timeMapOptNilD <-- decoder["timeMapOptNilD"]
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
