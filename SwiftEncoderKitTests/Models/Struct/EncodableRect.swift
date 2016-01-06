//
//  EncodableRect.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/4/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

struct EncodableRect {
    let origin: EncodablePoint
    let size: EncodableSize

    init() {
        origin = EncodablePoint()
        size = EncodableSize()
    }

    init(x: Float, y: Float, width: Float, height: Float) {
        origin = EncodablePoint(x: x, y: y)
        size = EncodableSize(width: width, height: height)
    }

    init(origin: EncodablePoint, size: EncodableSize) {
        self.origin = origin
        self.size = size
    }
}

extension EncodableRect : Encodable {
    init?(_ decoder: Decoder) {
        origin = decoder.encodable("origin") ?? EncodablePoint(x: 0, y: 0)
        size = decoder.encodable("size") ?? EncodableSize(width: 0, height: 0)
    }

    func encode(encoder: Encoder) {
        origin --> encoder["origin"]
        size --> encoder["size"]
    }
}