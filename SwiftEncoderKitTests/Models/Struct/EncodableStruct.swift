//
//  EncodableStruct.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

struct EncodablePoint: Encodable {
    let x: Float
    let y: Float

    init(x: Float, y: Float) {
        self.x = x
        self.y = y
    }

    init?(_ decoder: Decoder) {
        x = decoder.getFloatNamed("x") ?? 0
        y = decoder.getFloatNamed("y") ?? 0
    }

    func encode(encoder: Encoder) {
        x --> encoder["x"]
        y --> encoder["y"]
    }
}

struct EncodableSize: Encodable {
    let width: Float
    let height: Float

    init(width: Float, height: Float) {
        self.width = width
        self.height = height
    }

    init?(_ decoder: Decoder) {
        width = decoder.getFloatNamed("width") ?? 0
        height = decoder.getFloatNamed("height") ?? 0
    }

    func encode(encoder: Encoder) {
        width --> encoder["width"]
        height --> encoder["height"]
    }
}

struct EncodableRect: Encodable {
    let origin: EncodablePoint
    let size: EncodableSize

    init(x: Float, y: Float, width: Float, height: Float) {
        origin = EncodablePoint(x: x, y: y)
        size = EncodableSize(width: width, height: height)
    }

    init(origin: EncodablePoint, size: EncodableSize) {
        self.origin = origin
        self.size = size
    }

    init?(_ decoder: Decoder) {
        origin = decoder.getEncodableNamed("origin") ?? EncodablePoint(x: 10, y: 10)
        size = decoder.getEncodableNamed("size") ?? EncodableSize(width: 100, height: 100)
    }

    func encode(encoder: Encoder) {
        origin --> encoder["origin"]
        size --> encoder["size"]
    }
}