//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//


class ConstFloatModel: Encodable {
    let float: Float
    let floatOpt: Float?
    let floatOptNil: Float?

    let double: Double
    let doubleOpt: Double?
    let doubleOptNil: Double?

    init() {
        float = 1
        floatOpt = nil
        floatOptNil = 2

        double = 2
        doubleOpt = nil
        doubleOptNil = 3
    }

    init(float: Float, floatOpt: Float?, floatOptNil: Float?, double: Double, doubleOpt: Double?,
        doubleOptNil: Double?) {
            self.float = float
            self.floatOpt = floatOpt
            self.floatOptNil = floatOptNil

            self.double = double
            self.doubleOpt = doubleOpt
            self.doubleOptNil = doubleOptNil
    }

    required init?(_ decoder: Decoder) {
        // Because all of our properties are constants and haven't been initialized yet
        // the <-- infix operator won't work here, so we'll use the methods on the
        // decoder to get our values

        float = decoder.float("float") ?? 0
        floatOpt = decoder.float("floatOpt")
        floatOptNil = decoder.float("floatOptNil")

        double = decoder.double("double") ?? 0
        doubleOpt = decoder.double("doubleOpt")
        doubleOptNil = decoder.double("doubleOptNil")
    }

    func encode(encoder: Encoder) {
        float           --> encoder["float"]
        floatOpt        --> encoder["floatOpt"]
        floatOptNil     --> encoder["floatOptNil"]

        double          --> encoder["double"]
        doubleOpt       --> encoder["doubleOpt"]
        doubleOptNil    --> encoder["doubleOptNil"]
    }
}
