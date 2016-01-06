//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//

import QuartzCore

class CGFloatDictionaryModel: Encodable {
    var floatD: [String: CGFloat] = ["a": 1.0, "b": 2.0, "c": 3.0]
    var floatDOpt: [String: CGFloat]?
    var floatDOptNil: [String: CGFloat]? = ["a": 1.0, "b": 2.0, "c": 3.0]

    init() {

    }

    required init?(_ decoder: Decoder) {
        floatD          <-- decoder["floatD"]
        floatDOpt       <-- decoder["floatDOpt"]
        floatDOptNil    <-- decoder["floatDOptNil"]
    }

    func encode(encoder: Encoder) {
        floatD          --> encoder["floatD"]
        floatDOpt       --> encoder["floatDOpt"]
        floatDOptNil    --> encoder["floatDOptNil"]
    }
}
