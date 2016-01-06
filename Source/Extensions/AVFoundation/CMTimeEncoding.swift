//
//  CMTimeEncoding.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import AVFoundation

extension CMTime : Encodable {
    init?(_ decoder: Decoder) {
        value = decoder.integer("value")!
        timescale = decoder.integer("timescale")!
        flags = CMTimeFlags.Valid
        epoch = decoder.integer("epoch")!
    }

    func encode(encoder: Encoder) {
        value --> encoder["value"]
        timescale --> encoder["timescale"]
        epoch --> encoder["epoch"]
    }
}

