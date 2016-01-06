//
//  ImmutableStruct.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

struct ImmutableStruct : Encodable {
    let int: Int
    let bool: Bool
    let string: String
    let float: Float
    let double: Double
    let uint: UInt

    let intArray: [Int]
//    let boolArray: [Bool]
//    let stringArray: [String]
//    let floatArray: [Float]
//    let doubleArray: [Double]
//    let uintArray: [UInt]

    init(int: Int, bool: Bool, string: String, float: Float, double: Double, uint: UInt,
        intArray:[Int]) {
            self.int = int
            self.bool = bool
            self.string = string
            self.float = float
            self.double = double
            self.uint = uint
            self.intArray = intArray
    }

    init?(_ decoder: Decoder) {
        int = decoder.integer("int") ?? 0
        bool = decoder.bool("bool") ?? false
        string = decoder.getStringNamed("string") ?? "Hello"
        float = decoder.float("float") ?? 0.0
        double = decoder.double("double") ?? 0.0
        uint = decoder.unsignedInteger("uint") ?? 0

        intArray = decoder.integerArray("intArray") ?? []
    }

    func encode(encoder: Encoder) {
        int     --> encoder["int"]
        bool    --> encoder["bool"]
        string  --> encoder["string"]
        float   --> encoder["float"]
        double  --> encoder["double"]
        uint    --> encoder["uint"]

        intArray    --> encoder["intArray"]
//        boolArray   --> encoder["boolArray"]
//        stringArray --> encoder["stringArray"]
//        floatArray  --> encoder["floatArray"]
//        doubleArray --> encoder["doubleArray"]
//        uintArray   --> encoder["uintArray"]
    }
}