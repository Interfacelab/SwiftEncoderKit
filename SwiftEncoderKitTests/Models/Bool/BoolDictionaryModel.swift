//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//


class BoolDictionaryModel: Encodable {
    var boolD: [String: Bool] = [:]
    var boolDOpt: [String: Bool]?
    var boolDOptNil: [String: Bool]? = [:]

    init() {
        
    }

    required init?(_ decoder: Decoder) {
        boolD           <-- decoder["boolD"]
        boolDOpt        <-- decoder["boolDOpt"]
        boolDOptNil     <-- decoder["boolDOptNil"]
    }

    func encode(encoder: Encoder) {
        boolD           --> encoder["boolD"]
        boolDOpt        --> encoder["boolDOpt"]
        boolDOptNil     --> encoder["boolDOptNil"]
    }
}
