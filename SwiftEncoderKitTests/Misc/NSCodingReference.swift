//
//  NSCodingReference.swift
//  SwiftEncoderKit
//
//  Created by Jon Gilkison on 1/3/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


import UIKit
import AVFoundation

/// The purpose of this class is to highlight what is encodable/decodable by NSCoder by default
class NSCodingReference : NSObject, NSCoding {

    // MARK: Basic types

    var int: Int = 0
    var int8: Int8 = 0
    var int16: Int16 = 0
    var int32: Int32 = 0
    var int64: Int64 = 0

    var uint: UInt = 0
    var uint8: UInt8 = 0
    var uint16: UInt16 = 0
    var uint32: UInt32 = 0
    var uint64: UInt64 = 0

    var float: Float = 0
    var double: Double = 0

    var string: String = "Hello"
    var bool: Bool = false

    // MARK: Basic array types

    var intA: [Int] = [0]
    var int8A: [Int8] = [0]
    var int16A: [Int16] = [0]
    var int32A: [Int32] = [0]
    var int64A: [Int64] = [0]

    var uintA: [UInt] = [0]
    var uint8A: [UInt8] = [0]
    var uint16A: [UInt16] = [0]
    var uint32A: [UInt32] = [0]
    var uint64A: [UInt64] = [0]

    var floatA: [Float] = [0]
    var doubleA: [Double] = [0]

    var stringA: [String] = ["Hello"]
    var boolA: [Bool] = [false]

    // MARK: Basic dictionary types

    var intD: [String: Int] = ["a": 0]
    var int8D: [String: Int8] = ["a": 0]
    var int16D: [String: Int16] = ["a": 0]
    var int32D: [String: Int32] = ["a": 0]
    var int64D: [String: Int64] = ["a": 0]

    var uintD: [String: UInt] = ["a": 0]
    var uint8D: [String: UInt8] = ["a": 0]
    var uint16D: [String: UInt16] = ["a": 0]
    var uint32D: [String: UInt32] = ["a": 0]
    var uint64D: [String: UInt64] = ["a": 0]

    var floatD: [String: Float] = ["a": 0]
    var doubleD: [String: Double] = ["a": 0]

    var stringD: [String: String] = ["a": "Hello"]
    var boolD: [String: Bool] = ["a": false]

    // MARK: Enums

    var intEnum: IntEnum = IntEnum.value1
    var noRawValueEnum: NoRawValueEnum = NoRawValueEnum.value1
    var stringEnum: StringEnum = StringEnum.value1
    var indirectEnum: IndirectEnum = IndirectEnum.value2(IndirectEnum.value1(5))


    override init() {

    }

    required convenience init?(coder aDecoder: NSCoder) {
        self.init()

        int = aDecoder.decodeIntegerForKey("int")
        int32 = aDecoder.decodeIntForKey("int32")
        int64 = aDecoder.decodeInt64ForKey("int64")

        float = aDecoder.decodeFloatForKey("float")
        double = aDecoder.decodeDoubleForKey("double")
        string = aDecoder.decodeObjectForKey("string") as! String
        bool = aDecoder.decodeBoolForKey("bool")

        intA = aDecoder.decodeObjectForKey("intA") as! [Int]
        uintA = aDecoder.decodeObjectForKey("uintA") as! [UInt]
        floatA = aDecoder.decodeObjectForKey("floatA") as! [Float]
        doubleA = aDecoder.decodeObjectForKey("doubleA") as! [Double]
        stringA = aDecoder.decodeObjectForKey("stringA") as! [String]
        boolA = aDecoder.decodeObjectForKey("boolA") as! [Bool]

        intD = aDecoder.decodeObjectForKey("intD") as! [String: Int]
        uintD = aDecoder.decodeObjectForKey("uintD") as! [String: UInt]
        floatD = aDecoder.decodeObjectForKey("floatD") as! [String: Float]
        doubleD = aDecoder.decodeObjectForKey("doubleD") as! [String: Double]
        stringD = aDecoder.decodeObjectForKey("stringD") as! [String: String]
        boolD = aDecoder.decodeObjectForKey("boolD") as! [String: Bool]

        intEnum = IntEnum(rawValue: aDecoder.decodeIntegerForKey("intEnum"))!
        stringEnum = StringEnum(rawValue: aDecoder.decodeObjectForKey("stringEnum") as! String)!
    }

    func encodeWithCoder(aCoder: NSCoder) {
        /** Basic Types */

        // We can encode Int, Int32, Int64 - but Int8 and Int16 have to be cast to Int
        aCoder.encodeInteger(int, forKey: "int")
        //int8
        //int16
        aCoder.encodeInt(int32, forKey: "int32")
        aCoder.encodeInt64(int64, forKey: "int64")

        // Can't encode unsigned integers without wrapping in NSNumber instance.  We can't cast
        // to Int either for obvious reasons
        //uint
        //uint8
        //uint16
        //uint32
        //uint64

        aCoder.encodeFloat(float, forKey: "float")
        aCoder.encodeDouble(double, forKey: "double")
        aCoder.encodeObject(string, forKey: "string")
        aCoder.encodeBool(bool, forKey:  "bool")


        /** Basic Array Types */

        // We can encode Array<Int> but not Array<Int8>, etc.
        aCoder.encodeObject(intA, forKey: "intA")
        // int8A
        // int16A
        // int32A
        // int64A

        // We can encode Array<UInt> but not Array<UInt8>, etc.
        aCoder.encodeObject(uintA, forKey: "uintA")
        // uint8A
        // uint16A
        // uint32A
        // uint64A

        aCoder.encodeObject(floatA, forKey: "floatA")
        aCoder.encodeObject(doubleA, forKey: "doubleA")
        aCoder.encodeObject(stringA, forKey: "stringA")
        aCoder.encodeObject(boolA, forKey: "boolA")


        /** Basic Dictionary Types */

        // We can encode [String: Int] but not [String: Int8], etc.
        aCoder.encodeObject(intD, forKey: "intD")
        // int8A
        // int16A
        // int32A
        // int64A

        // We can encode [String: UInt] but not [String: UInt8], etc.
        aCoder.encodeObject(uintD, forKey: "uintD")
        // uint8A
        // uint16A
        // uint32A
        // uint64A

        aCoder.encodeObject(floatD, forKey: "floatD")
        aCoder.encodeObject(doubleD, forKey: "doubleD")
        aCoder.encodeObject(stringD, forKey: "stringD")
        aCoder.encodeObject(boolD, forKey: "boolD")


        /** Enum Types */

        // To encode enums, they must have a defined RawValue
        // noRawValueEnum
        // indirectEnum

        aCoder.encodeInteger(intEnum.rawValue, forKey: "intEnum")
        aCoder.encodeObject(stringEnum.rawValue, forKey: "stringEnum")


        /** Swift Structs */

        // Nope
    }
}