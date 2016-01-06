//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//


class ConstBoolArrayModel: Encodable {
    let boolA: [Bool]
    let boolAOpt: [Bool]?
    let boolAOptNil: [Bool]?

    init() {
        boolA = []
        boolAOpt = nil
        boolAOptNil = [true, true, true]
    }

    init(boolA: [Bool], boolAOpt: [Bool]?, boolAOptNil: [Bool]?) {
        self.boolA = boolA
        self.boolAOpt = boolAOpt
        self.boolAOptNil = boolAOptNil
    }

    required init?(_ decoder: Decoder) {
        // Because all of our properties are constants and haven't been initialized yet
        // the <-- infix operator won't work here, so we'll use the methods on the
        // decoder to get our values

        boolA = decoder.boolArray("boolA") ?? []
        boolAOpt = decoder.boolArray("boolAOpt")
        boolAOptNil = decoder.boolArray("boolAOptNil")
    }

    func encode(encoder: Encoder) {
        encoder.addBoolArray(boolA, key: "boolA")
        encoder.addBoolArray(boolAOpt, key: "boolAOpt")
        encoder.addBoolArray(boolAOptNil, key: "boolAOptNil")
    }
}
