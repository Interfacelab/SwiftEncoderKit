//
//  EncodablePoint.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/4/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

struct EncodablePoint {
    var x: Float = 0
    var y: Float = 0

    init() {

    }

    init(x: Float, y: Float) {
        self.x = x
        self.y = y
    }
}

extension EncodablePoint : Encodable {
    init?(_ decoder: Decoder) {
        x <-- decoder["x"]
        y <-- decoder["y"]
    }

    func encode(encoder: Encoder) {
        x --> encoder["x"]
        y --> encoder["y"]
    }
}