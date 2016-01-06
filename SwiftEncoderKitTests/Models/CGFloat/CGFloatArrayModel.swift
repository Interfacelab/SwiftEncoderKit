//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//

import QuartzCore

class CGFloatArrayModel: Encodable {
    var floatA: [CGFloat] = [1.0, 2.0, 3.0]
    var floatAOpt: [CGFloat]?
    var floatAOptNil: [CGFloat]? = [1.0, 2.0, 3.0]

    init() {

    }

    required init?(_ decoder: Decoder) {
        floatA          <-- decoder["floatA"]
        floatAOpt       <-- decoder["floatAOpt"]
        floatAOptNil    <-- decoder["floatAOptNil"]
    }

    func encode(encoder: Encoder) {
        floatA          --> encoder["floatA"]
        floatAOpt       --> encoder["floatAOpt"]
        floatAOptNil    --> encoder["floatAOptNil"]
    }
}
