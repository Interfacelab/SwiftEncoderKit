//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//


class ConstBoolDictionaryModel: Encodable {
    let boolD: [String: Bool]
    let boolDOpt: [String: Bool]?
    let boolDOptNil: [String: Bool]?

    init(boolD: [String: Bool], boolDOpt: [String: Bool]?, boolDOptNil: [String: Bool]?) {
        self.boolD = boolD
        self.boolDOpt = boolDOpt
        self.boolDOptNil = boolDOptNil
    }

    required init?(_ decoder: Decoder) {
        boolD = decoder.boolDictionary("boolD") ?? [:]
        boolDOpt = decoder.boolDictionary("boolDOpt")
        boolDOptNil = decoder.boolDictionary("boolDOptNil")
    }

    func encode(encoder: Encoder) {
        encoder.addBoolDictionary(boolD, key: "boolD")
        encoder.addBoolDictionary(boolDOpt, key: "boolDOpt")
        encoder.addBoolDictionary(boolDOptNil, key: "boolDOptNil")
    }
}
