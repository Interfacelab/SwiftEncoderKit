//
//  BasicTypesExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation
import QuartzCore

protocol FloatEncoding {}

// MARK: Float

func --> (left:Float, right: Encoder) {
    right.addFloat(left, key: nil)
}

func <-- (inout left:Float, right: Decoder) {
    guard let rightValue = right.float(nil) else {
        return
    }

    left = rightValue
}

// MARK: Float Optional

func --> (left:Float?, right: Encoder) {
    right.addFloat(left, key: nil)
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
    right.addFloatArray(left, key: nil)
}

func <-- (inout left:Array<Float>, right: Decoder) {
    guard let rightValue = right.floatArray(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional float arrays

func --> (left:Array<Float>?, right: Encoder) {
    right.addFloatArray(left, key: nil)
}

func <-- (inout left:Array<Float>?, right: Decoder) {
    guard let rightValue = right.floatArray(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Float dictionaries

func --> (left: [String: Float], right: Encoder) {
    right.addFloatDictionary(left, key: nil)
}

func <-- (inout left: [String: Float], right: Decoder) {
    guard let rightValue: [String: Float] = right.floatDictionary(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional Float dictionaries

func --> (left: [String: Float]?, right: Encoder) {
    right.addFloatDictionary(left, key: nil)
}

func <-- (inout left: [String: Float]?, right: Decoder) {
    guard let rightValue: [String: Float] = right.floatDictionary(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: CGFloat

func --> (left:CGFloat, right: Encoder) {
    right.addCGFloat(left, key: nil)
}

func <-- (inout left:CGFloat, right: Decoder) {
    guard let rightValue = right.cgFloat(nil) else {
        return
    }

    left = rightValue
}

// MARK: CGFloat Optional

func --> (left:CGFloat?, right: Encoder) {
    right.addCGFloat(left, key: nil)
}

func <-- (inout left:CGFloat?, right: Decoder) {
    guard let rightValue = right.cgFloat(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: CGFloat arrays

func --> (left:Array<CGFloat>, right: Encoder) {
    right.addCGFloatArray(left, key: nil)
}

func <-- (inout left:Array<CGFloat>, right: Decoder) {
    guard let rightValue = right.cgFloatArray(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional CGFloat arrays

func --> (left:Array<CGFloat>?, right: Encoder) {
    right.addCGFloatArray(left, key: nil)
}

func <-- (inout left:Array<CGFloat>?, right: Decoder) {
    guard let rightValue = right.cgFloatArray(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: CGFloat dictionaries

func --> (left: [String: CGFloat], right: Encoder) {
    right.addCGFloatDictionary(left, key: nil)
}

func <-- (inout left: [String: CGFloat], right: Decoder) {
    guard let rightValue: [String: CGFloat] = right.cgFloatDictionary(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional CGFloat dictionaries

func --> (left: [String: CGFloat]?, right: Encoder) {
    right.addCGFloatDictionary(left, key: nil)
}

func <-- (inout left: [String: CGFloat]?, right: Decoder) {
    guard let rightValue: [String: CGFloat] = right.cgFloatDictionary(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Double

func --> (left:Double, right: Encoder) {
    right.addDouble(left, key: nil)
}

func <-- (inout left:Double, right: Decoder) {
    guard let rightValue = right.double(nil) else {
        return
    }

    left = rightValue
}

// MARK: Double Optional

func --> (left:Double?, right: Encoder) {
    right.addDouble(left, key: nil)
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
    right.addDoubleArray(left, key: nil)
}

func <-- (inout left:Array<Double>, right: Decoder) {
    guard let rightValue = right.doubleArray(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional double arrays

func --> (left:Array<Double>?, right: Encoder) {
    right.addDoubleArray(left, key: nil)
}

func <-- (inout left:Array<Double>?, right: Decoder) {
    guard let rightValue = right.doubleArray(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Double dictionaries

func --> (left: [String: Double], right: Encoder) {
    right.addDoubleDictionary(left, key: nil)
}

func <-- (inout left: [String: Double], right: Decoder) {
    guard let rightValue: [String: Double] = right.doubleDictionary(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional Double dictionaries

func --> (left: [String: Double]?, right: Encoder) {
    right.addDoubleDictionary(left, key: nil)
}

func <-- (inout left: [String: Double]?, right: Decoder) {
    guard let rightValue: [String: Double] = right.doubleDictionary(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Encoder

extension Encoder : FloatEncoding {
    // MARK: Float and Double

    func addFloat(float: Float?, key: String?) {
        let val: NSNumber? = (float == nil) ? nil : NSNumber(float: float!)

        if key == nil {
            setValueForCurrentKey(val)
        } else {
            setValue(key!, value: val)
        }
    }

    func addFloatArray(floatArray: Array<Float>?, key: String?) {
        if key == nil {
            setValueForCurrentKey(floatArray)
        } else {
            setValue(key!, value: floatArray)
        }
    }

    func addFloatDictionary(floatDict: [String: Float]?, key: String?) {
        if key == nil {
            setValueForCurrentKey(floatDict)
        } else {
            setValue(key!, value: floatDict)
        }
    }

    // MARK: CGFloat

    func addCGFloat(float: CGFloat?, key: String?) {
        let val: NSNumber? = (float == nil) ? nil : NSNumber(float: Float(float!))

        if key == nil {
            setValueForCurrentKey(val)
        } else {
            setValue(key!, value: val)
        }
    }

    func addCGFloatArray(floatArray: Array<CGFloat>?, key: String?) {
        if key == nil {
            setValueForCurrentKey(floatArray)
        } else {
            setValue(key!, value: floatArray)
        }
    }

    func addCGFloatDictionary(floatDict: [String: CGFloat]?, key: String?) {
        if key == nil {
            setValueForCurrentKey(floatDict)
        } else {
            setValue(key!, value: floatDict)
        }
    }

    // MARK: Double

    func addDouble(double: Double?, key: String?) {
        let val: NSNumber? = (double == nil) ? nil : NSNumber(double: double!)

        if key == nil {
            setValueForCurrentKey(val)
        } else {
            setValue(key!, value: val)
        }
    }

    func addDoubleArray(doubleArray: Array<Double>?, key: String?) {
        if key == nil {
            setValueForCurrentKey(doubleArray)
        } else {
            setValue(key!, value: doubleArray)
        }
    }

    func addDoubleDictionary(doubleDict: [String: Double]?, key: String?) {
        if key == nil {
            setValueForCurrentKey(doubleDict)
        } else {
            setValue(key!, value: doubleDict)
        }
    }
}

// MARK: Decoder

extension Decoder : FloatEncoding {
    // MARK: Float

    func float(key: String?) -> Float? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? Float
    }

    func floatArray(key: String?) -> Array<Float>? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? Array<Float>
    }

    func floatDictionary(key: String?) -> [String: Float]? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? [String: Float]
    }

    // MARK: CGFloat

    func cgFloat(key: String?) -> CGFloat? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? CGFloat
    }

    func cgFloatArray(key: String?) -> Array<CGFloat>? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? Array<CGFloat>
    }

    func cgFloatDictionary(key: String?) -> [String: CGFloat]? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? [String: CGFloat]
    }

    // MARK: Double

    func double(key: String?) -> Double? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? Double
    }

    func doubleArray(key: String?) -> Array<Double>? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? Array<Double>
    }

    func doubleDictionary(key: String?) -> [String: Double]? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? [String: Double]
    }
}