//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//


class FloatModel: Encodable {
    var float: Float = 1
    var floatOpt: Float?
    var floatOptNil: Float? = 2

    var double: Double = 1
    var doubleOpt: Double?
    var doubleOptNil: Double? = 2

    init() {

    }

    required init?(_ decoder: Decoder) {
        float           <-- decoder["float"]
        floatOpt        <-- decoder["floatOpt"]
        floatOptNil     <-- decoder["floatOptNil"]

        double          <-- decoder["double"]
        doubleOpt       <-- decoder["doubleOpt"]
        doubleOptNil    <-- decoder["doubleOptNil"]
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
