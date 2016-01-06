//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//


class BoolArrayModel: Encodable {
    var boolA: [Bool] = [false, true, false]
    var boolAOpt: [Bool]?
    var boolAOptNil: [Bool]? = [true, false, true]

    init() {

    }

    required init?(_ decoder: Decoder) {
        boolA           <-- decoder["boolA"]
        boolAOpt        <-- decoder["boolAOpt"]
        boolAOptNil     <-- decoder["boolAOptNil"]
    }

    func encode(encoder: Encoder) {
        boolA           --> encoder["boolA"]
        boolAOpt        --> encoder["boolAOpt"]
        boolAOptNil     --> encoder["boolAOptNil"]
    }
}
