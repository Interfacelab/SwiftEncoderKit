//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//


class ConstStringArrayModel: Encodable {
    let stringA: [String]
    let stringAOpt: [String]?
    let stringAOptNil: [String]?

    init() {
        stringA = ["Yes"]
        stringAOpt = nil
        stringAOptNil = ["There"]
    }

    init(stringA: [String], stringAOpt: [String]?, stringAOptNil: [String]?) {
        self.stringA = stringA
        self.stringAOpt = stringAOpt
        self.stringAOptNil = stringAOptNil
    }

    required init?(_ decoder: Decoder) {
        stringA = decoder.stringArray("stringA") ?? []
        stringAOpt = decoder.stringArray("stringAOpt")
        stringAOptNil = decoder.stringArray("stringAOptNil")
    }

    func encode(encoder: Encoder) {
        stringA         --> encoder["stringA"]
        stringAOpt      --> encoder["stringAOpt"]
        stringAOptNil   --> encoder["stringAOptNil"]
    }
}
