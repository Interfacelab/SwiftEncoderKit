//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//

import QuartzCore

class CGFloatModel: Encodable {
    var float: CGFloat = 1
    var floatOpt: CGFloat?
    var floatOptNil: CGFloat? = 2

    init() {

    }

    required init?(_ decoder: Decoder) {
        float           <-- decoder["float"]
        floatOpt        <-- decoder["floatOpt"]
        floatOptNil     <-- decoder["floatOptNil"]
    }

    func encode(encoder: Encoder) {
        float           --> encoder["float"]
        floatOpt        --> encoder["floatOpt"]
        floatOptNil     --> encoder["floatOptNil"]
    }
}
