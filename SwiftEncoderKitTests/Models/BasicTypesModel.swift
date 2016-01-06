//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//


class BasicTypesModel: Encodable {
    var float: Float = 1
    var floatOpt: Float?
    var floatOptNil: Float? = 2

    var double: Double = 1
    var doubleOpt: Double?
    var doubleOptNil: Double? = 2

    var bool: Bool = false
    var boolOpt: Bool?
    var boolOptNil: Bool? = false

    var string: String = "Hello"
    var stringOpt: String?
    var stringOptNil: String? = "World"

    var floatA: [Float] = [1.0, 2.0, 3.0]
    var floatAOpt: [Float]?
    var floatAOptNil: [Float]? = [1.0, 2.0, 3.0]

    var doubleA: [Double] = [1.0, 2.0, 3.0]
    var doubleAOpt: [Double]?
    var doubleAOptNil: [Double]? = [1.0, 2.0, 3.0]

    var boolA: [Bool] = [false, true, false]
    var boolAOpt: [Bool]?
    var boolAOptNil: [Bool]? = [true, false, true]

    var stringA: [String] = ["the", "quick", "brown", "fox"]
    var stringAOpt: [String]?
    var stringAOptNil: [String]? = ["jumped", "over", "the", "fence"]

    init() {

    }

    required init?(_ decoder: Decoder) {
        float           <-- decoder["float"]
        floatOpt        <-- decoder["floatOpt"]
        floatOptNil     <-- decoder["floatOptNil"]

        double          <-- decoder["double"]
        doubleOpt       <-- decoder["doubleOpt"]
        doubleOptNil    <-- decoder["doubleOptNil"]

        bool            <-- decoder["bool"]
        boolOpt         <-- decoder["boolOpt"]
        boolOptNil      <-- decoder["boolOptNil"]

        string          <-- decoder["string"]
        stringOpt       <-- decoder["stringOpt"]
        stringOptNil    <-- decoder["stringOptNil"]

        floatA          <-- decoder["floatA"]
        floatAOpt       <-- decoder["floatAOpt"]
        floatAOptNil    <-- decoder["floatAOptNil"]

        doubleA         <-- decoder["doubleA"]
        doubleAOpt      <-- decoder["doubleAOpt"]
        doubleAOptNil   <-- decoder["doubleAOptNil"]

        boolA           <-- decoder["boolA"]
        boolAOpt        <-- decoder["boolAOpt"]
        boolAOptNil     <-- decoder["boolAOptNil"]

        stringA         <-- decoder["stringA"]
        stringAOpt      <-- decoder["stringAOpt"]
        stringAOptNil   <-- decoder["stringAOptNil"]
    }

    func encode(encoder: Encoder) {
        float           --> encoder["float"]
        floatOpt        --> encoder["floatOpt"]
        floatOptNil     --> encoder["floatOptNil"]

        double          --> encoder["double"]
        doubleOpt       --> encoder["doubleOpt"]
        doubleOptNil    --> encoder["doubleOptNil"]

        bool            --> encoder["bool"]
        boolOpt         --> encoder["boolOpt"]
        boolOptNil      --> encoder["boolOptNil"]

        string          --> encoder["string"]
        stringOpt       --> encoder["stringOpt"]
        stringOptNil    --> encoder["stringOptNil"]

        floatA          --> encoder["floatA"]
        floatAOpt       --> encoder["floatAOpt"]
        floatAOptNil    --> encoder["floatAOptNil"]

        doubleA         --> encoder["doubleA"]
        doubleAOpt      --> encoder["doubleAOpt"]
        doubleAOptNil   --> encoder["doubleAOptNil"]

        boolA           --> encoder["boolA"]
        boolAOpt        --> encoder["boolAOpt"]
        boolAOptNil     --> encoder["boolAOptNil"]
        
        stringA         --> encoder["stringA"]
        stringAOpt      --> encoder["stringAOpt"]
        stringAOptNil   --> encoder["stringAOptNil"]
    }
}
