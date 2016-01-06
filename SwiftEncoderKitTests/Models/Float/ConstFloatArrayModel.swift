//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//


class ConstFloatArrayModel: Encodable {
    let floatA: [Float]
    let floatAOpt: [Float]?
    let floatAOptNil: [Float]?

    let doubleA: [Double]
    let doubleAOpt: [Double]?
    let doubleAOptNil: [Double]?

    init() {
        floatA = []
        floatAOpt = nil
        floatAOptNil = []

        doubleA = []
        doubleAOpt = nil
        doubleAOptNil = []
    }

    init(floatA: [Float], floatAOpt: [Float]?, floatAOptNil: [Float]?, doubleA: [Double],
        doubleAOpt: [Double]?, doubleAOptNil: [Double]?) {
            self.floatA = floatA
            self.floatAOpt = floatAOpt
            self.floatAOptNil = floatAOptNil

            self.doubleA = doubleA
            self.doubleAOpt = doubleAOpt
            self.doubleAOptNil = doubleAOptNil
    }

    required init?(_ decoder: Decoder) {
        floatA = decoder.floatArray("floatA") ?? []
        floatAOpt = decoder.floatArray("floatAOpt")
        floatAOptNil = decoder.floatArray("floatAOptNil")

        doubleA = decoder.doubleArray("doubleA") ?? []
        doubleAOpt = decoder.doubleArray("doubleAOpt")
        doubleAOptNil = decoder.doubleArray("doubleAOptNil")
    }

    func encode(encoder: Encoder) {
        floatA          --> encoder["floatA"]
        floatAOpt       --> encoder["floatAOpt"]
        floatAOptNil    --> encoder["floatAOptNil"]

        doubleA         --> encoder["doubleA"]
        doubleAOpt      --> encoder["doubleAOpt"]
        doubleAOptNil   --> encoder["doubleAOptNil"]
    }
}
