//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//


import QuartzCore

class ConstCGFloatArrayModel: Encodable {
    let floatA: [CGFloat]
    let floatAOpt: [CGFloat]?
    let floatAOptNil: [CGFloat]?

    init() {
        floatA = []
        floatAOpt = nil
        floatAOptNil = []
    }

    init(floatA: [CGFloat], floatAOpt: [CGFloat]?, floatAOptNil: [CGFloat]?) {
            self.floatA = floatA
            self.floatAOpt = floatAOpt
            self.floatAOptNil = floatAOptNil
    }

    required init?(_ decoder: Decoder) {
        // Because all of our properties are constants and haven't been initialized yet
        // the <-- infix operator won't work here, so we'll use the methods on the
        // decoder to get our values

        floatA = decoder.cgFloatArray("floatA") ?? []
        floatAOpt = decoder.cgFloatArray("floatAOpt")
        floatAOptNil = decoder.cgFloatArray("floatAOptNil")
    }

    func encode(encoder: Encoder) {
        encoder.addCGFloatArray(floatA, key: "floatA")
        encoder.addCGFloatArray(floatAOpt, key: "floatAOpt")
        encoder.addCGFloatArray(floatAOptNil, key: "floatAOptNil")
    }
}
