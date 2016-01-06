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
        boolA = decoder.boolArray("boolA") ?? []
        boolAOpt = decoder.boolArray("boolAOpt")
        boolAOptNil = decoder.boolArray("boolAOptNil")
    }

    func encode(encoder: Encoder) {
        boolA           --> encoder["boolA"]
        boolAOpt        --> encoder["boolAOpt"]
        boolAOptNil     --> encoder["boolAOptNil"]
    }
}
