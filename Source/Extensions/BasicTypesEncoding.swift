//
//  BasicTypesExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

protocol BasicTypesEncoding {}

// MARK: Float

func --> (left:Float, right: Encoder) {
    right.addFloat(left)
}

func <-- (inout left:Float, right: Decoder) {
    guard let rightValue = right.getFloatValue() else {
        return
    }

    left = rightValue
}

// MARK: Float Optional

func --> (left:Float?, right: Encoder) {
    right.addFloat(left)
}

func <-- (inout left:Float?, right: Decoder) {
    guard let rightValue = right.getFloatValue() else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Float arrays

func --> (left:Array<Float>, right: Encoder) {
    right.addFloatArray(left)
}

func <-- (inout left:Array<Float>, right: Decoder) {
    guard let rightValue = right.getFloatArray() else {
        return
    }

    left = rightValue
}

// MARK: Optional float arrays

func --> (left:Array<Float>?, right: Encoder) {
    right.addFloatArray(left)
}

func <-- (inout left:Array<Float>?, right: Decoder) {
    guard let rightValue = right.getFloatArray() else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Double

func --> (left:Double, right: Encoder) {
    right.addDouble(left)
}

func <-- (inout left:Double, right: Decoder) {
    guard let rightValue = right.getDoubleValue() else {
        return
    }

    left = rightValue
}

// MARK: Double Optional

func --> (left:Double?, right: Encoder) {
    right.addDouble(left)
}

func <-- (inout left:Double?, right: Decoder) {
    guard let rightValue = right.getDoubleValue() else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Double arrays

func --> (left:Array<Double>, right: Encoder) {
    right.addDoubleArray(left)
}

func <-- (inout left:Array<Double>, right: Decoder) {
    guard let rightValue = right.getDoubleArray() else {
        return
    }

    left = rightValue
}

// MARK: Optional double arrays

func --> (left:Array<Double>?, right: Encoder) {
    right.addDoubleArray(left)
}

func <-- (inout left:Array<Double>?, right: Decoder) {
    guard let rightValue = right.getDoubleArray() else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Bool

func --> (left:Bool, right: Encoder) {
    right.addBool(left)
}

func <-- (inout left:Bool, right: Decoder) {
    guard let rightValue = right.getBoolValue() else {
        return
    }

    left = rightValue
}

// MARK: Bool Optional

func --> (left:Bool?, right: Encoder) {
    right.addBool(left)
}

func <-- (inout left:Bool?, right: Decoder) {
    guard let rightValue = right.getBoolValue() else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Bool arrays

func --> (left:Array<Bool>, right: Encoder) {
    right.addBoolArray(left)
}

func <-- (inout left:Array<Bool>, right: Decoder) {
    guard let rightValue = right.getBoolArray() else {
        return
    }

    left = rightValue
}

// MARK: Optional bool arrays

func --> (left:Array<Bool>?, right: Encoder) {
    right.addBoolArray(left)
}

func <-- (inout left:Array<Bool>?, right: Decoder) {
    guard let rightValue = right.getBoolArray() else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: String

func --> (left:String, right: Encoder) {
    right.addString(left)
}

func <-- (inout left:String, right: Decoder) {
    guard let rightValue = right.getStringValue() else {
        return
    }

    left = rightValue
}

// MARK: String Optional

func --> (left:String?, right: Encoder) {
    right.addString(left)
}

func <-- (inout left:String?, right: Decoder) {
    guard let rightValue = right.getStringValue() else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: String arrays

func --> (left:Array<String>, right: Encoder) {
    right.addStringArray(left)
}

func <-- (inout left:Array<String>, right: Decoder) {
    guard let rightValue = right.getStringArray() else {
        return
    }

    left = rightValue
}

// MARK: Optional bool arrays

func --> (left:Array<String>?, right: Encoder) {
    right.addStringArray(left)
}

func <-- (inout left:Array<String>?, right: Decoder) {
    guard let rightValue = right.getStringArray() else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Encoder

extension Encoder : BasicTypesEncoding {
    // MARK: Float and Double

    func addFloat(float: Float?) {
        if float != nil {
            setValueForCurrentKey(NSNumber(float: float!))
        } else {
            setValueForCurrentKey(nil)
        }
    }

    func addFloatArray(floatArray: Array<Float>?) {
        guard let array = floatArray else {
            setValueForCurrentKey(nil)
            return
        }

        setValueForCurrentKey(array)
    }

    func addDouble(double: Double?) {
        if double != nil {
            setValueForCurrentKey(NSNumber(double: double!))
        } else {
            setValueForCurrentKey(nil)
        }
    }

    func addDoubleArray(doubleArray: Array<Double>?) {
        guard let array = doubleArray else {
            setValueForCurrentKey(nil)
            return
        }

        setValueForCurrentKey(array)
    }

    // MARK: Basic Types

    func addBool(bool: Bool?) {
        if bool != nil {
            setValueForCurrentKey(NSNumber(bool: bool!))
        } else {
            setValueForCurrentKey(nil)
        }
    }

    func addBoolArray(doubleArray: Array<Bool>?) {
        guard let array = doubleArray else {
            setValueForCurrentKey(nil)
            return
        }

        setValueForCurrentKey(array)
    }

    func addString(string: String?) {
        if string != nil {
            setValueForCurrentKey(string)
        } else {
            setValueForCurrentKey(nil)
        }
    }

    func addStringArray(doubleArray: Array<String>?) {
        guard let array = doubleArray else {
            setValueForCurrentKey(nil)
            return
        }

        setValueForCurrentKey(array)
    }
}

// MARK: Decoder

extension Decoder : BasicTypesEncoding {
    // MARK: Float and Double types

    func getFloatValue() -> Float? {
        guard let val = valueForCurrentKey() as? NSNumber else {
            return nil
        }

        return val.floatValue
    }

    func getFloatArray() -> Array<Float>? {
        guard let val = valueForCurrentKey() as? Array<Float> else {
            return nil
        }


        return val
    }

    func getDoubleValue() -> Double? {
        guard let val = valueForCurrentKey() as? NSNumber else {
            return nil
        }

        return val.doubleValue
    }

    func getDoubleArray() -> Array<Double>? {
        guard let val = valueForCurrentKey() as? Array<Double> else {
            return nil
        }


        return val
    }


    // MARK: Basic Types

    func getBoolValue() -> Bool? {
        guard let val = valueForCurrentKey() as? NSNumber else {
            return nil
        }

        return val.boolValue
    }

    func getBoolArray() -> Array<Bool>? {
        guard let val = valueForCurrentKey() as? Array<Bool> else {
            return nil
        }


        return val
    }

    func getStringValue() -> String? {
        guard let val = valueForCurrentKey() as? String else {
            return nil
        }

        return val
    }

    func getStringArray() -> Array<String>? {
        guard let val = valueForCurrentKey() as? Array<String> else {
            return nil
        }


        return val
    }
}