//
//  EncodableSize.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/4/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

struct EncodableSize {
    var width: Float = 0
    var height: Float = 0

    init() {

    }

    init(width: Float, height: Float) {
        self.width = width
        self.height = height
    }
}

extension EncodableSize: Encodable {
    init?(_ decoder: Decoder) {
        width <-- decoder["width"]
        height <-- decoder["height"]
    }

    func encode(encoder: Encoder) {
        width --> encoder["width"]
        height --> encoder["height"]
    }
}