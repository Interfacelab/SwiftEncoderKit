//
//  BasicTypesExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

protocol FloatEncoding {}

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

// MARK: Encoder

extension Encoder : FloatEncoding {
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
}

// MARK: Decoder

extension Decoder : FloatEncoding {
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

    func getFloatNamed(key: String) -> Float? {
        guard let val = valueForKey(key) as? NSNumber else {
            return nil
        }

        return val.floatValue
    }

    func getFloatArrayNamed(key: String) -> Array<Float>? {
        guard let val = valueForKey(key) as? Array<Float> else {
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

    func getDoubleNamed(key: String) -> Double? {
        guard let val = valueForKey(key) as? NSNumber else {
            return nil
        }

        return val.doubleValue
    }

    func getDoubleArrayNamed(key: String) -> Array<Double>? {
        guard let val = valueForKey(key) as? Array<Double> else {
            return nil
        }


        return val
    }
}