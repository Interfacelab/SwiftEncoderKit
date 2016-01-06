//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//


class FloatDictionaryModel: Encodable {
    var floatD: [String: Float] = ["a": 1.0, "b": 2.0, "c": 3.0]
    var floatDOpt: [String: Float]?
    var floatDOptNil: [String: Float]? = ["a": 1.0, "b": 2.0, "c": 3.0]

    var doubleD: [String: Double] = ["a": 1.0, "b": 2.0, "c": 3.0]
    var doubleDOpt: [String: Double]?
    var doubleDOptNil: [String: Double]? = ["a": 1.0, "b": 2.0, "c": 3.0]

    init() {

    }

    required init?(_ decoder: Decoder) {
        floatD          <-- decoder["floatD"]
        floatDOpt       <-- decoder["floatDOpt"]
        floatDOptNil    <-- decoder["floatDOptNil"]

        doubleD         <-- decoder["doubleD"]
        doubleDOpt      <-- decoder["doubleDOpt"]
        doubleDOptNil   <-- decoder["doubleDOptNil"]
    }

    func encode(encoder: Encoder) {
        floatD          --> encoder["floatD"]
        floatDOpt       --> encoder["floatDOpt"]
        floatDOptNil    --> encoder["floatDOptNil"]

        doubleD         --> encoder["doubleD"]
        doubleDOpt      --> encoder["doubleDOpt"]
        doubleDOptNil   --> encoder["doubleDOptNil"]
    }
}
