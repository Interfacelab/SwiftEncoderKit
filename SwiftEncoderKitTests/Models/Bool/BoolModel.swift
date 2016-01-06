//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//


class BoolModel: Encodable {
    var bool: Bool = false
    var boolOpt: Bool?
    var boolOptNil: Bool? = false

    init() {

    }

    required init?(_ decoder: Decoder) {
        bool            <-- decoder["bool"]
        boolOpt         <-- decoder["boolOpt"]
        boolOptNil      <-- decoder["boolOptNil"]
    }

    func encode(encoder: Encoder) {
        bool            --> encoder["bool"]
        boolOpt         --> encoder["boolOpt"]
        boolOptNil      --> encoder["boolOptNil"]
    }
}
