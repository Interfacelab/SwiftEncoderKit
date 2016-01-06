//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//


class ConstStringDictionaryModel: Encodable {
    let stringD: [String: String]
    let stringDOpt: [String: String]?
    let stringDOptNil: [String: String]?

    init(stringD: [String: String], stringDOpt: [String: String]?,
        stringDOptNil: [String: String]?) {
            self.stringD = stringD
            self.stringDOpt = stringDOpt
            self.stringDOptNil = stringDOptNil
    }

    required init?(_ decoder: Decoder) {
        stringD = decoder.stringDictionary("stringD") ?? [:]
        stringDOpt = decoder.stringDictionary("stringDOpt")
        stringDOptNil = decoder.stringDictionary("stringDOptNil")
    }

    func encode(encoder: Encoder) {
        stringD         --> encoder["stringD"]
        stringDOpt      --> encoder["stringDOpt"]
        stringDOptNil   --> encoder["stringDOptNil"]
    }
}
