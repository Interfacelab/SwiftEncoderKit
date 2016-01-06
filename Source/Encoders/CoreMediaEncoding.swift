//
//  CMTimeEncoding.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import CoreMedia

extension CMTime: Encodable {
    init?(_ decoder: Decoder) {
        value = decoder.integer("value")!
        timescale = decoder.integer("timescale")!
        flags = decoder.enumValue("flags")!
        epoch = decoder.integer("epoch")!
    }

    func encode(encoder: Encoder) {
        value --> encoder["value"]
        timescale --> encoder["timescale"]
        flags  --> encoder["flags"]
        epoch --> encoder["epoch"]
    }
}

extension CMTimeRange: Encodable {
    init?(_ decoder: Decoder) {
        start = decoder.encodable("start")!
        duration = decoder.encodable("duration")!
    }

    func encode(encoder: Encoder) {
        start --> encoder["start"]
        duration --> encoder["duration"]
    }
}

extension CMTimeMapping: Encodable {
    init?(_ decoder: Decoder) {
        source = decoder.encodable("source")!
        target = decoder.encodable("target")!
    }

    func encode(encoder: Encoder) {
        source --> encoder["source"]
        target --> encoder["target"]
    }
}