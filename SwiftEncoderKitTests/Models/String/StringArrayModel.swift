//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//


class StringArrayModel: Encodable {
    var stringA: [String] = ["the", "quick", "brown", "fox"]
    var stringAOpt: [String]?
    var stringAOptNil: [String]? = ["jumped", "over", "the", "fence"]

    init() {

    }

    required init?(_ decoder: Decoder) {
        stringA         <-- decoder["stringA"]
        stringAOpt      <-- decoder["stringAOpt"]
        stringAOptNil   <-- decoder["stringAOptNil"]
    }

    func encode(encoder: Encoder) {
        stringA         --> encoder["stringA"]
        stringAOpt      --> encoder["stringAOpt"]
        stringAOptNil   --> encoder["stringAOptNil"]
    }
}
