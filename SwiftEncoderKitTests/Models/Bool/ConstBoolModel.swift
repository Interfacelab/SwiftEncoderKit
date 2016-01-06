//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//


class ConstBoolModel: Encodable {
    let bool: Bool
    let boolOpt: Bool?
    let boolOptNil: Bool?

    init() {
        bool = false
        boolOpt = nil
        boolOptNil = false
    }

    init(bool: Bool, boolOpt: Bool?, boolOptNil: Bool?) {
        self.bool = bool
        self.boolOpt = boolOpt
        self.boolOptNil = boolOptNil
    }

    required init?(_ decoder: Decoder) {
        // Because all of our properties are constants and haven't been initialized yet
        // the <-- infix operator won't work here, so we'll use the methods on the
        // decoder to get our values

        bool = decoder.bool("bool") ?? false
        boolOpt = decoder.bool("boolOpt")
        boolOptNil = decoder.bool("boolOptNil")
    }

    func encode(encoder: Encoder) {
        bool            --> encoder["bool"]
        boolOpt         --> encoder["boolOpt"]
        boolOptNil      --> encoder["boolOptNil"]
    }
}
