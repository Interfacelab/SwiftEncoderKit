//
//  CGAffineTransformModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import QuartzCore

class ConstCGAffineTransformModel: Encodable {
    let transform: CGAffineTransform
    let transformOpt: CGAffineTransform?
    let transformOptNil: CGAffineTransform?

    let transformA: [CGAffineTransform]
    let transformOptA: [CGAffineTransform]?
    let transformOptNilA: [CGAffineTransform]?

    let transformD: [String: CGAffineTransform]
    let transformOptD: [String: CGAffineTransform]?
    let transformOptNilD: [String: CGAffineTransform]?

    init(transform: CGAffineTransform,
        transformOpt: CGAffineTransform?,
        transformOptNil: CGAffineTransform?,
        transformA: [CGAffineTransform],
        transformOptA: [CGAffineTransform]?,
        transformOptNilA: [CGAffineTransform]?,
        transformD: [String: CGAffineTransform],
        transformOptD: [String: CGAffineTransform]?,
        transformOptNilD: [String: CGAffineTransform]?) {
            self.transform = transform
            self.transformOpt = transformOpt
            self.transformOptNil = transformOptNil
            self.transformA = transformA
            self.transformOptA = transformOptA
            self.transformOptNilA = transformOptNilA
            self.transformD = transformD
            self.transformOptD = transformOptD
            self.transformOptNilD = transformOptNilD
    }

    required init?(_ decoder: Decoder) {
        transform = decoder.encodable("transform")!
        transformOpt = decoder.encodable("transformOpt")
        transformOptNil = decoder.encodable("transformOptNil")

        transformA = decoder.encodableArray("transformA")!
        transformOptA = decoder.encodableArray("transformOptA")
        transformOptNilA = decoder.encodableArray("transformOptNilA")

        transformD = decoder.encodableDictionary("transformD")!
        transformOptD = decoder.encodableDictionary("transformOptD")
        transformOptNilD = decoder.encodableDictionary("transformOptNilD")
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