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

    init() {
        string = "Crazy"
        stringOpt = nil
        stringOptNil = "Stuff"
    }

    init(string: String, stringOpt: String?, stringOptNil: String?) {
        self.string = string
        self.stringOpt = stringOpt
        self.stringOptNil = stringOptNil
    }

    required init?(_ decoder: Decoder) {
        string = decoder.string("string") ?? ""
        stringOpt = decoder.string("stringOpt")
        stringOptNil = decoder.string("stringOptNil")
    }

    func encode(encoder: Encoder) {
        string          --> encoder["string"]
        stringOpt       --> encoder["stringOpt"]
        stringOptNil    --> encoder["stringOptNil"]
    }
}
