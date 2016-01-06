//
//  CGAffineTransformModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import QuartzCore

class CGAffineTransformModel: Encodable {
    var transform: CGAffineTransform = CGAffineTransformIdentity
    var transformOpt: CGAffineTransform?
    var transformOptNil: CGAffineTransform? = CGAffineTransformIdentity

    var transformA: [CGAffineTransform] = []
    var transformOptA: [CGAffineTransform]?
    var transformOptNilA: [CGAffineTransform]? = []

    var transformD: [String: CGAffineTransform] = [:]
    var transformOptD: [String: CGAffineTransform]?
    var transformOptNilD: [String: CGAffineTransform]? = [:]

    init() {

    }

    required init?(_ decoder: Decoder) {
        transform <-- decoder["transform"]
        transformOpt <-- decoder["transformOpt"]
        transformOptNil <-- decoder["transformOptNil"]
        transformA <-- decoder["transformA"]
        transformOptA <-- decoder["transformOptA"]
        transformOptNilA <-- decoder["transformOptNilA"]
        transformD <-- decoder["transformD"]
        transformOptD <-- decoder["transformOptD"]
        transformOptNilD <-- decoder["transformOptNilD"]
    }

    func encode(encoder: Encoder) {
        transform --> encoder["transform"]
        transformOpt --> encoder["transformOpt"]
        transformOptNil --> encoder["transformOptNil"]
        transformA --> encoder["transformA"]
        transformOptA --> encoder["transformOptA"]
        transformOptNilA --> encoder["transformOptNilA"]
        transformD --> encoder["transformD"]
        transformOptD --> encoder["transformOptD"]
        transformOptNilD --> encoder["transformOptNilD"]
    }
    
}