//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//


class ConstStringModel: Encodable {
    let string: String
    let stringOpt: String?
    let stringOptNil: String?

    init(string: String, stringOpt: String?, stringOptNil: String?) {
        self.string = string
        self.stringOpt = stringOpt
        self.stringOptNil = stringOptNil
    }

    required init?(_ decoder: Decoder) {
        // Because all of our properties are constants and haven't been initialized yet
        // the <-- infix operator won't work here, so we'll use the methods on the
        // decoder to get our values
        
        string = decoder.string("string") ?? ""
        stringOpt = decoder.string("stringOpt")
        stringOptNil = decoder.string("stringOptNil")
    }

    func encode(encoder: Encoder) {
        encoder.addString(string, key: "string")
        encoder.addString(stringOpt, key: "stringOpt")
        encoder.addString(stringOptNil, key: "stringOptNil")
    }
}
