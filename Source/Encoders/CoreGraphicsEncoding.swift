//
//  CoreGraphicsEncoding.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import CoreGraphics

extension CGPoint: Encodable {
    init?(_ decoder: Decoder) {
        x = decoder.cgFloat("x")!
        y = decoder.cgFloat("y")!
    }

    func encode(encoder: Encoder) {
        x --> encoder["x"]
        y --> encoder["y"]
    }
}

extension CGSize: Encodable {
    init?(_ decoder: Decoder) {
        width = decoder.cgFloat("width")!
        height = decoder.cgFloat("height")!
    }

    func encode(encoder: Encoder) {
        width --> encoder["width"]
        height --> encoder["height"]
    }
}

extension CGVector: Encodable {
    init?(_ decoder: Decoder) {
        dx = decoder.cgFloat("dx")!
        dy = decoder.cgFloat("dy")!
    }

    func encode(encoder: Encoder) {
        dx --> encoder["dx"]
        dy --> encoder["dy"]
    }
}

extension CGRect: Encodable {
    init?(_ decoder: Decoder) {
        origin = decoder.encodable("origin")!
        size = decoder.encodable("size")!
    }

    func encode(encoder: Encoder) {
        origin --> encoder["origin"]
        size --> encoder["size"]
    }
}

extension CGAffineTransform: Encodable {
    init?(_ decoder: Decoder) {
        a = decoder.cgFloat("a")!
        b = decoder.cgFloat("b")!
        c = decoder.cgFloat("c")!
        d = decoder.cgFloat("d")!
        tx = decoder.cgFloat("tx")!
        ty = decoder.cgFloat("tx")!
    }

    func encode(encoder: Encoder) {
        a --> encoder["a"]
        b --> encoder["b"]
        c --> encoder["c"]
        d  --> encoder["d"]
        tx --> encoder["tx"]
        ty --> encoder["ty"]
    }
}

