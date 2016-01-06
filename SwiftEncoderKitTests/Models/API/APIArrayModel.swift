//
//  APIModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/4/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import UIKit

class APIArrayModel : Encodable {
    var intA: [Int] = [0]
    var uintA: [UInt] = [0]
    var floatA: [Float] = [0]
    var doubleA: [Double] = [0]
    var stringA: [String] = ["test"]
    var colorA: [UIColor] = [UIColor.whiteColor()]
    var boolA: [Bool] = [false]

    var intANotEncoded: [Int]?
    var uintANotEncoded: [UInt]?
    var floatANotEncoded: [Float]?
    var doubleANotEncoded: [Double]?
    var stringANotEncoded: [String]?
    var colorANotEncoded: [UIColor]?
    var boolANotEncoded: [Bool]?

    init() {
        
    }

    required init?(_ decoder: Decoder) {
        intA = decoder.integerArray("intA")!
        uintA = decoder.unsignedIntegerArray("uintA")!
        floatA = decoder.floatArray("floatA")!
        doubleA = decoder.doubleArray("doubleA")!
        stringA = decoder.stringArray("stringA")!
        colorA = decoder.nsCodingArray("colorA")!
        boolA = decoder.boolArray("boolA")!

        intANotEncoded = decoder.integerArray("integerArrayNotEncoded")
        uintANotEncoded = decoder.unsignedIntegerArray("unsignedIntegerArrayNotEncoded")
        floatANotEncoded = decoder.floatArray("floatArrayNotEncoded")
        doubleANotEncoded = decoder.doubleArray("doubleArrayNotEncoded")
        stringANotEncoded = decoder.stringArray("stringArrayNotEncoded")
        colorANotEncoded = decoder.nsCodingArray("nsCodingArrayNotEncoded")
        boolANotEncoded = decoder.boolArray("boolArrayNotEncoded")
    }

    func encode(encoder: Encoder) {
        encoder.addIntegerArray(intA, key: "intA")
        encoder.addUnsignedIntegerArray(uintA, key: "uintA")
        encoder.addFloatArray(floatA, key: "floatA")
        encoder.addDoubleArray(doubleA, key: "doubleA")
        encoder.addStringArray(stringA, key: "stringA")
        encoder.addNSCodingArray(colorA, key: "colorA")
        encoder.addBoolArray(boolA, key: "boolA")
    }
}