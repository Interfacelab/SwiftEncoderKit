//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//


class FloatArrayModel: Encodable {
    var floatA: [Float] = [1.0, 2.0, 3.0]
    var floatAOpt: [Float]?
    var floatAOptNil: [Float]? = [1.0, 2.0, 3.0]

    var doubleA: [Double] = [1.0, 2.0, 3.0]
    var doubleAOpt: [Double]?
    var doubleAOptNil: [Double]? = [1.0, 2.0, 3.0]

    init() {

    }

    required init?(_ decoder: Decoder) {
        floatA          <-- decoder["floatA"]
        floatAOpt       <-- decoder["floatAOpt"]
        floatAOptNil    <-- decoder["floatAOptNil"]

        doubleA         <-- decoder["doubleA"]
        doubleAOpt      <-- decoder["doubleAOpt"]
        doubleAOptNil   <-- decoder["doubleAOptNil"]
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
