//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//


import QuartzCore

class ConstCGFloatDictionaryModel: Encodable {
    let floatD: [String: CGFloat]
    let floatDOpt: [String: CGFloat]?
    let floatDOptNil: [String: CGFloat]?

    init(floatD: [String: CGFloat], floatDOpt: [String: CGFloat]?,
        floatDOptNil: [String: CGFloat]?) {
            self.floatD = floatD
            self.floatDOpt = floatDOpt
            self.floatDOptNil = floatDOptNil
    }

    required init?(_ decoder: Decoder) {
        floatD = decoder.cgFloatDictionary("floatD") ?? [:]
        floatDOpt = decoder.cgFloatDictionary("floatDOpt")
        floatDOptNil = decoder.cgFloatDictionary("floatDOptNil")
    }

    func encode(encoder: Encoder) {
        encoder.addCGFloatDictionary(floatD, key: "floatD")
        encoder.addCGFloatDictionary(floatDOpt, key: "floatDOpt")
        encoder.addCGFloatDictionary(floatDOptNil, key: "floatDOptNil")
    }
}
