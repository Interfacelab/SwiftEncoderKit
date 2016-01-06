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
    guard let rightValue = right.float(nil) else {
        return
    }

    left = rightValue
}

// MARK: Float Optional

func --> (left:Float?, right: Encoder) {
    right.addFloat(left)
}

func <-- (inout left:Float?, right: Decoder) {
    guard let rightValue = right.float(nil) else {
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
    guard let rightValue = right.floatArray(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional float arrays

func --> (left:Array<Float>?, right: Encoder) {
    right.addFloatArray(left)
}

func <-- (inout left:Array<Float>?, right: Decoder) {
    guard let rightValue = right.floatArray(nil) else {
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
    guard let rightValue = right.double(nil) else {
        return
    }

    left = rightValue
}

// MARK: Double Optional

func --> (left:Double?, right: Encoder) {
    right.addDouble(left)
}

func <-- (inout left:Double?, right: Decoder) {
    guard let rightValue = right.double(nil) else {
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
    guard let rightValue = right.doubleArray(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional double arrays

func --> (left:Array<Double>?, right: Encoder) {
    right.addDoubleArray(left)
}

func <-- (inout left:Array<Double>?, right: Decoder) {
    guard let rightValue = right.doubleArray(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Encoder

extension Encoder : FloatEncoding {
    // MARK: Float and Double

    func addFloat(float: Float?) {
        setValueForCurrentKey((float == nil) ? nil : NSNumber(float: float!))
    }

    func addFloatArray(floatArray: Array<Float>?) {
        setValueForCurrentKey(floatArray)
    }

    func addDouble(double: Double?) {
        setValueForCurrentKey((double == nil) ? nil : NSNumber(double: double!))
    }

    func addDoubleArray(doubleArray: Array<Double>?) {
        setValueForCurrentKey(doubleArray)
    }
}

// MARK: Decoder

extension Decoder : FloatEncoding {
    // MARK: Float and Double types

    func float(key: String?) -> Float? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? Float
    }

    func floatArray(key: String?) -> Array<Float>? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? Array<Float>
    }

    func double(key: String?) -> Double? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? Double
    }

    func doubleArray(key: String?) -> Array<Double>? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? Array<Double>
    }
}