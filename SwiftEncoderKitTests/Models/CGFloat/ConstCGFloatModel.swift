//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//


import QuartzCore

class ConstCGFloatModel: Encodable {
    let float: CGFloat
    let floatOpt: CGFloat?
    let floatOptNil: CGFloat?

    init() {
        float = 1
        floatOpt = nil
        floatOptNil = 2
    }

    init(float: CGFloat, floatOpt: CGFloat?, floatOptNil: CGFloat?) {
            self.float = float
            self.floatOpt = floatOpt
            self.floatOptNil = floatOptNil
    }

    required init?(_ decoder: Decoder) {
        // Because all of our properties are constants and haven't been initialized yet
        // the <-- infix operator won't work here, so we'll use the methods on the
        // decoder to get our values

        float = decoder.cgFloat("float") ?? 0
        floatOpt = decoder.cgFloat("floatOpt")
        floatOptNil = decoder.cgFloat("floatOptNil")
    }

    func encode(encoder: Encoder) {
        encoder.addCGFloat(float, key: "float")
        encoder.addCGFloat(floatOpt, key: "floatOpt")
        encoder.addCGFloat(floatOptNil, key: "floatOptNil")
    }
}
