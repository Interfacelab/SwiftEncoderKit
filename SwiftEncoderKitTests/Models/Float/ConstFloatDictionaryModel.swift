//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//


class ConstFloatDictionaryModel: Encodable {
    let floatD: [String: Float]
    let floatDOpt: [String: Float]?
    let floatDOptNil: [String: Float]?

    let doubleD: [String: Double]
    let doubleDOpt: [String: Double]?
    let doubleDOptNil: [String: Double]?

    init(floatD: [String: Float], floatDOpt: [String: Float]?, floatDOptNil: [String: Float]?,
        doubleD: [String: Double], doubleDOpt: [String: Double]?,
        doubleDOptNil: [String: Double]?) {
            self.floatD = floatD
            self.floatDOpt = floatDOpt
            self.floatDOptNil = floatDOptNil

            self.doubleD = doubleD
            self.doubleDOpt = doubleDOpt
            self.doubleDOptNil = doubleDOptNil
    }

    required init?(_ decoder: Decoder) {
        floatD = decoder.floatDictionary("floatD") ?? [:]
        floatDOpt = decoder.floatDictionary("floatDOpt")
        floatDOptNil = decoder.floatDictionary("floatDOptNil")

        doubleD = decoder.doubleDictionary("doubleD") ?? [:]
        doubleDOpt = decoder.doubleDictionary("doubleDOpt")
        doubleDOptNil = decoder.doubleDictionary("doubleDOptNil")
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
