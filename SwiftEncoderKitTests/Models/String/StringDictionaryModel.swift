//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//


class StringDictionaryModel: Encodable {
    var stringD: [String: String] = [:]
    var stringDOpt: [String: String]?
    var stringDOptNil: [String: String]? = [:]

    init() {

    }

    required init?(_ decoder: Decoder) {
        stringD         <-- decoder["stringD"]
        stringDOpt      <-- decoder["stringDOpt"]
        stringDOptNil   <-- decoder["stringDOptNil"]
    }

    func encode(encoder: Encoder) {
        stringD         --> encoder["stringD"]
        stringDOpt      --> encoder["stringDOpt"]
        stringDOptNil   --> encoder["stringDOptNil"]
    }
}
