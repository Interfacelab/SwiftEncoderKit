//
//  APIModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/4/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import UIKit

class APIModel : Encodable {
    var int: Int = 0
    var uint: UInt = 0
    var float: Float = 0
    var double: Double = 0
    var string: String = "test"
    var color: UIColor = UIColor.whiteColor()
    var bool: Bool = false

    var intNotEncoded: Int?
    var uintNotEncoded: UInt?
    var floatNotEncoded: Float?
    var doubleNotEncoded: Double?
    var stringNotEncoded: String?
    var colorNotEncoded: UIColor?
    var boolNotEncoded: Bool?

    init() {
        
    }

    required init?(_ decoder: Decoder) {
        int = decoder.integer("int")!
        uint = decoder.unsignedInteger("uint")!
        float = decoder.float("float")!
        double = decoder.double("double")!
        string = decoder.string("string")!
        color = decoder.nsCoding("color")!
        bool = decoder.bool("bool")!

        intNotEncoded = decoder.integer("intNotEncoded")
        uintNotEncoded = decoder.unsignedInteger("uintNotEncoded")
        floatNotEncoded = decoder.float("floatNotEncoded")
        doubleNotEncoded = decoder.double("doubleNotEncoded")
        stringNotEncoded = decoder.string("stringNotEncoded")
        colorNotEncoded = decoder.nsCoding("nsCodingNotEncoded")
        boolNotEncoded = decoder.bool("boolNotEncoded")
    }

    func encode(encoder: Encoder) {
        encoder.addInteger(int, key: "int")
        encoder.addUnsignedInteger(uint, key: "uint")
        encoder.addFloat(float, key: "float")
        encoder.addDouble(double, key: "double")
        encoder.addString(string, key: "string")
        encoder.addNSCoding(color, key: "color")
        encoder.addBool(bool, key: "bool")
    }
}