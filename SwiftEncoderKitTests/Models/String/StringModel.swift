//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//


class StringModel: Encodable {
    var string: String = "Hello"
    var stringOpt: String?
    var stringOptNil: String? = "World"

    init() {

    }

    required init?(_ decoder: Decoder) {
        string          <-- decoder["string"]
        stringOpt       <-- decoder["stringOpt"]
        stringOptNil    <-- decoder["stringOptNil"]
    }

    func encode(encoder: Encoder) {
        string          --> encoder["string"]
        stringOpt       --> encoder["stringOpt"]
        stringOptNil    --> encoder["stringOptNil"]
    }
}
